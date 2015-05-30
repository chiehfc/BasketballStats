//
//  PlayerStatsTableViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/25/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "PlayerStatsTableViewController.h"
#import "PlayersStatsTableViewCell.h"

@interface PlayerStatsTableViewController ()

@end

@implementation PlayerStatsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.playerArray = [[NSMutableArray alloc] init];
    for(int i=0;i<12;i++) {
        Player *player = [[Player alloc] init];
        [self.playerArray addObject:player];
    }
    tableViewObject.scrollEnabled = false;
    tableViewObject.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableviewCell = @"PlayersStatsTableViewCell";
    PlayersStatsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableviewCell];
    Player *player = [self.playerArray objectAtIndex:indexPath.row];
    if(!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"PlayersStatsTableViewCell" bundle:nil] forCellReuseIdentifier:tableviewCell];
        cell = [tableView dequeueReusableCellWithIdentifier:tableviewCell];
    }
    cell.playerName.delegate = self;

    cell.twoPointsMade.text = [NSString stringWithFormat:@"%d", [player.twoPointsMade intValue]];
    cell.twoPointsMiss.text = [NSString stringWithFormat:@"%d", [player.twoPointsAttempt intValue]];
    cell.threePointsMade.text = [NSString stringWithFormat:@"%d", [player.threePointsMade intValue]];
    cell.threePointsMiss.text = [NSString stringWithFormat:@"%d", [player.threePointsAttempt intValue]];
    cell.freeThrowsMade.text = [NSString stringWithFormat:@"%d", [player.freeThrowsMade intValue]];
    cell.freeThrowsMiss.text = [NSString stringWithFormat:@"%d", [player.freeThrowsAttempt intValue]];
    cell.offRebounds.text = [NSString stringWithFormat:@"%d", [player.offRebounds intValue]];
    cell.defRebounds.text = [NSString stringWithFormat:@"%d", [player.defRebounds intValue]];
    cell.assists.text = [NSString stringWithFormat:@"%d", [player.assists intValue]];
    cell.steals.text = [NSString stringWithFormat:@"%d", [player.steals intValue]];
    cell.blocks.text = [NSString stringWithFormat:@"%d", [player.blocks intValue]];
    cell.turnovers.text = [NSString stringWithFormat:@"%d", [player.turnovers intValue]];
    cell.fouls.text = [NSString stringWithFormat:@"%d", [player.fouls intValue]];
    cell.totalPoints.text = [NSString stringWithFormat:@"%d", [player.totalPoints intValue]];
    
    [self setHomeScoreNotification];
    
    return cell;
}

- (void)setHomeScoreNotification
{
    score = 0;
    for(Player *s in self.playerArray) {
        score += [s.totalPoints intValue];
    }
    NSDictionary *dataDict = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:score] forKey:@"homeScore"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"homeScore" object:self userInfo:dataDict];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    statsPanelVC.view.hidden = YES;
    Player *selectedPlayer = [self.playerArray objectAtIndex:indexPath.row];
    
    statsPanelVC = [[StatsPanelViewController alloc] initWithNibName:@"StatsPanelViewController" bundle:[NSBundle mainBundle]];
    [statsPanelVC setupPlayer:selectedPlayer];
    statsPanelVC.tableViewObject = tableViewObject;
    statsPanelVC.view.frame = CGRectMake(700,290,250,360);
    [self addChildViewController:statsPanelVC];
    [self.view addSubview:statsPanelVC.view];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

-(void) textFieldDidEndEditing: (UITextField * ) textField {
    id textFieldSuper = textField;
    while (![textFieldSuper isKindOfClass:[PlayersStatsTableViewCell class]]) {
        textFieldSuper = [textFieldSuper superview];
    }
    // Get that cell's index path
    NSIndexPath *indexPath = [tableViewObject indexPathForCell:(PlayersStatsTableViewCell *)textFieldSuper];
    Player *player = [self.playerArray objectAtIndex:indexPath.row];
    player.playerName = [NSString stringWithFormat:@"%@", textField.text];
}

@end
