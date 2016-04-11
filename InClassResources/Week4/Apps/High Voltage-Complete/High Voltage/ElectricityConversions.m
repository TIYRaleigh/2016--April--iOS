//
//  CalculatorBrain+Extras.m
//  High Voltage
//
//  Created by Ben Gohlke on 3/10/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "ElectricityConversions.h"

@implementation ElectricityConversions

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _allValuesFound = NO;
    }
    
    return self;
}

- (void)findOtherValuesIfPossible
{
    int count = 0;
    if (self.ampsString && ![self.ampsString isEqualToString:@""])
    {
        count++;
    }
    if (self.ohmsString && ![self.ohmsString isEqualToString:@""])
    {
        count++;
    }
    if (self.voltsString && ![self.voltsString isEqualToString:@""])
    {
        count++;
    }
    if (self.wattsString && ![self.wattsString isEqualToString:@""])
    {
        count++;
    }
    
    if (count >= 2)
    {
        [self calculateAllValues];
    }
}

- (void)calculateAllValues
{
    float amps = 0, ohms = 0, volts = 0, watts = 0;
    
    if (self.ohmsString && self.voltsString)
    {
        ohms = [self.ohmsString floatValue];
        volts = [self.voltsString floatValue];
        amps = volts / ohms;
        watts = volts * amps;
    }
    else if (self.ohmsString && self.ampsString)
    {
        amps = [self.ampsString floatValue];
        ohms = [self.ohmsString floatValue];
        volts = amps * ohms;
        watts = volts * amps;
    }
    else if (self.ohmsString && self.wattsString)
    {
        ohms = [self.ohmsString floatValue];
        watts = [self.wattsString floatValue];
        amps =  sqrtf(watts / ohms);
        volts = amps * ohms;
    }
    else if (self.ampsString && self.voltsString)
    {
        amps = [self.ampsString floatValue];
        volts = [self.voltsString floatValue];
        ohms = volts / amps;
        watts = volts * amps;
    }
    else if (self.ampsString && self.wattsString)
    {
        amps = [self.ampsString floatValue];
        watts = [self.wattsString floatValue];
        volts = watts / amps;
        ohms = volts / amps;
    }
    else if (self.voltsString && self.wattsString)
    {
        volts = [self.voltsString floatValue];
        watts = [self.wattsString floatValue];
        amps = watts / volts;
        ohms = volts / amps;
    }
    
    self.voltsString = [NSString stringWithFormat:@"%g", volts];
    self.ampsString = [NSString stringWithFormat:@"%g", amps];
    self.ohmsString = [NSString stringWithFormat:@"%g", ohms];
    self.wattsString = [NSString stringWithFormat:@"%g", watts];
    
    self.allValuesFound = YES;
    
    [self.delegate valuesWereCalculated];
}

@end