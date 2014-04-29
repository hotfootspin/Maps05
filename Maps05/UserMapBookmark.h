//
//  UserMapBookmark.h
//  Maps05
//
//  Created by Mark Brautigam on 4/28/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserMapBookmark : NSManagedObject

@property (nonatomic, retain) NSNumber * beenHere;
@property (nonatomic, retain) NSString * comments;
@property (nonatomic, retain) NSNumber * mapId;
@property (nonatomic, retain) NSNumber * wantToGo;

@end
