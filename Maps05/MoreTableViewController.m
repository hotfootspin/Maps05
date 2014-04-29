//
//  MoreTableViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/22/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MoreTableViewController.h"
#import "Map.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

@synthesize map;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"morecell"];

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
    return 1; // so far
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 11; // so far
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"morecell" forIndexPath:indexPath];
    // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"morecell"];
    
    /*
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"morecell"];
    }
     */
    
    // Configure the cell...
    // 0 map
    // 1 company
    // 2 year
    // 3 description
    // 4 latitude
    // 5 longitude
    // 6 map code
    // 7 map ID
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Map";
            cell.detailTextLabel.text = [map title];
            break;
            
        case 1:
            cell.textLabel.text = @"Company";
            cell.detailTextLabel.text = [map company];
            break;
            
        case 2:
            cell.textLabel.text = @"Year";
            cell.detailTextLabel.text = [map year];
            break;
            
        case 3:
            cell.textLabel.text = @"Scene";
            cell.detailTextLabel.text = [map description];
            /*
             * not applicable to iPad version
            if ([[map description] length] > 40)
                cell.detailTextLabel.font = [UIFont systemFontOfSize:11.0];
             */
            break;
            
        case 4:
            cell.textLabel.text = @"Latitude";
            cell.detailTextLabel.text = [[NSNumber numberWithDouble:[map latitude]] stringValue];
            break;
            
        case 5:
            cell.textLabel.text = @"Longitude";
            cell.detailTextLabel.text = [[NSNumber numberWithDouble:[map longitude]] stringValue];
            break;
            
        case 6:
            cell.textLabel.text = @"Date Code";
            cell.detailTextLabel.text = @"";
            break;
            
        case 7:
            cell.textLabel.text = @"Map ID";
            cell.detailTextLabel.text = [[NSNumber numberWithInt:[map mapId]] stringValue];
            break;
            
        case 8:
            cell.textLabel.text = @"Been Here";
            cell.detailTextLabel.text = @"";
            break;
            
        case 9:
            cell.textLabel.text = @"Want to go";
            cell.detailTextLabel.text = @"";
            break;
            
        case 10:
            cell.textLabel.text = @"Comments";
            cell.detailTextLabel.text = @"";
            cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
            
        default:
            break;
    }
 
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
