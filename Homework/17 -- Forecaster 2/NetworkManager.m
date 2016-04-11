//
//  NetworkManager.m
//  Forecaster
//
//  Created by Ben Gohlke on 3/21/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "NetworkManager.h"

typedef enum {
    DataFetchTypeCoordinates,
    DataFetchTypeWeather
} DataFetchType;

@interface NetworkManager () <NSURLSessionDataDelegate>
{
    id returnObject;
    NSMutableData *receivedData;
    NSURLSessionConfiguration *configuration;
    NSURLSession *session;
}

@property (assign) DataFetchType dataFetchType;

@end

@implementation NetworkManager

static NSString *gMapsBaseURL = @"http://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:%@&sensor=false";
static NSString *forecastIoBaseURL = @"https://api.forecast.io/forecast/b9f65ac761fd049357ce0af9961972ed/%f,%f";


+ (NetworkManager *)sharedNetworkManager
{
    static NetworkManager *sharedNetworkManager = nil;
    if (sharedNetworkManager)
        return sharedNetworkManager;
    
    // Use Grand Central Dispatch to only init one instance of NetworkManager, makes the singleton thread-safe
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedNetworkManager = [[NetworkManager alloc] init];
    });
    
    return sharedNetworkManager;
}

- (void)findCoordinatesForCity:(City *)aCity
{
    self.dataFetchType = DataFetchTypeCoordinates;
    returnObject = nil;
    returnObject = aCity;
    
    NSString *googleMapsUrlString = [NSString stringWithFormat:gMapsBaseURL, aCity.zipCode];
    NSURL *url = [NSURL URLWithString:googleMapsUrlString];

    [self launchUrlSessionWithUrl:url];
}

- (void)fetchCurrentWeatherForCity:(City *)aCity
{
    self.dataFetchType = DataFetchTypeWeather;
    returnObject = nil;
    returnObject = aCity;
    
    NSString *forecastIoUrlString = [NSString stringWithFormat:forecastIoBaseURL, aCity.latitude, aCity.longitude];
    NSURL *url = [NSURL URLWithString:forecastIoUrlString];
    [self launchUrlSessionWithUrl:url];
}

- (void)launchUrlSessionWithUrl:(NSURL *)url
{
    if (!configuration)
    {
        configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    }
    if (!session)
    {
        session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url];
    receivedData = nil;
    [dataTask resume];
}

#pragma mark - NSURLSession delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition))completionHandler
{
    completionHandler(NSURLSessionResponseAllow);
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        [receivedData appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (!error)
    {
        NSDictionary *aDictionary = [NSJSONSerialization JSONObjectWithData:receivedData options:0 error:nil];
        City *aCity;
        Weather *currentConditions;
        BOOL coordinatesSuccess = NO;
        BOOL weatherSuccess = NO;
        switch (self.dataFetchType)
        {
            case DataFetchTypeCoordinates:
                aCity = (City *)returnObject;
                coordinatesSuccess = [aCity parseCoordinateInfo:aDictionary];
                break;
            case DataFetchTypeWeather:
                aCity = (City *)returnObject;
                currentConditions = aCity.currentWeather;
                weatherSuccess = [currentConditions parseWeatherInfo:aDictionary];
                break;
                
            default:
                break;
        }
        
        if (coordinatesSuccess)
        {
            [self.delegate cityWasFound:returnObject];
        }
        if (weatherSuccess)
        {
            [self.delegate weatherWasFoundForCity:returnObject];
        }
    }
}

@end
