//
//  Picmark.h
//  Pickit
//
//  Created by Ben Gohlke on 4/6/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MapKit;
@import CloudKit;
@import CoreLocation;

@interface Picmark : NSObject <MKAnnotation>

- (instancetype)initWithLocation:(CLLocation *)aLocation andImage:(UIImage *)image;
- (instancetype)initWithRecord:(CKRecord *)record;
- (UIImage *)image;
- (NSString *)uuid;

@end
