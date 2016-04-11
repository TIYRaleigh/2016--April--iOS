//
//  CalculatorBrain+Extras.h
//  High Voltage
//
//  Created by Ben Gohlke on 3/10/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VoltageCalculatorTableViewController.h"

@interface ElectricityConversions : NSObject

@property (assign) BOOL allValuesFound;

@property (strong, nonatomic) NSString *ampsString;
@property (strong, nonatomic) NSString *ohmsString;
@property (strong, nonatomic) NSString *voltsString;
@property (strong, nonatomic) NSString *wattsString;

@property (strong, nonatomic) id<ElectricityConversionsDelegate> delegate;

- (void)findOtherValuesIfPossible;

@end
