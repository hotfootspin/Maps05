//
//  HomeViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/28/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "HomeViewController.h"
#import "MapListTableTableViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize bBeenTherePressed;
@synthesize bWantToGoPressed;
@synthesize bListPressed;

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
    if ([[segue identifier] isEqualToString:@"bookmarkSegue"]) {

        // Get the new view controller using [segue destinationViewController].
        MapListTableTableViewController *next = [segue destinationViewController];
        
        // Pass the selected object to the new view controller.
        if (bBeenTherePressed) {
            next.bShowBeenThere = YES;
            next.bShowWantToGo = NO;
            next.bShowNearby = NO;
        }
        else if (bWantToGoPressed) {
            next.bShowBeenThere = NO;
            next.bShowWantToGo = YES;
            next.bShowNearby = NO;
        }
        else if (bListPressed) {
            next.bShowBeenThere = NO;
            next.bShowWantToGo = NO;
            next.bShowNearby = NO;
        }
    }
}


- (IBAction)beenThereButton:(id)sender {
    bBeenTherePressed = YES;
    bWantToGoPressed = NO;
    bListPressed = NO;
    [self performSegueWithIdentifier:@"bookmarkSegue" sender:sender];
}

- (IBAction)wantToGoButton:(id)sender {
    bBeenTherePressed = NO;
    bWantToGoPressed = YES;
    bListPressed = NO;
    [self performSegueWithIdentifier:@"bookmarkSegue" sender:sender];
}

- (IBAction)viewListButton:(id)sender {
    bBeenTherePressed = NO;
    bWantToGoPressed = NO;
    bListPressed = YES;
    [self performSegueWithIdentifier:@"bookmarkSegue" sender:sender];
}
@end
