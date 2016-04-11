//
//  TodoItem.h
//  Todo
//
//  Created by Ben Gohlke on 3/12/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    TaskPriorityNone,
    TaskPriorityLow,
    TaskPriorityMedium,
    TaskPriorityHigh
} TaskPriority;

@interface TodoItem : NSObject

@property (strong, nonatomic) NSString *taskName;
@property (assign) TaskPriority priority;

+ (NSArray *)allPriorityTypes;

- (NSString *)priorityAsString;

@end
