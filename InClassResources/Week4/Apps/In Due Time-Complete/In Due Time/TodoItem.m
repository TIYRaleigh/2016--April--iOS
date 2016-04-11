//
//  TodoItem.m
//  In Due Time
//
//  Created by Ben Gohlke on 3/16/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _done = NO;
    }
    
    return self;
}

@end
