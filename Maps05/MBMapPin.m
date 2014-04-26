//
//  MBMapPin.m
//  Maps05
//
//  Created by Mark Brautigam on 4/19/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MBMapPin.h"

@implementation MBMapPin : NSObject

@synthesize coordinate;
@synthesize title;
@synthesize subtitle;
@synthesize company;
@synthesize mapIndex;

- initWithPosition:(CLLocationCoordinate2D)coords {
    if (self = [super init]) {
        self.coordinate = coords;
    }
    return self;
}

@end
