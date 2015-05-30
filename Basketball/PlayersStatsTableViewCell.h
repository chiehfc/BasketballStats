//
//  PlayersStatsTableViewCell.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/25/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayersStatsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *playerName;
@property (strong, nonatomic) IBOutlet UILabel *twoPointsMade;
@property (strong, nonatomic) IBOutlet UILabel *twoPointsMiss;
@property (strong, nonatomic) IBOutlet UILabel *threePointsMade;
@property (strong, nonatomic) IBOutlet UILabel *threePointsMiss;
@property (strong, nonatomic) IBOutlet UILabel *freeThrowsMade;
@property (strong, nonatomic) IBOutlet UILabel *freeThrowsMiss;
@property (strong, nonatomic) IBOutlet UILabel *offRebounds;
@property (strong, nonatomic) IBOutlet UILabel *defRebounds;
@property (strong, nonatomic) IBOutlet UILabel *assists;
@property (strong, nonatomic) IBOutlet UILabel *steals;
@property (strong, nonatomic) IBOutlet UILabel *blocks;
@property (strong, nonatomic) IBOutlet UILabel *turnovers;
@property (strong, nonatomic) IBOutlet UILabel *fouls;
@property (strong, nonatomic) IBOutlet UILabel *totalPoints;

@end
