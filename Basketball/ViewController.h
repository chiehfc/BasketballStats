//
//  ViewController.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 3/11/14.
//  Copyright (c) 2014 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerStatsViewController.h"
#import "ScoreDisplayViewController.h"
#import "PlayerStatsTableViewController.h"
@interface ViewController : UIViewController
{
    PlayerStatsViewController *playerStatsVC2;
    PlayerStatsViewController *playerStatsVC;
    ScoreDisplayViewController *scoreDisplayVC;
    
    IBOutlet UIButton *saveButton;
    PlayerStatsTableViewController *testVC;
    IBOutlet UIButton *newButton;
}
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@end
