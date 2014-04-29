//
//  PinViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/19/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "PinViewController.h"
#import "MapViewController.h"
#import "MBMapPin.h"
#import "Data.h"

// SF is -122
// Florida is 26, -80
// Minnesota is 48
#define US_CENTER_LAT 38.0
#define US_CENTER_LON -96.0
#define US_SPAN_LAT 22.0
#define US_SPAN_LON 40.0

@interface PinViewController ()

@end

@implementation PinViewController

@synthesize mapView;

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

    [self.mapView setDelegate:self];
    
    // define region
    MKCoordinateRegion region;
    region.center.latitude = US_CENTER_LAT;
    region.center.longitude = US_CENTER_LON;
    region.span.latitudeDelta = US_SPAN_LAT;
    region.span.longitudeDelta = US_SPAN_LON;
    [self.mapView setRegion:region animated:NO];

    // annotations
    NSMutableArray *annotations = [[NSMutableArray alloc] init];
    CLLocationCoordinate2D location;
    MBMapPin *ann;
    
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    int numMaps = maps.count;
    for (int i=0; i<numMaps; ++i) {
        location.latitude = [[maps objectAtIndex:i] latitude];
        location.longitude = [[maps objectAtIndex:i] longitude];
        ann = [[MBMapPin alloc] init];
        [ann setCoordinate:location];
        ann.title = [[maps objectAtIndex:i] subtitle];
        ann.company = [[maps objectAtIndex:i] company];
        ann.mapIndex = i;
        [annotations addObject:ann];
    }

    [self.mapView addAnnotations:annotations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    
    MKPinAnnotationView *view = [[MKPinAnnotationView alloc]
                                 initWithAnnotation:annotation reuseIdentifier:@"pin"];

    MBMapPin *mapPin = (MBMapPin *) view.annotation;
    NSString *company = mapPin.company;
    
    NSString *imgPath;
    if ([company  isEqual: @"Shell"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"shell_logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Chevron"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"chevron-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"KYSO"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"kyso-circles-logo" ofType:@"png"];
    else if ([company  isEqual: @"Esso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"esso-logo-square-2" ofType:@"png"];
    else if ([company  isEqual: @"Calso"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"calso-logo-2" ofType:@"png"];
    else if ([company  isEqual: @"Texaco"])
        imgPath = [[NSBundle mainBundle] pathForResource:@"texaco-logo" ofType:@"png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imgPath]];
    imageView.frame = CGRectMake(0,0,31,31); // Change the size of the image to fit the callout
    view.leftCalloutAccessoryView = imageView;

    view.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    view.enabled = YES;
    view.canShowCallout = YES;

    return view;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    // if (![view.annotation isKindOfClass:[MyLocation class]])
       // return;
    
    // use the annotation view as the sender
    
    [self performSegueWithIdentifier:@"PinVCSegue" sender:view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MKAnnotationView *)sender
{
    if ([segue.identifier isEqualToString:@"PinVCSegue"])
    {
        MapViewController *next = [segue destinationViewController];
        MBMapPin *pin = (MBMapPin *) sender.annotation;
        
        // Pass the selected object to the new view controller.
        // NSIndexPath *selectedRowIndex = [self.tableView indexPathForSelectedRow];
        next.map = [[[Data sharedMapData] getMaps] objectAtIndex:pin.mapIndex];
    }
}


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
