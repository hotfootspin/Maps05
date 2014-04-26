//
//  MapViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/16/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "MapViewController.h"
#import "MoreTableViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;
@synthesize mapCaption;
@synthesize mapImage;
@synthesize titleView;

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
    
    // just testing to see if we can do this nicely
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

    UIView * uiv = (UIView*)[[[self view] subviews] objectAtIndex:0];
    uiv.layer.shadowColor = [UIColor blackColor].CGColor;
    uiv.layer.shadowOffset = CGSizeMake (4, 4);
    uiv.layer.shadowOpacity = 1;
    uiv.layer.shadowRadius = 12.0;
    uiv.clipsToBounds = NO;
    
    titleView.title = [map title];
    
    NSString *imgPath =  [[NSBundle mainBundle] pathForResource:map.picture ofType:@"png"];

    /*
    NSLog (@"Image 2");
    NSLog (@"%@", map.picture);
    NSLog (@"%@", map.company);
    NSLog (@"%@", map.title);
    NSLog (@"%@", map.year);
    NSLog (@"%@", imgPath);
    */
    
    UIImage *img = [UIImage imageWithContentsOfFile:imgPath];
    // NSLog (@"Image 3");
    [mapImage setImage:img];
    // NSLog (@"Image 4");
    
    [mapCaption setText:map.description];
    // [mapCaption setText:map.subtitle];
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

@end
