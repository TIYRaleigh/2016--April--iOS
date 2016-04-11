//
//  main.m
//  The Iron Yard
//
//  Created by Ben Gohlke on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car+Extras.h"

void driveCar(Car *car);

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Car *aCar = [[Car alloc] initWithMake:@"Toyota"
                                        model:@"Camry"
                                     andColor:@"Red"];
        
        NSLog(@"%@ %@ is %@", aCar.make, aCar.model, aCar.color);
        
        [aCar drive];
        
        [aCar paint:@"Blue"];

        NSLog(@"%@ %@ is %@", aCar.make, aCar.model, aCar.color);
    }
    return 0;
}
