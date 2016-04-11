//
//  GroceryItem.m
//  Groceries
//
//  Created by Ben Gohlke on 2/24/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import "GroceryItem.h"

@implementation GroceryItem

+ (GroceryItem *)groceryItemWithDictionary:(NSDictionary *)groceryItemDict
{
    GroceryItem *anItem = nil;
    if (groceryItemDict)
    {
        anItem = [[GroceryItem alloc] init];
        anItem.name = [groceryItemDict objectForKey:@"name"];
        anItem.category = [groceryItemDict objectForKey:@"category"];
        anItem.aisle = [[groceryItemDict objectForKey:@"aisle"] integerValue];
    }
    
    return anItem;
}

@end
