//
//  Car+Extras.h
//  The Iron Yard
//
//  Created by Ben Gohlke on 3/11/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "Car.h"

@interface Car (Extras)

- (BOOL)paint:(NSString *)color;
- (BOOL)wash;

@end