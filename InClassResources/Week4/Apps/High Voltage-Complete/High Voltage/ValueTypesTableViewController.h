//
//  ValueTypesTableViewController.h
//  High Voltage
//
//  Created by Ben Gohlke on 3/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VoltageCalculatorTableViewController.h"

@interface ValueTypesTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *valueTypes;
@property (strong, nonatomic) id<ValueTypesViewControllerDelegate> delegate;

@end
