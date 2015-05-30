//
//  StatsPanelViewController.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/25/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
@interface StatsPanelViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *statsButton;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *statsLabels;

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) UITableView *tableViewObject;

- (void)setupPlayer:(Player *)player;

@end
