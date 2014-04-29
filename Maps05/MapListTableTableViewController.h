//
//  MapListTableTableViewController.h
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"
#import "AppDelegate.h"

@interface MapListTableTableViewController : UITableViewController  {
    
}

@property (nonatomic, retain) Map *map;
@property (nonatomic, assign) BOOL bShowNearby;
@property (nonatomic, assign) BOOL bShowBeenThere;
@property (nonatomic, assign) BOOL bShowWantToGo;
@property (nonatomic, retain) NSArray *sortedMaps;
@property (nonatomic, retain) NSMutableArray *subsetMaps;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBar;

@property (nonatomic, retain) AppDelegate *myAppDelegate;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (strong) NSArray *userMapBookmarks;

@end
