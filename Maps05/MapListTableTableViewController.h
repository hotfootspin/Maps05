//
//  MapListTableTableViewController.h
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"

@interface MapListTableTableViewController : UITableViewController  {
    
}

@property (nonatomic, retain) Map *map;
@property (nonatomic, assign) BOOL bShowNearby;

@end
