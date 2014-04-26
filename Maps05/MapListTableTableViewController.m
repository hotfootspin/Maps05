//
//  MapListTableTableViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MapListTableTableViewController.h"
#import "MapViewController.h"
#import "Map.h"
#import "Data.h"

@interface MapListTableTableViewController ()

@end

@implementation MapListTableTableViewController

// @synthesize maps;
@synthesize bShowNearby;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        bShowNearby = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    bShowNearby = YES;
    
    if (bShowNearby) {
    }
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1; // [maps count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[Data sharedMapData] getMaps] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    int index = indexPath.row;
    Map *map = [[[Data sharedMapData] getMaps] objectAtIndex:index];
    NSString *title = [map title];
    NSString *subtitle = [map subtitle];
    NSString *company = [map company];
    // NSString *year = [map year];
    [[cell textLabel] setText:title];
    // [[cell detailTextLabel] setText:[[company stringByAppendingString:@", "] stringByAppendingString: year]];
    // [[cell detailTextLabel] setText:[[company stringByAppendingString:@", "] stringByAppendingString: year]];
    
    // [[cell detailTextLabel] setText:[[NSArray arrayWithObjects:subtitle, @" [", company, @"]", nil] componentsJoinedByString:@""]];
    [[cell detailTextLabel] setText:subtitle];
    
    // NSLog(@"%@", company);
    
    NSString *imgPath;
    if ([company  isEqual: @"Shell"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"shell_logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Chevron"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"chevron-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"KYSO"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"kyso-logo-square-2" ofType:@"png"];
    else if ([company  isEqual: @"Esso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"esso-logo-square-2" ofType:@"png"];
    else if ([company  isEqual: @"Calso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"calso-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Texaco"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"texaco-logo" ofType:@"png"];
    // NSLog(@"%@", imgPath);
    [[cell imageView] setImage:[UIImage imageWithContentsOfFile:imgPath]];
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    MapViewController *next = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
    next.map = [[[Data sharedMapData] getMaps] objectAtIndex:selectedRowIndex.row];
}

@end
