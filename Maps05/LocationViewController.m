//
//  LocationViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/26/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "LocationViewController.h"
#import "MapListTableTableViewController.h"
#import "Data.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize nearbyMaps;
@synthesize mapDistances;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize requestedLocation;
@synthesize requestedLocationField;

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

    if (currentLocation == nil) {
        currentLocation = [[CLLocation alloc] init];
    }

    locationManager = [[CLLocationManager alloc] init];
    currentLocation = locationManager.location;

    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    // This causes an immediate segue we don't want
    // [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations lastObject];
    
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          currentLocation.coordinate.latitude,
          currentLocation.coordinate.longitude);
    
    [self.locationManager stopUpdatingLocation];
    [self.locationManager setDelegate:nil];

    // assign the distances from the current location
    [self computeAllMapDistances:currentLocation];
    [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
}

- (void) computeAllMapDistances:(CLLocation*) loc
{
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    int nMaps = [maps count];
    CLLocation *mapLoc;
    for (int i=0; i<nMaps; ++i) {
        Map *map = [maps objectAtIndex:i];
        mapLoc = [[CLLocation alloc] initWithLatitude:map.latitude longitude:map.longitude];
        CLLocationDistance cld = [loc distanceFromLocation:mapLoc];
        map.distance = cld;
        
        double dy = mapLoc.coordinate.latitude - loc.coordinate.latitude;
        double dx = mapLoc.coordinate.longitude - loc.coordinate.longitude;
        char dir_y, dir_x;
        if (dy > 0) dir_y = 'N'; else dir_y = 'S';
        if (dx > 0) dir_x = 'E'; else dir_x = 'W';
        if (dy == 0)
            map.direction = [NSString stringWithFormat:@"%s", dir_x == 'E' ? "East" : "West" ];
        double ratio = fabs (dx/dy);
        NSLog(@"Ratio = %f / %f = %f", dx, dy, ratio);
        if (ratio > 4.80)
            map.direction = [NSString stringWithFormat:@"%s", dir_x == 'E' ? "East" : "West" ]; // E or W
        else if (ratio > 1.50)
            map.direction = [NSString stringWithFormat:@"%c%c%c", dir_x, dir_y, dir_x ]; // ENE
        else if (ratio > 0.67)
            map.direction = [NSString stringWithFormat:@"%c%c", dir_y, dir_x ]; // NE
        else if (ratio > 0.20)
            map.direction = [NSString stringWithFormat:@"%c%c%c", dir_y, dir_y, dir_x ]; // NNE
        else
            map.direction = [NSString stringWithFormat:@"%s", dir_y == 'N' ? "North" : "South" ]; // N or S
        // if (ratio > 2.41)
        // else if (ratio < 0.41)
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    MapListTableTableViewController *next = [segue destinationViewController];
    next.bShowNearby = YES;
}

- (IBAction)doCurrentLocation:(id)sender
{
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Current Location" message:@"Current Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    NSLog(@"%s", "Current Location");
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          currentLocation.coordinate.latitude,
          currentLocation.coordinate.longitude);
    NSLog(@"latitude %+.6f, longitude %+.6f\n",
          locationManager.location.coordinate.latitude,
          locationManager.location.coordinate.longitude);

    if (currentLocation.coordinate.latitude < 1.0 && currentLocation.coordinate.latitude > -1.0 &&
        currentLocation.coordinate.longitude < 1.0 && currentLocation.coordinate.longitude > -1.0)
    {
       [self.locationManager startUpdatingLocation];
    }
    else {
        [self computeAllMapDistances:currentLocation];
        [self performSegueWithIdentifier:@"currentLocationSegue" sender:self];
    }
}

- (IBAction)doRequestedLocation:(id)sender
{
    // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Requested Location" message:@"Requested Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    // [alert show];
    NSLog(@"%s", "Requested Location");

    // geocode the requested location
    // https://developer.apple.com/library/ios/documentation/userexperience/conceptual/LocationAwarenessPG/UsingGeocoders/UsingGeocoders.html
    CLGeocoder *geo = [[CLGeocoder alloc] init];
    [geo geocodeAddressString:[requestedLocationField text] completionHandler:
     ^(NSArray *placemarks, NSError *error) {
         CLPlacemark *pm = [placemarks objectAtIndex:0];
         requestedLocation = pm.location;
         NSLog(@"latitude %+.6f, longitude %+.6f\n",
               requestedLocation.coordinate.latitude,
               requestedLocation.coordinate.longitude);
         // then assign the distances from the requested location
         [self computeAllMapDistances:requestedLocation];
         [self performSegueWithIdentifier:@"requestedLocationSegue" sender:self];
     }];
}
@end
