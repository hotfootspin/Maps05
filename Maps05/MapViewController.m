//
//  MapViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MapViewController.h"
#import "MoreTableViewController.h"
#import "UserMapBookmark.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;
@synthesize mapCaption;
@synthesize mapImage;
@synthesize titleView;
@synthesize myAppDelegate;
@synthesize context;
@synthesize userMapBookmarks;
@synthesize beenHereButton;
@synthesize wantToGoButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Core Data - get the user data
    myAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    context = [myAppDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MapBookmark"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"mapId == %i", map.mapId];
    [fetchRequest setPredicate:predicate];
    userMapBookmarks = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    // just testing to see if we can do this nicely
    [[self view] setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.9 alpha:1.0]];
    /*
    if ([[map company]  isEqual: @"Shell"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.95 green:0.95 blue:0.9 alpha:1.0]];
    else if ([[map company]  isEqual: @"Chevron"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.95 green:0.9 blue:0.85 alpha:1.0]];
    else if ([[map company]  isEqual: @"KYSO"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.95 blue:0.95 alpha:1.0]];
    else if ([[map company]  isEqual: @"Esso"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.95 blue:0.95 alpha:1.0]];
    else if ([[map company]  isEqual: @"Calso"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.95 green:0.9 blue:0.85 alpha:1.0]];
    else if ([[map company]  isEqual: @"Texaco"])
        [[self view] setBackgroundColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0]];
    */
    
    UIView * uiv = (UIView*)[[[self view] subviews] objectAtIndex:0];
    uiv.layer.shadowColor = [UIColor blackColor].CGColor;
    uiv.layer.shadowOffset = CGSizeMake (4, 4);
    uiv.layer.shadowOpacity = 1;
    uiv.layer.shadowRadius = 12.0;
    uiv.clipsToBounds = NO;
    
    titleView.title = [map title];
    
    NSString *imgPath =  [[NSBundle mainBundle] pathForResource:map.picture ofType:@"png"];
    UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    [mapImage setImage:img];

    [mapCaption setText:map.description];
    
    // Core Data - get the checkmark data if there is any
    /*
    NSManagedObject *device = [self.userMapBookmarks objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@ %@", [device valueForKey:@"name"], [device valueForKey:@"version"]]];
    [cell.detailTextLabel setText:[device valueForKey:@"company"]];
     */
    
    if ([userMapBookmarks count] > 0) {
        // There may be more than one match. If so, the last one
        // seems to be the one that is most recent.
        // 
        UserMapBookmark *umbm = (UserMapBookmark *) [userMapBookmarks objectAtIndex:[userMapBookmarks count]-1];
        if ([umbm.beenHere intValue] == 1) {
            beenHereButton.selected = YES;
        }
        else {
            beenHereButton.selected = NO;
        }
        if ([umbm.wantToGo intValue] == 1) {
            wantToGoButton.selected = YES;
        }
        else {
            wantToGoButton.selected = NO;
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    MoreTableViewController *next = [segue destinationViewController];

    // Pass the selected object to the new view controller.
    next.map = map;
}

- (void) saveCoreData
{
    // Core data - save the state
    // See if we have a data entry for this map first
    UserMapBookmark *existingBookmark = nil;
    
    // The reason we have a problem here is because the variable
    // "userMapBookmarks" is fetched from the persistent store only
    // when this view is loaded.
    //
    // But a new entry could be saved to the store every time one
    // of the buttons is pressed, which could be two, if the user
    // changes both checkboxes, or even many more than two, if the
    // user clicks a checkbox or checkboxes many times for whatever
    // reason. (Confused? Goofing off? Letting child play?)
    //
    // So even though we delete all previously-exisitng data entries
    // this time, there may be a bunch more of them next time.
    //
    // The alternative is to do another fetch here. But then we would
    // be doing many fetches.
    //
    
    // OK, there are still lots of problems, so I will do the fetch here
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"MapBookmark"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"mapId == %i", map.mapId];
    [fetchRequest setPredicate:predicate];
    userMapBookmarks = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];

    if ([userMapBookmarks count] > 0) {
        // delete all existing matching bookmarks
        int count = [userMapBookmarks count];
        for (int i=0; i<count; ++i) {
            existingBookmark = (UserMapBookmark *) [userMapBookmarks objectAtIndex:i];
            [context deleteObject:existingBookmark];
        }
    }
    
    // If not, then we save it
    // Create a new managed object
    UserMapBookmark *newUserMapBookmark = (UserMapBookmark *) [NSEntityDescription
                                                               insertNewObjectForEntityForName:@"MapBookmark"
                                                               inManagedObjectContext:context];
    newUserMapBookmark.mapId = [NSNumber numberWithInt:map.mapId];
    if (beenHereButton.selected)
        newUserMapBookmark.beenHere = [NSNumber numberWithInt:1];
    else
        newUserMapBookmark.beenHere = [NSNumber numberWithInt:0];
    if (wantToGoButton.selected)
        newUserMapBookmark.wantToGo = [NSNumber numberWithInt:1];
    else
        newUserMapBookmark.wantToGo = [NSNumber numberWithInt:0];
    newUserMapBookmark.comments = @"";
    /*
     [newUserMapBookmark setValue:[NSNumber numberWithInt:map.id] forKey:@"id"];
     [newUserMapBookmark setValue:[NSNumber numberWithBool:b.selected] forKey:@"beenHere"];
     */
    
    // Save the object to persistent store
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

- (IBAction)bookmarkBeenHere:(id)sender {
    static bool state = NO;
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Been Here" message:@"Been Here" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    UIButton *b = (UIButton*) sender;
    b.selected = !b.selected;
    /*
    if (state == YES) {
        // [b setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    }
    else {
        // [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
     */
    state = !state;
    
    [self saveCoreData];
}

- (IBAction)bookmarkWantToGo:(id)sender {
    static bool state = NO;
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Want To Go" message:@"Want To Go" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    UIButton *b = (UIButton*) sender;
    b.selected = !b.selected;
    
    /*
    if (state == YES)
        [b setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    else
        [b setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
     */
    state = !state;
    
    [self saveCoreData];
}

@end
