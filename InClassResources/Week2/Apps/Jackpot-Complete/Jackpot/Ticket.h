//
//  Ticket.h
//  Jackpot
//
//  Created by Ben Gohlke on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (assign) BOOL winner;
@property (strong, nonatomic) NSString *payout;

+ (instancetype)ticketUsingQuickPick;
+ (instancetype)ticketUsingArray:(NSArray *)picks;

- (void)compareWithTicket:(Ticket *)anotherTicket;

- (NSArray *)picks;

@end