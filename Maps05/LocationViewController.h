//
//  LocationViewController.h
//  Maps05
//
//  Created by Mark Brautigam on 4/26/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Map.h"

@interface LocationViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, retain) NSMutableArray *nearbyMaps;
@property (nonatomic, retain) NSMutableArray *mapDistances;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic, retain) CLLocation *currentLocation;

@end
