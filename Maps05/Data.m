//
//  Data.m
//  Maps05
//
//  Created by Mark Brautigam on 4/17/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import "Data.h"
#import "Map.h"

@implementation Data

// static Data* sharedInstance = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        if (maps == nil) {
            maps = [NSMutableArray arrayWithCapacity:100];
            NSString * strMap;
            
            strMap = @"ariz_chir|Arizona|Chiricahua National Monument|Chevron|1950|32.002225|-109.342631";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"ariz_gc|Arizona|Grand Canyon|Chevron|1949|36.231719|-113.030911";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"ariz_montezuma|Arizona|Montezuma Castle|Chevron|1957|34.611576|-111.834985";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"ariz_saguaro|Arizona|Saguaro National Monument|Chevron|1964|32.296736|-111.166615";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"ariz_sf_peaks|Arizona|San Francisco Peaks|Chevron|1963|35.346709|-111.678085";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"al-la-ms-58|Arkansas - Lousiana - Mississippi|Pirate's Alley, New Orleans|Esso|1964|29.951862|-90.063146,";
            [maps addObject:[self strToMap:strMap]];
            
            Map *map = [[Map alloc] init];
            map.title = @"Arkansas, Louisiana, Mississippi";
            map.subtitle = @"Old State House";
            map.company = @"KYSO";
            map.year = @"1959";
            map.picture = @"Arkansas_1959_Esso_crop";
            map.description = @"Old State House, Little Rock, Ark.";
            // Latlong: 34.748493,-92.27272
            map.latitude = 34.74849;
            map.longitude = -92.2727;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Atlanta";
            map.subtitle = @"Battle of Atlanta Cyclorama";
            map.company = @"KYSO";
            map.year = @"1961";
            map.picture = @"atlanta-kyso";
            map.description = @"Battle of Atlanta Cyclorama in Grant Park";
            // Latlong: 33.734138,-84.371028
            map.latitude = 33.73413;
            map.longitude = -84.37102;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Boston";
            map.subtitle = @"Public Gardens";
            map.company = @"Esso";
            map.year = @"1960";
            map.picture = @"boston_esso";
            map.description = @"The Public Gardens, Boston, Mass.";
            // Latlong: 42.356294,-71.065123
            map.latitude = 42.35629;
            map.longitude = -71.06512;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"California";
            map.subtitle = @"Napa Valley Vineyards";
            map.company = @"Shell";
            map.year = @"1972-1974";
            map.picture = @"california_shell";
            map.description = @"Vineyards in the Napa Valley";
            // 38.4298199,-122.4208311
            map.latitude = 38.429819;
            map.longitude = -122.420831;
            [maps addObject:map];
            
            strMap = @"colo_dark|Colorado|Rocky Mountain National Park|Chevron|19xx|40.342793|-105.683639";
            [maps addObject:[self strToMap:strMap]];
            
            map = [[Map alloc] init];
            map.title = @"Chicago";
            map.subtitle = @"Lake Michigan Skyline";
            map.company = @"Shell";
            map.year = @"1972-1974";
            map.picture = @"chicago-shell";
            map.description = @"Lake Michigan Skyline";
            // 41.878876,-87.635915
            map.latitude = 41.87887;
            map.longitude = -87.63591;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Delaware, Maryland, Virginia, West Virginia";
            map.subtitle = @"Pohick Church";
            map.company = @"Esso";
            map.year = @"1950";
            map.picture = @"del_md_va_esso";
            map.description = @"Pohick Church, near Mount Vernon, Va. (George Washington's Home Church)";
            // Latlong: 38.719842,-77.150617
            map.latitude = 38.71984;
            map.longitude = -77.15061;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Delaware, Maryland, Virginia, West Virginia";
            map.subtitle = @"Harpers Ferry";
            map.company = @"Esso";
            map.year = @"1949";
            map.picture = @"del-md-va-esso-harper";
            map.description = @"Harpers Ferry, West Virginia";
            // Latlong: 39.325379,-77.738882
            map.latitude = 39.32537;
            map.longitude = -77.73888;
            [maps addObject:map];
            
            strMap = @"el_paso|El Paso|El Paso Skyline|Chevron|19xx|31.769956|-106.496806";
            [maps addObject:[self strToMap:strMap]];
            
            map = [[Map alloc] init];
            map.title = @"Florida";
            map.subtitle = @"Stephen Foster Memorial";
            map.company = @"KYSO";
            map.year = @"1954";
            map.picture = @"florida_kyso_foster";
            map.description = @"Stephen Foster Memorial on the Suwannee River, White Springs";
            // 30.332385,-82.764822
            map.latitude = 30.33238;
            map.longitude = -82.76482;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Florida";
            map.subtitle = @"West Martello Tower";
            map.company = @"KYSO";
            map.year = @"1951";
            map.picture = @"florida_kyso";
            map.description = @"West Martello Tower at Key West. Built about 1860 and now an art gallery.";
            // 24.547508,-81.785972
            map.latitude = 24.54750;
            map.longitude = -81.78597;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Florida";
            map.subtitle = @"St. Petersburg Beach";
            map.company = @"KYSO";
            map.year = @"1952";
            map.picture = @"florida-kyso-stpete";
            map.description = @"Spa Beach and Municipal Pier, St. Petersburg";
            // 27.7789724,-82.6764608
            map.latitude = 27.778972;
            map.longitude = -82.676460;
            [maps addObject:map];
            
            strMap = @"ga_al_ave_maria_58|Georgia - Alabama|Ave Maria Grotto|KYSO|1958|34.174117|-86.813697";
            [maps addObject:[self strToMap:strMap]];
            
            map = [[Map alloc] init];
            map.title = @"Jacksonville, Florida";
            map.subtitle = @"Jacksonville Beach Pier";
            map.company = @"Shell";
            map.year = @"1972";
            map.picture = @"Jacksonville";
            map.description = @"Jacksonville Beach Pier";
            // 30.29336,-81.390186
            map.latitude = 30.2933;
            map.longitude = -81.39018;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Los Angeles";
            map.subtitle = @"Civc Center";
            map.company = @"Chevron";
            map.year = @"1952";
            map.picture = @"los_angeles_ch";
            map.description = @"Civc Center";
            // Latlong: 34.052339,-118.239505
            map.latitude = 34.05233;
            map.longitude = -118.23950;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Massachusetts, Connecticut, Rhode Island";
            map.subtitle = @"Autumn in the Berkshires";
            map.company = @"Calso";
            map.year = @"1951";
            map.picture = @"mass_conn_ri_51";
            map.description = @"Autumn in the Berkshires";
            // 42.6310145,-70.6876914
            map.latitude = 42.3536865;
            map.longitude = -73.3244839;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Massachusetts, Connecticut, Rhode Island";
            map.subtitle = @"Gloucester";
            map.company = @"Calso";
            map.year = @"1955";
            map.picture = @"ma_ct_ri_ch_conn";
            map.description = @"Gloucester, MA";
            // 42.6310145,-70.6876914
            map.latitude = 42.631014;
            map.longitude = -70.687691;
            [maps addObject:map];
            
            strMap = @"missouri|Missouri|Hodgson Mill in Sycamore|Shell|1973|36.7029462|-92.2744974";
            [maps addObject:[self strToMap:strMap]];

            map = [[Map alloc] init];
            map.title = @"Montana";
            map.subtitle = @"Glacier National Park";
            map.company = @"Chevron";
            map.year = @"1950";
            map.picture = @"Montana1950Chevron";
            map.description = @"St. Mary Lake in Glacier National Park";
            // 48.7140714,-113.4876451
            map.latitude = 48.714071;
            map.longitude = -113.487645;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Nashville";
            map.subtitle = @"The Hermitage";
            map.company = @"Esso";
            map.year = @"19??";
            map.picture = @"nashville_esso";
            map.description = @"The Hermitage, near Nashville (Home of President Andrew Jackson)";
            // 36.214479,-86.613074
            map.latitude = 36.21447;
            map.longitude = -86.61307;
            [maps addObject:map];
            
            strMap = @"nebraska_60|Nebraska|Scotts Bluff National Monument|Chevron|1960|41.83168|-103.716122";
            [maps addObject:[self strToMap:strMap]];
            
            map = [[Map alloc] init];
            map.title = @"Nevada";
            map.subtitle = @"Ghost town";
            map.company = @"Shell";
            map.year = @"1973";
            map.picture = @"nevada-shell";
            map.description = @"Silence in a Nevada ghost town";
            // 40.445833,-118.122222
            map.latitude = 40.44583;
            map.longitude = -118.12222;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New England";
            map.subtitle = @"Plymouth";
            map.company = @"Esso";
            map.year = @"1952";
            map.picture = @"new_england_esso_1";
            map.description = @"Pilgrims land at Plymouth, Mass.";
            // Latlong: 41.958446,-70.667262
            map.latitude = 41.95844;
            map.longitude = -70.66726;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New England";
            map.subtitle = @"Wiscasset, Maine";
            map.company = @"Esso";
            map.year = @"1950";
            map.picture = @"new_england_esso_3";
            map.description = @"Main Street, Wiscasset, Maine";
            // 44.0028346,-69.6659444
            map.latitude = 44.002834;
            map.longitude = -69.665944;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New Hampshire - Vermont";
            map.subtitle = @"Connecticut River";
            map.company = @"Calso";
            map.year = @"1955";
            map.picture = @"nh_vt_ch";
            map.description = @"Connecticut River";
            // 42.3341263,-72.5973126
            map.latitude = 42.334126;
            map.longitude = -72.597312;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New Jersey";
            map.subtitle = @"Ringwood Manor State Park";
            map.company = @"Esso";
            map.year = @"1964";
            map.picture = @"jersey_esso_3";
            map.description = @"Ringwood Manor State Park, Ringwood";
            // Latlong: 41.13623,-74.256262
            map.latitude = 41.1362;
            map.longitude = -74.25626;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New Jersey";
            map.subtitle = @"Washington's HQ, Morristown";
            map.company = @"Esso";
            map.year = @"1950";
            map.picture = @"jersey_esso_4";
            map.description = @"Washington's Headquarters, Morristown";
            // 40.797359,-74.46714
            map.latitude = 40.79735;
            map.longitude = -74.4671;
            [maps addObject:map];
            
            strMap = @"new_mex_taos|Nex Mexico|Taos Pueblo|Chevron|19xx|36.438179|-105.547389";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"new_orleans_64|New Orleans|St. Louis Cathedral|Esso|1958|29.9577095|-90.0633115";
            [maps addObject:[self strToMap:strMap]];

            map = [[Map alloc] init];
            map.title = @"New York";
            map.subtitle = @"Lake George";
            map.company = @"Esso";
            map.year = @"1950";
            map.picture = @"NY_esso_3";
            map.description = @"Lake George";
            // 43.426329,-73.7145539
            map.latitude = 43.42632;
            map.longitude = -73.714553;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New York City";
            map.subtitle = @"Lower Manhattan";
            map.company = @"Shell";
            map.year = @"1972";
            map.picture = @"nyc-shell";
            map.description = @"Lower Manhattan";
            // 40.7214947,-73.9954898
            map.latitude = 40.721494;
            map.longitude = -73.995489;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"New York World's Fair";
            map.subtitle = @"World's Fair 1964";
            map.company = @"Texaco";
            map.year = @"1964";
            map.picture = @"ny-worlds-fair-texaco";
            map.description = @"New York World's Fair, 1964";
            // 40.7374548,-73.84602
            map.latitude = 40.737454;
            map.longitude = -73.8460;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"North and South Carolina";
            map.subtitle = @"Brookgreen Gardens";
            map.company = @"Esso";
            map.year = @"1951";
            map.picture = @"ns_carolina_esso_3";
            map.description = @"Brookgreen Gardens, north of Georgetown, S.C.";
            // 33.513895,-79.085228
            map.latitude = 33.51389;
            map.longitude = -79.08522;
            [maps addObject:map];
            
            strMap = @"dakotas_61|North and South Dakota|Mount Rushmore|Chevron|1961|43.879102|-103.459067";
            [maps addObject:[self strToMap:strMap]];
            
            map = [[Map alloc] init];
            map.title = @"Oakland";
            map.subtitle = @"Bay Bridge";
            map.company = @"Shell";
            map.year = @"1972-1974";
            map.picture = @"oakland-shell";
            map.description = @"Bay Bridge in the Evening";
            // 37.79822,-122.377738
            map.latitude = 37.7982;
            map.longitude = -122.37773;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Oklahoma";
            map.subtitle = @"Will Rogers Memorial";
            map.company = @"Chevron";
            map.year = @"1961";
            map.picture = @"okla_ch";
            map.description = @"Will Rogers Memorial";
            // 36.321081,-95.631427
            map.latitude = 36.32108;
            map.longitude = -95.63142;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Oregon";
            map.subtitle = @"Diamond Lake";
            map.company = @"Chevron";
            map.year = @"1952";
            map.picture = @"oregon_52_ch";
            map.description = @"Diamond Lake";
            // 43.1604543,-122.1522878
            map.latitude = 43.160454;
            map.longitude = -122.152287;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Pennsylvania";
            map.subtitle = @"Liberty Bell";
            map.company = @"Esso";
            map.year = @"1951";
            map.picture = @"penn_esso_5";
            map.description = @"Liberty Bell, Independence Hall, Philadelphia";
            // Latlong: 39.94961,-75.150282
            map.latitude = 39.9496;
            map.longitude = -75.15028;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Philadelphia";
            map.subtitle = @"Independence Hall";
            map.company = @"Shell";
            map.year = @"1972-1974";
            map.picture = @"philadelphia-shell";
            map.description = @"Independence Hall";
            // Latlong: 39.948837,-75.149995
            map.latitude = 39.94883;
            map.longitude = -75.14999;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Portland";
            map.subtitle = @"Mount Hood";
            map.company = @"Chevron";
            map.year = @"1952 maybe";
            map.picture = @"portland_52qq_ch";
            map.description = @"Mount Hood from Portland in the Evening";
            // Latlong: 45.373444,-121.695662
            map.latitude = 45.37344;
            map.longitude = -121.69566;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Seattle";
            map.subtitle = @"Space Needle";
            map.company = @"Chevron";
            map.year = @"1962";
            map.picture = @"seattle_ch";
            map.description = @"Seattle World's Fair 1962 (Space Needle)";
            // Latlong: 47.620467,-122.349116
            map.latitude = 47.62046;
            map.longitude = -122.34911;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"San Francisco and Peninsula";
            map.subtitle = @"Cable Car";
            map.company = @"Shell";
            map.year = @"1972-1974";
            map.picture = @"sf-peninsula-shell";
            map.description = @"Cable Car";
            // 37.7948128,-122.4119646
            map.latitude = 37.794812;
            map.longitude = -122.411964;
            [maps addObject:map];
            
            map = [[Map alloc] init];
            map.title = @"Southern New England";
            map.subtitle = @"Faneuil Hall";
            map.company = @"Esso";
            map.year = @"1950";
            map.picture = @"new_england_esso_s";
            map.description = @"Faneuil Hall, Boston. The Cradle of Liberty.";
            // Latlong: 42.360062,-71.056103
            map.latitude = 42.36006;
            map.longitude = -71.05610;
            [maps addObject:map];
            
            strMap = @"texas|Texas|Big Bend National Park|Chevron|1958|29.127487|-103.242538";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"utah_bryce|Utah|Bryce Canyon National Park|Chevron|1949|37.593038|-112.18709";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"utah_reef|Utah|Capitol Reef National Monument|Chevron|1952|38.36697|-111.261504";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"utah_timp|Utah|Mount Timpanogos|Chevron|1953|40.390787|-111.645755";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"utah_zion|Utah|Zion National Park|Chevron|1954|37.200022|-112.986316";
            [maps addObject:[self strToMap:strMap]];
            
            strMap = @"wyoming|Wyoming|Yellowstone Falls|Chevron|19xx|44.712681|-110.500124";
            [maps addObject:[self strToMap:strMap]];
        }
    }
    return self;
}

- (Map*) strToMap:(NSString*)strMap {
    NSArray *parts = [strMap componentsSeparatedByString:@"|"];
    Map *map = [[Map alloc] init];
    map.title = [parts objectAtIndex:1];
    map.subtitle = map.description = [parts objectAtIndex:2];
    map.company = [parts objectAtIndex:3];
    map.year = [parts objectAtIndex:4];
    map.picture = [parts objectAtIndex:0];
    map.latitude = [[parts objectAtIndex:5] doubleValue];
    map.longitude = [[parts objectAtIndex:6] doubleValue];
    return map;
}

+ (Data*) sharedMapData {
    
    static Data *sharedMapData = nil;
    
    @synchronized (self)
    {
        if (sharedMapData == nil) {
            sharedMapData = [[Data alloc] init];
        }
        return sharedMapData;
    }
}

- (NSMutableArray*) getMaps {
    return maps;
}

@end
