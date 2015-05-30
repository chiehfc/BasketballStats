//
//  StatsPanelViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/25/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "StatsPanelViewController.h"

@interface StatsPanelViewController ()

@end

@implementation StatsPanelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupPlayer:(Player *)player
{
    self.player = player;
}

- (IBAction)statsButtonPressed:(id)sender {
    
    if([sender isMemberOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)sender;

        if([btn tag]==10) {
            NSNumber *stats = self.player.twoPointsMade;
            self.player.twoPointsMade = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==11) {
            NSNumber *stats = self.player.twoPointsMade;
            self.player.twoPointsMade = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==12) {
            NSNumber *stats = self.player.threePointsMade;
            self.player.threePointsMade = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==13) {
            NSNumber *stats = self.player.threePointsMade;
            self.player.threePointsMade = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==14) {
            NSNumber *stats = self.player.freeThrowsMade;
            self.player.freeThrowsMade = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==15) {
            NSNumber *stats = self.player.freeThrowsMade;
            self.player.freeThrowsMade = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        
        else if([btn tag]==20) {
            NSNumber *stats = self.player.twoPointsAttempt;
            self.player.twoPointsAttempt = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==21) {
            NSNumber *stats = self.player.twoPointsAttempt;
            self.player.twoPointsAttempt = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==22) {
            NSNumber *stats = self.player.threePointsAttempt;
            self.player.threePointsAttempt = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==23) {
            NSNumber *stats = self.player.threePointsAttempt;
            self.player.threePointsAttempt = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==24) {
            NSNumber *stats = self.player.freeThrowsAttempt;
            self.player.freeThrowsAttempt = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==25) {
            NSNumber *stats = self.player.freeThrowsAttempt;
            self.player.freeThrowsAttempt = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        
        else if([btn tag]==30) {
            NSNumber *stats = self.player.offRebounds;
            self.player.offRebounds = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==31) {
            NSNumber *stats = self.player.offRebounds;
            self.player.offRebounds = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==32) {
            NSNumber *stats = self.player.defRebounds;
            self.player.defRebounds = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==33) {
            NSNumber *stats = self.player.defRebounds;
            self.player.defRebounds = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==34) {
            NSNumber *stats = self.player.assists;
            self.player.assists = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==35) {
            NSNumber *stats = self.player.assists;
            self.player.assists = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        
        else if([btn tag]==40) {
            NSNumber *stats = self.player.steals;
            self.player.steals = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==41) {
            NSNumber *stats = self.player.steals;
            self.player.steals = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==42) {
            NSNumber *stats = self.player.blocks;
            self.player.blocks = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==43) {
            NSNumber *stats = self.player.blocks;
            self.player.blocks = [NSNumber numberWithInt:[self plusStats:stats]];
        }
        else if([btn tag]==44) {
            NSNumber *stats = self.player.turnovers;
            self.player.turnovers = [NSNumber numberWithInt:[self minusStats:stats]];
        }
        else if([btn tag]==45) {
            NSNumber *stats = self.player.turnovers;
            self.player.turnovers = [NSNumber numberWithInt:[self plusStats:stats]];
        }
    }
    [self calculateTotalPoints];
    [self.tableViewObject reloadData];
}

- (int)plusStats:(NSNumber*)stats
{
    stats = [NSNumber numberWithInt:[stats intValue]+1];
    return [stats intValue];
}

- (int)minusStats:(NSNumber*)stats
{
    if([stats intValue]==0)
        return 0;
    stats = [NSNumber numberWithInt:[stats intValue]-1];
    return [stats intValue];
}

- (int)calculateTotalPoints
{
    self.player.totalPoints = [NSNumber numberWithInt:[self.player.twoPointsMade intValue]*2+[self.player.threePointsMade intValue]*3+[self.player.freeThrowsMade intValue]*1 ];
    return [self.player.twoPointsMade intValue]*2+[self.player.threePointsMade intValue]*3+[self.player.freeThrowsMade intValue]*1;
}

@end
