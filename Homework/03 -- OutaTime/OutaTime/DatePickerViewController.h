//
//  TimePickerViewController.h
//  OutaTime
//
//  Created by Ben Gohlke on 2/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeCircuitsViewController.h"

@interface DatePickerViewController : UIViewController

@property (strong, nonatomic) id<TimeCircuitsDatePickerDelegate> delegate;

@end