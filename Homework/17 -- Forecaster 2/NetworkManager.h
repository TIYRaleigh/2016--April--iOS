//
//  NetworkManager.h
//  Forecaster
//
//  Created by Ben Gohlke on 3/21/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CitiesTableViewController.h"
#import "City.h"

@interface NetworkManager : NSObject

@property (strong, nonatomic) id<CitiesTableViewControllerDelegate> delegate;

// Class method to access the singleton object
+ (NetworkManager *)sharedNetworkManager;

// Called with freshly created city object that only contains a zipcode, returns a full city object using the above delegate
- (void)findCoordinatesForCity:(City *)aCity;

// Called with a full city object, returns a city object with an attached weather object using the above delegate
- (void)fetchCurrentWeatherForCity:(City *)aCity;

@end
