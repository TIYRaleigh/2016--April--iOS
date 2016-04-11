//
//  TimeCircuitsViewController.h
//  OutaTime
//
//  Created by Ben Gohlke on 2/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TimeCircuitsDatePickerDelegate

- (void)destinationDateWasChosen:(NSDate *)destinationDate;

@end

//
// 9. The TimeCircuitsViewController needs to implement the delegate protocol to receive the destination date from the picker
//    view. The way to declare a class as a delegate is to put the name of the delegate in between <>. It goes after the
//    superclass declaration (UIViewController below)
//
@interface TimeCircuitsViewController : UIViewController

@end