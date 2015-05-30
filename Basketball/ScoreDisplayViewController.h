//
//  ScoreDisplayViewController.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/22/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreDisplayViewController : UIViewController
{
    int guestScore;
}
@property (strong, nonatomic) IBOutlet UILabel *guestScoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *homeScoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *scoreSettingButtons;

@end
