//
//  MoreTableViewController.h
//  Maps05
//
//  Created by Mark Brautigam on 4/22/14.
//  Copyright (c) 2014 Mark Brautigam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Map.h"

@interface MoreTableViewController : UITableViewController

/*
@property (weak, nonatomic) IBOutlet UITableViewCell *MapCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *CompanyCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *YearCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *DescCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *LatCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *LonCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *CodeCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *MapIDCell;
 */

@property (nonatomic, retain) Map *map;

@end
