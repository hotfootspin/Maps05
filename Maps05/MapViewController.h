//
//  MapViewController.h
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"
#import "AppDelegate.h"

@interface MapViewController : UIViewController

@property (nonatomic, retain) Map *map;
@property (weak, nonatomic) IBOutlet UILabel *mapCaption;
@property (weak, nonatomic) IBOutlet UIImageView *mapImage;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleView;
- (IBAction)bookmarkBeenHere:(id)sender;
- (IBAction)bookmarkWantToGo:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *beenHereButton;
@property (weak, nonatomic) IBOutlet UIButton *wantToGoButton;

@property (nonatomic, retain) AppDelegate *myAppDelegate;
@property (nonatomic, retain) NSManagedObjectContext *context;
@property (strong) NSArray *userMapBookmarks;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnPrevious:(id)sender;

- (void) loadMapData;
@property (nonatomic, retain) NSMutableArray *subsetIndexes;

@end

