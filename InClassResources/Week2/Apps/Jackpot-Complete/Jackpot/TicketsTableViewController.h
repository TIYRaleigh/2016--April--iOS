//
//  TicketsTableViewController.h
//  Jackpot
//
//  Created by Ben Gohlke on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@protocol WinningTicketViewControllerDelegate

- (void)winningTicketWasAdded:(Ticket *)ticket;

@end

@interface TicketsTableViewController : UITableViewController <WinningTicketViewControllerDelegate>

@end