//
//  PinsViewController.m
//  Pickit
//
//  Created by Ben Gohlke on 4/6/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "PinsViewController.h"
#import "ImageDetailViewController.h"

#import "Picmark.h"

@import MapKit;
@import CoreLocation;
@import CloudKit;

#define LAT_LNG_DEGREES 0.2

@interface PinsViewController () <CLLocationManagerDelegate, MKMapViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (void)addPhotoTapped:(UIBarButtonItem *)sender;

@end

@implementation PinsViewController
{
    MKMapView *_mapView;
    CLLocationManager *_locationManager;
    CLLocation *_currentLocation;
    
    NSMutableArray *_picmarks;
    
    CKContainer *_container;
    CKDatabase *_publicDB;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkLocationAuthorization];
    
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _mapView.delegate = self;
    [self.view addSubview:_mapView];
    
    _picmarks = [[NSMutableArray alloc] init];
    
    _container = [CKContainer defaultContainer];
    _publicDB = _container.publicCloudDatabase;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(checkLocationAuthorization)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPhotoTapped:)];
}

- (void)refreshPicmarks
{
    if (_currentLocation)
    {
        CGFloat radius = 10000.0; //meters
        CKQuery *query = [[CKQuery alloc] initWithRecordType:@"Picmark" predicate:[NSPredicate predicateWithFormat:@"distanceToLocation:fromLocation:(%K,%@) < %f", @"Location", _currentLocation, radius]];
        [_publicDB performQuery:query inZoneWithID:nil completionHandler:^(NSArray *results, NSError *error) {
            
            if (error)
            {
                NSLog(@"%@", error.localizedDescription);
            }
            else
            {
                [_mapView removeAnnotations:_picmarks];
                [_picmarks removeAllObjects];
                for (CKRecord *aRecord in results)
                {
                    Picmark *aPicmark = [[Picmark alloc] initWithRecord:aRecord];
                    [_picmarks addObject:aPicmark];
                }
                [_mapView addAnnotations:_picmarks];
            }
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CLLocation related methods

- (void)checkLocationAuthorization
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusRestricted)
    {
        if (!_locationManager)
        {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.delegate = self;
            _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)
            {
                [_locationManager requestWhenInUseAuthorization];
            }
            else
            {
                [self enableLocationManager:YES];
            }
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self enableLocationManager:YES];
    }
}

- (void)enableLocationManager:(BOOL)enable
{
    if (_locationManager)
    {
        [_locationManager stopUpdatingLocation];
        if (enable)
            [_locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error != kCLErrorLocationUnknown)
    {
        [self enableLocationManager:NO];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation = [locations lastObject];
    [manager stopUpdatingLocation];
    MKCoordinateRegion mapRegion = MKCoordinateRegionMake(currentLocation.coordinate, MKCoordinateSpanMake(LAT_LNG_DEGREES, LAT_LNG_DEGREES));
    [_mapView setRegion:mapRegion];
    _currentLocation = currentLocation;
    [self refreshPicmarks];
}

#pragma mark - MKMapView delegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
    
    if (pinAnnotationView)
    {
        [pinAnnotationView prepareForReuse];
    }
    else
    {
        pinAnnotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
    }
    
    pinAnnotationView.canShowCallout = YES;
    
    Picmark *aPicmark = (Picmark *)annotation;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32.0, 32.0)];
    [imageView setImage:[aPicmark image]];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    pinAnnotationView.leftCalloutAccessoryView = imageView;
    UIButton *disclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    pinAnnotationView.rightCalloutAccessoryView = disclosureButton;
    [disclosureButton addTarget:self action:@selector(showFullSizeImage) forControlEvents:UIControlEventTouchUpInside];
    
    return pinAnnotationView;
}

#pragma mark - Action handlers

- (void)addPhotoTapped:(UIBarButtonItem *)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.delegate = self;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
}

- (void)showFullSizeImage
{
    Picmark *annotation = [_mapView selectedAnnotations][0];
    
    ImageDetailViewController *imageDetailVC = [[ImageDetailViewController alloc] init];
    imageDetailVC.image = annotation.image;
    
    [self.navigationController pushViewController:imageDetailVC animated:YES];
}

#pragma mark - UIImagePickerController delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        Picmark *aPicmark = [[Picmark alloc] initWithLocation:_currentLocation andImage:image];
        [_picmarks addObject:aPicmark];
        [_mapView addAnnotation:aPicmark];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsPath = paths[0];
        NSString *fullPath = [documentsPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.png", aPicmark.uuid]];
        NSData *imageData = UIImagePNGRepresentation(image);
        [imageData writeToFile:fullPath atomically:YES];
        
        CKRecord *aRecord = [[CKRecord alloc] initWithRecordType:@"Picmark"];
        [aRecord setObject:_currentLocation forKey:@"Location"];
        CKAsset *anAsset = [[CKAsset alloc] initWithFileURL:[NSURL fileURLWithPath:fullPath]];
        [aRecord setObject:anAsset forKey:@"Image"];
        [aRecord setObject:@"A picmark" forKey:@"Title"];
        [_publicDB saveRecord:aRecord completionHandler:^(CKRecord *record, NSError *error) {
        }];
        
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
