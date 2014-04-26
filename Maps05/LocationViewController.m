//
//  LocationViewController.m
//  Maps05
//
//  Created by Mark Brautigam on 4/26/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "LocationViewController.h"
#import "Data.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

@synthesize nearbyMaps;
@synthesize mapDistances;
@synthesize locationManager;
@synthesize currentLocation;

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

    nearbyMaps = [NSMutableArray arrayWithCapacity:10];
    mapDistances = [NSMutableArray arrayWithCapacity:10];
    
    if (currentLocation == nil) {
        currentLocation = [[CLLocation alloc] init];
    }

    locationManager = [[CLLocationManager alloc] init];

    [self.locationManager setDelegate:self];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    
    [self.locationManager startUpdatingLocation];    
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
    
    NSMutableArray *maps = [[Data sharedMapData] getMaps];
    int nMaps = [maps count];
    CLLocationDistance maxDist = DBL_MAX;
    CLLocation *mapLoc;
    int maxIndex = 0;
    for (int i=0; i<nMaps; ++i) {
        Map *map = [maps objectAtIndex:i];
        mapLoc = [[CLLocation alloc] initWithLatitude:map.latitude longitude:map.longitude];
        CLLocationDistance cld = [currentLocation distanceFromLocation:mapLoc];
        if (cld < maxDist) {
            [nearbyMaps addObject:map];
            [mapDistances addObject:[NSNumber numberWithDouble:cld]];
            // maxDist = cld;
        }
        if ([nearbyMaps count] > 5) {
            CLLocationDistance sortMaxDist = 0;
            for (int j=0; j<[nearbyMaps count]; ++j) {
                NSNumber *thisMapDist = (NSNumber*)[mapDistances objectAtIndex:j];
                if (thisMapDist.doubleValue > sortMaxDist) {
                    sortMaxDist = thisMapDist.doubleValue;
                    maxIndex = j;
                }
            }
            [mapDistances removeObjectAtIndex:maxIndex];
            [nearbyMaps removeObjectAtIndex:maxIndex];
            maxDist = sortMaxDist;
        }
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
