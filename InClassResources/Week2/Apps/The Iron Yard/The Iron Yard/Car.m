//
//  Car.m
//  The Iron Yard
//
//  Created by Ben Gohlke on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Car.h"

@interface Car ()
{
    float odometer;
    float fuelLevel;
    
    int numberOfWheels;
}

@end

@implementation Car

- (instancetype)initWithMake:(NSString *)make model:(NSString *)model andColor:(NSString *)color
{
    self = [super init];
    if (self)
    {
        odometer = 0.0;
        fuelLevel = 1.0;
        numberOfWheels = 4;
        
        _make = make;
        _model = model;
        _color = color;
    }
    
    return self;
}

- (instancetype)init
{
    return [self initWithMake:@"" model:@"" andColor:@""];
}


- (BOOL)drive
{
    BOOL returnValue = NO;
    
    if (numberOfWheels == 4 && fuelLevel >= 0.2)
    {
        odometer = odometer + 5;
        fuelLevel = fuelLevel - 0.2;
        returnValue = YES;
    }
    
    return returnValue;
}

@end
