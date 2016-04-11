//
//  main.m
//  DataTypes
//
//  Created by Ben Gohlke on 3/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

void happyBirthday();

int age;

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        //
        // C Primitives
        //
        
//        age = 10;
//        happyBirthday();
//        happyBirthday();

        // One byte wide, so range is -128 through 127 for signed or 0 through 255 for unsigned
//        char aChar = 'a';
//        NSLog(@"The letter %c", aChar);

        // 2 bytes wide, -32,768 through 32,767 signed, 0 through 65,535 unsigned
//        short aShort = -32768;
//        unsigned short anUnsignedShort = 65535;
//        NSLog(@"%hd", aShort);
//        NSLog(@"%hu", anUnsignedShort);
        
        // 4 bytes wide, -2,147,483,648 through 2,147,483,647 signed, 0 through 4,294,967,295 unsigned
//        int anInt = -2147483648;
//        unsigned int anUnsignedInt = 4294967295;
//        NSLog(@"%d", anInt);
//        NSLog(@"%u", anUnsignedInt);

        // 8 bytes wide, -9,223,372,036,854,775,808 through 9,223,372,036,854,775,807 signed, 0 through 18,446,744,073,709,551,615 unsigned
//        long aLong = -9223372036854;
//        unsigned long anUnsignedLong = 1744674407;
//        NSLog(@"%ld", aLong);
//        NSLog(@"%lu", anUnsignedLong);
        
        // Single precision floating-point, 32-bit number
//        float aFloat = -21.09f;
//        NSLog(@"%f", aFloat);
//        NSLog(@"%.2f", aFloat);
        
        // Double precision floating-point, 64-bit number
//        double aDouble = -21.09;
//        NSLog(@"%8.2f", aDouble);
//        NSLog(@"%e", aDouble);
        
        // Extended precision floating-point, 80-bit number
//        long double aLongDouble = -21.09e8L;
//        NSLog(@"%Lf", aLongDouble);
//        NSLog(@"%Le", aLongDouble);

        //
        // Math
        //
        
//        int integerResult = 5 / 4;
//        NSLog(@"Integer division: %d", integerResult);
//        double doubleResult = 5.0 / 4;
//        NSLog(@"Floating-point division: %f", doubleResult);
        
        // Floating point imprecision
//        NSLog(@"%.17f", .1);
//        NSLog(@"%.1f", 4.2 - 4.1); // 0.10000000000000053
        
        //
        // Objective-C Primitives
        //
        
        // 1 for yes, 0 for no
//        BOOL isBool = YES;
//        NSLog(@"%d", isBool);
//        NSLog(@"%@", isBool ? @"YES" : @"NO");
        
        // pointer to any object
//        NSString *myString = @"Hello World";
//        NSLog(@"%@", myString);
//        
//        id mysteryObject = @"An NSString object";
//        NSLog(@"%@", [mysteryObject description]);
//        mysteryObject = @{@"model": @"Ford", @"year": @1967};
//        NSLog(@"%@", [mysteryObject description]);
        
        // Object of class
//        Class targetClass = [NSString class];
//        id mysteryObject = @"An NSString object";
//        if ([mysteryObject isKindOfClass:targetClass])
//        {
//            NSLog(@"Yup! That's an instance of the target class");
//            NSString *aString = (NSString *)mysteryObject;
//            NSLog(@"%@", aString);
//        }
        
        // pointer to method
//        SEL someMethod = @selector(aMethod);
        
        
        // autosizes itself based on current platform
//        NSInteger anInteger = -6;
//        NSUInteger aPositiveInteger = 8;
//        NSLog(@"anInteger: %ld", (long)anInteger);
//        NSLog(@"aPositiveInteger: %ld", (long)aPositiveInteger);
    }
    return 0;
}

void happyBirthday()
{
    age = age + 1;
    NSLog(@"Happy Birthday! You're now %d", age);
}
