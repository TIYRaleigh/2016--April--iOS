//
//  Agent.h
//  NOC List
//
//  Created by Ben Gohlke on 2/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Agent : NSObject

@property (nonatomic) NSString *coverName;
@property (nonatomic) NSString *realName;
@property (assign)    NSInteger accessLevel;

+ (Agent *)agentWithDictionary:(NSDictionary *)agentDict;

@end