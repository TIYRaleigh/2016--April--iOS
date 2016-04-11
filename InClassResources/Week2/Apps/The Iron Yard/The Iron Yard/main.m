//
//  main.m
//  The Iron Yard
//
//  Created by Ben Gohlke on 3/4/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

void driveCar(Car *car);

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        Car *aCar = [[Car alloc] initWithMake:@"Toyota"
                                        model:@"Camry"
                                     andColor:@"Red"];
        
        for (int i = 0; i < 6; i++)
        {
            driveCar(aCar);
        }
    }
    return 0;
}

void driveCar(Car *car)
{
    BOOL hasDriven = [car drive];
    NSLog(@"%@ %@ has driven: %@", car.make, car.model, (hasDriven) ? @"YES" : @"NO");
}
