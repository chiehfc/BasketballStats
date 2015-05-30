//
//  PlayerStatsTableViewController.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/25/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "StatsPanelViewController.h"


@interface PlayerStatsTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
{
    StatsPanelViewController *statsPanelVC;
    
    IBOutlet UITableView *tableViewObject;
    int score;
}

@property (nonatomic, strong) NSMutableArray *playerArray;
@end
