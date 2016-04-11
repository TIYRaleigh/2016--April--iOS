//
//  Weather.h
//  Forecaster
//
//  Created by Ben Gohlke on 3/22/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (assign) double temperature;
@property (assign) double apparentTemperature;
@property (assign) double dewPoint;
@property (assign) double humidity;
@property (assign) double precipProbability;
@property (assign) double windSpeed;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *icon;

- (NSString *)currentTemperature;
- (NSString *)feelsLikeTemperature;
- (NSString *)dewPointTemperature;
- (NSString *)humidityPercentage;
- (NSString *)chanceOfRain;
- (NSString *)windSpeedMPH;

- (BOOL)parseWeatherInfo:(NSDictionary *)infoDictionary;

@end
