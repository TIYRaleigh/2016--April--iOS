//
//  GroceryItem.h
//  Groceries
//
//  Created by Ben Gohlke on 2/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroceryItem : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSString *category;
@property (assign) NSInteger aisle;

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDict;

@end
