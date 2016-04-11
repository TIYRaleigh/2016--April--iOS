//
//  Ticket.m
//  Jackpot
//
//  Created by Ben Gohlke on 3/3/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Ticket.h"

typedef enum
{
    WinnerType1Dollar = 3,
    WinnerType5Dollars = 4,
    WinnerType20Dollars = 5,
    WinnerType100Dollars = 6,
} WinnerType;

@interface Ticket ()
{
    NSMutableArray *picks;
}

@end

@implementation Ticket

+ (instancetype)ticketUsingQuickPick
{
    Ticket *aTicket = [[Ticket alloc] init];
    for (int i = 0; i < 6; i++)
    {
        [aTicket createPick];
    }
    return aTicket;
}

+ (instancetype)ticketUsingArray:(NSArray *)specificPicks
{
    Ticket *aTicket = [[Ticket alloc] init];
    [aTicket insertPicksUsingArray:specificPicks];
    return aTicket;
}

- (instancetype)init
{
    if (self = [super init])
    {
        picks = [[NSMutableArray alloc] init];
        _winner = NO;
        _payout = @"";
    }
    
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@  %@  %@  %@  %@  %@", picks[0], picks[1], picks[2], picks[3], picks[4], picks[5]];
}

- (NSArray *)picks
{
    return [picks copy];
}

- (void)createPick
{
    BOOL shouldAddPick = YES;
    do
    {
        int pickInt = arc4random() % 53 + 1;
        NSNumber *pickAsNumber = [NSNumber numberWithInt:pickInt];
        for (NSNumber *aPick in picks)
        {
            if ([pickAsNumber isEqualToNumber:aPick])
            {
                shouldAddPick = NO;
                break;
            }
            else
            {
                shouldAddPick = YES;
            }
        }
        if (shouldAddPick)
        {
            [picks addObject:pickAsNumber];
        }
    } while (!shouldAddPick);
    
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    [picks sortUsingDescriptors:@[lowestToHighest]];
}

- (void)insertPicksUsingArray:(NSArray *)specificPicks
{
    picks = [specificPicks mutableCopy];
}

- (void)compareWithTicket:(Ticket *)anotherTicket
{
    NSArray *possibleWinningNumbers = [anotherTicket picks];
    int matchCount = 0;
    
    for (int i = 0; i < [picks count]; i++)
    {
        for (int j = 0; j < [possibleWinningNumbers count]; j++)
        {
            if ([picks[i] isEqualToNumber:possibleWinningNumbers[j]])
            {
                matchCount++;
                break;
            }
        }
    }
    
    switch (matchCount)
    {
        case WinnerType1Dollar:
            [self setWinner:YES];
            [self setPayout:@"$1"];
            break;
        case WinnerType5Dollars:
            [self setWinner:YES];
            [self setPayout:@"$5"];
            break;
        case WinnerType20Dollars:
            [self setWinner:YES];
            [self setPayout:@"$20"];
            break;
        case WinnerType100Dollars:
            [self setWinner:YES];
            [self setPayout:@"$100"];
            break;
            
        default:
            break;
    }
}

@end
