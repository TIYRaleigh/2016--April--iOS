//
//  WinningTicketViewController.h
//  Jackpot
//
//  Created by Ben Gohlke on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketsTableViewController.h"

@interface WinningTicketViewController : UIViewController

@property (strong, nonatomic) id<WinningTicketViewControllerDelegate> delegate;

@end
