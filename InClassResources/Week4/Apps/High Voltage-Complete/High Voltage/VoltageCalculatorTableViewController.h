//
//  VoltageCalculatorTableViewController.h
//  High Voltage
//
//  Created by Ben Gohlke on 3/10/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ValueTypesViewControllerDelegate

- (void)valueTypeWasChosen:(NSString *)chosenValueType;

@end

@protocol ElectricityConversionsDelegate

- (void)valuesWereCalculated;

@end

@interface VoltageCalculatorTableViewController : UITableViewController <ValueTypesViewControllerDelegate, ElectricityConversionsDelegate>

@end
