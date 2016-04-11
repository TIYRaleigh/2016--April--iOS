//
//  TodoItem.m
//  Todo
//
//  Created by Ben Gohlke on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "TodoItem.h"

@implementation TodoItem

+ (NSArray *)allPriorityTypes
{
    return @[@"Low", @"Medium", @"High"];
}

// TODO: override init so priority can be initially set to none
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _priority = TaskPriorityNone;
    }
    
    return self;
}

- (NSString *)priorityAsString
{
    NSString *rc;
    
    switch (self.priority)
    {
        case TaskPriorityLow:
            rc = @"Low";
            break;
        case TaskPriorityMedium:
            rc = @"Medium";
            break;
        case TaskPriorityHigh:
            rc = @"High";
            break;
            
        default:
            rc = @"";
            break;
    }
    
    return rc;
}

@end
