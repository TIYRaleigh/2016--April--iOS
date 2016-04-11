//
//  Car+Extras.m
//  The Iron Yard
//
//  Created by Ben Gohlke on 3/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Car+Extras.h"

@implementation Car (Extras)

- (BOOL)paint:(NSString *)color
{
    BOOL rc = NO;
    
    if (color && ![color isEqualToString:@""])
    {
        rc = YES;
        self.color = color;
    }
    
    return rc;
}

- (BOOL)wash
{
    BOOL rc = NO;
    
    return rc;
}

@end