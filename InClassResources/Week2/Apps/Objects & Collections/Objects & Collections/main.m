//
//  main.m
//  Objects & Collections
//
//  Created by Ben Gohlke on 3/2/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //
        // NSNumber, a lightweight wrapper around the number primitives
        //
        
//        NSNumber *aBool = [NSNumber numberWithBool:NO];
//        NSLog(@"%@", [aBool boolValue] ? @"YES" : @"NO");
        
//        NSNumber *aChar = [NSNumber numberWithChar:'z'];
//        NSLog(@"%c", [aChar charValue]);
        
//        NSNumber *aUChar = [NSNumber numberWithUnsignedChar:255];
//        NSLog(@"%hhu", [aUChar unsignedCharValue]);

//        NSNumber *aShort = [NSNumber numberWithShort:32767];
//        NSLog(@"%hi", [aShort shortValue]);
        
//        NSNumber *aUShort = [NSNumber numberWithUnsignedShort:65535];
//        NSLog(@"%hu", [aUShort unsignedShortValue]);
        
//        NSNumber *anInt = [NSNumber numberWithInt:2147483647];
//        NSLog(@"%i", [anInt intValue]);
        
//        NSNumber *aUInt = [NSNumber numberWithUnsignedInt:4294967295];
//        NSLog(@"%u", [aUInt unsignedIntValue]);
        
//        NSNumber *aLong = [NSNumber numberWithLong:9223372036854775807];
//        NSLog(@"%li", [aLong longValue]);
        
//        NSNumber *aFloat = [NSNumber numberWithFloat:26.99f];
//        NSLog(@"%f", [aFloat floatValue]);
        
//        NSNumber *aDouble = [NSNumber numberWithDouble:26.99];
//        NSLog(@"%f", [aDouble doubleValue]);
        
//        NSNumber *aNumber = [NSNumber numberWithInt:12];
//        float asFloat = [aNumber floatValue];
//        NSLog(@"%.2f", asFloat);
//        
//        NSString *asString = [aNumber stringValue];
//        NSLog(@"%@", asString);
//        
//        NSLog(@"%@", aNumber);
        
//        NSNumber *aBool = @NO;
//        NSNumber *aChar = @'z';
//        NSNumber *anInt = @2147483647;
//        NSNumber *aUInt = @4294967295U;
//        NSNumber *aLong = @9223372036854775807L;
//        NSNumber *aFloat = @26.99F;
//        NSNumber *aDouble = @26.99;
        
//        double x = 24.0;
//        NSNumber *result = @(x * .15);
//        NSLog(@"%.2f", [result doubleValue]);
        
//        NSNumber *aNumber = @12;
//        NSNumber *anotherNumber = @12U;
//        if (aNumber == anotherNumber)
//        {
//            NSLog(@"Numbers are equal");
//        }
//        else
//        {
//            NSLog(@"Numbers are not equal");
//        }
        
//        if ([anotherNumber isEqualToNumber:aNumber])
//        {
//            NSLog(@"Numbers are equal");
//        }
//        else
//        {
//            NSLog(@"Numbers are not equal");
//        }
        
//        NSNumber *aThirdNumber = @15;
//        NSComparisonResult result = [aNumber compare:aThirdNumber];
//        if (result == NSOrderedAscending)
//        {
//            NSLog(@"%@ < %@", aNumber, aThirdNumber);
//        }
//        else if (result == NSOrderedSame)
//        {
//            NSLog(@"%@ == %@", aNumber, aThirdNumber);
//        }
//        else if (result == NSOrderedDescending)
//        {
//            NSLog(@"%@ > %@", aNumber, aThirdNumber);
//        }

//        NSArray *shipCaptains = @[@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo"];
//        NSLog(@"Serenity: %@", shipCaptains[0]);
//        
//        NSArray *sameCaptains = [NSArray arrayWithObjects:@"Malcolm Reynolds", @"Jean-Luc Picard", @"James T. Kirk", @"Han Solo", nil];
//        if ([shipCaptains isEqualToArray:sameCaptains])
//        {
//            NSLog(@"Declaring arrays as literals or NSArrays produce the same result!");
//        }
//
//        if ([shipCaptains containsObject:@"Kathryn Janeway"])
//        {
//            NSLog(@"U.S.S. Voyager represent!");
//        }
//
//        NSUInteger index = [shipCaptains indexOfObject:@"James T. Kirk"];
//        if (index == NSNotFound)
//        {
//            NSLog(@"Captain not found!");
//        }
//        else
//        {
//            NSLog(@"Captain %@ was found at index %lu", shipCaptains[index], (unsigned long)index);
//        }
        
//        NSMutableArray *mutableShipCaptains = [[NSMutableArray alloc] initWithObjects:@"Malcolm Reynolds", @"James T. Kirk", nil];
//        [mutableShipCaptains addObject:@"Han Solo"];
//        [mutableShipCaptains addObjectsFromArray:@[@"Jean-Luc Picard", @"Kathryn Janeway"]];
//        
//        NSLog(@"%@", mutableShipCaptains);
//        
//        NSSortDescriptor *alphabetical = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
//        [mutableShipCaptains sortUsingDescriptors:@[alphabetical]];
//        
//        NSLog(@"%@", mutableShipCaptains);
    }
    return 0;
}
