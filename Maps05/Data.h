//
//  Data.h
//  Maps05
//
//  Created by Mark Brautigam on 4/17/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Map.h"

@interface Data : NSObject {
    NSMutableArray *maps;
}

+ (Data*) sharedMapData;

- (NSMutableArray*) getMaps;

- (Map*) strToMap:(NSString*)map;

@end


