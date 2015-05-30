//
//  ScoreDisplayViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/22/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "ScoreDisplayViewController.h"

@interface ScoreDisplayViewController ()

@end

@implementation ScoreDisplayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    guestScore = 0;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guestScoreButtonsPressed:(id)sender {
    if([sender isMemberOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)sender;
        
        if([btn tag]==10) {
            guestScore-=1;
        } else if([btn tag]==11) {
            guestScore+=1;
        } else if([btn tag]==12) {
            guestScore-=2;
        } else if([btn tag]==13) {
            guestScore+=2;
        } else if([btn tag]==14) {
            guestScore-=3;
        } else if([btn tag]==15) {
            guestScore+=3;
        }
    }
    if(guestScore<0) {
        guestScore=0;
    }
    self.guestScoreLabel.text = [NSString stringWithFormat:@"%d", guestScore];
}

@end
