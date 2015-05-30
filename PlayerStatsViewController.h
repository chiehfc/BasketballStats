//
//  PlayerStatsViewController.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/22/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"

@interface PlayerStatsViewController : UIViewController
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *statsButton;
@property (strong, nonatomic) IBOutlet UITextField *playerName;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *statsLabels;

@property (strong, nonatomic) Player *player;

@end
