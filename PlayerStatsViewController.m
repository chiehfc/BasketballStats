//
//  PlayerStatsViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/22/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "PlayerStatsViewController.h"

@interface PlayerStatsViewController ()

@end

@implementation PlayerStatsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.player = [[Player alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)statsButtonPressed:(id)sender {
    
    if([sender isMemberOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton*)sender;
        
        if([btn.currentTitle isEqualToString:@"twoPointsMadePlus"]) {
            NSNumber *stats = self.player.twoPointsMade;
            self.player.twoPointsMade = [NSNumber numberWithInt:[self plusStats:0 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"twoPointsAttemptPlus"]) {
            NSNumber *stats = self.player.twoPointsAttempt;
            self.player.twoPointsAttempt = [NSNumber numberWithInt:[self plusStats:10 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"threePointsMadePlus"]) {
            NSNumber *stats = self.player.threePointsMade;
            self.player.threePointsMade = [NSNumber numberWithInt:[self plusStats:1 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"threePointsAttemptPlus"]) {
            NSNumber *stats = self.player.threePointsAttempt;
            self.player.threePointsAttempt = [NSNumber numberWithInt:[self plusStats:11 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"freeThrowsMadePlus"]) {
            NSNumber *stats = self.player.freeThrowsMade;
            self.player.freeThrowsMade = [NSNumber numberWithInt:[self plusStats:2 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"freeThrowsAttemptPlus"]) {
            NSNumber *stats = self.player.freeThrowsAttempt;
            self.player.freeThrowsAttempt = [NSNumber numberWithInt:[self plusStats:12 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"offReboundsPlus"]) {
            NSNumber *stats = self.player.offRebounds;
            self.player.offRebounds = [NSNumber numberWithInt:[self plusStats:3 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"defReboundsPlus"]) {
            NSNumber *stats = self.player.defRebounds;
            self.player.defRebounds = [NSNumber numberWithInt:[self plusStats:4 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"assistsPlus"]) {
            NSNumber *stats = self.player.assists;
            self.player.assists = [NSNumber numberWithInt:[self plusStats:5 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"stealsPlus"]) {
            NSNumber *stats = self.player.steals;
            self.player.steals = [NSNumber numberWithInt:[self plusStats:6 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"blocksPlus"]) {
            NSNumber *stats = self.player.blocks;
            self.player.blocks = [NSNumber numberWithInt:[self plusStats:7 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"turnoversPlus"]) {
            NSNumber *stats = self.player.turnovers;
            self.player.turnovers = [NSNumber numberWithInt:[self plusStats:8 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"foulsPlus"]) {
            NSNumber *stats = self.player.fouls;
            self.player.fouls = [NSNumber numberWithInt:[self plusStats:9 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"twoPointsMadeMinus"]) {
            NSNumber *stats = self.player.twoPointsMade;
            self.player.twoPointsMade = [NSNumber numberWithInt:[self minusStats:0 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"twoPointsAttemptMinus"]) {
            NSNumber *stats = self.player.twoPointsAttempt;
            self.player.twoPointsAttempt = [NSNumber numberWithInt:[self minusStats:10 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"threePointsMadeMinus"]) {
            NSNumber *stats = self.player.threePointsMade;
            self.player.threePointsMade = [NSNumber numberWithInt:[self minusStats:1 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"threePointsAttemptMinus"]) {
            NSNumber *stats = self.player.threePointsAttempt;
            self.player.threePointsAttempt = [NSNumber numberWithInt:[self minusStats:11 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"freeThrowsMadeMinus"]) {
            NSNumber *stats = self.player.freeThrowsMade;
            self.player.freeThrowsMade = [NSNumber numberWithInt:[self minusStats:2 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"freeThrowsAttemptMinus"]) {
            NSNumber *stats = self.player.freeThrowsAttempt;
            self.player.freeThrowsAttempt = [NSNumber numberWithInt:[self minusStats:12 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"offReboundsMinus"]) {
            NSNumber *stats = self.player.offRebounds;
            self.player.offRebounds = [NSNumber numberWithInt:[self minusStats:3 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"defReboundsMinus"]) {
            NSNumber *stats = self.player.defRebounds;
            self.player.defRebounds = [NSNumber numberWithInt:[self minusStats:4 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"assistsMinus"]) {
            NSNumber *stats = self.player.assists;
            self.player.assists = [NSNumber numberWithInt:[self minusStats:5 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"stealsMinus"]) {
            NSNumber *stats = self.player.steals;
            self.player.steals = [NSNumber numberWithInt:[self minusStats:6 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"blocksMinus"]) {
            NSNumber *stats = self.player.blocks;
            self.player.blocks = [NSNumber numberWithInt:[self minusStats:7 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"turnoversMinus"]) {
            NSNumber *stats = self.player.turnovers;
            self.player.turnovers = [NSNumber numberWithInt:[self minusStats:8 playerStats:stats]];
        }
        else if([btn.currentTitle isEqualToString:@"foulsMinus"]) {
            NSNumber *stats = self.player.fouls;
            self.player.fouls = [NSNumber numberWithInt:[self minusStats:9 playerStats:stats]];
        }
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", [self calculateTotalPoints]];
    NSDictionary *dataDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:[self.player.totalPoints intValue]] forKey:@"totalPoints"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"scoreChanged" object:self userInfo:dataDict];
}

- (int)plusStats:(int)index playerStats:(NSNumber*)stats
{
    UILabel *lbl = [self.statsLabels objectAtIndex:index];
    stats = [NSNumber numberWithInt:[stats intValue]+1];
    lbl.text = [NSString stringWithFormat:@"%@", stats];
    return [stats intValue];
}

- (int)minusStats:(int)index playerStats:(NSNumber*)stats
{
    if([stats intValue]==0)
        return 0;

    UILabel *lbl = [self.statsLabels objectAtIndex:index];
    stats = [NSNumber numberWithInt:[stats intValue]-1];
    lbl.text = [NSString stringWithFormat:@"%@", stats];
    return [stats intValue];
}

- (int)calculateTotalPoints
{
    self.player.totalPoints = [NSNumber numberWithInt:[self.player.twoPointsMade intValue]*2+[self.player.threePointsMade intValue]*3+[self.player.freeThrowsMade intValue]*1 ];
    return [self.player.twoPointsMade intValue]*2+[self.player.threePointsMade intValue]*3+[self.player.freeThrowsMade intValue]*1;
}

@end
