//
//  HistoryPlayerStatsTableViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/27/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "HistoryPlayerStatsTableViewController.h"
#import "PlayersStatsTableViewCell.h"
@interface HistoryPlayerStatsTableViewController ()

@property (strong) NSMutableArray *playerStats;
@property (strong) NSMutableArray *games;
@end

@implementation HistoryPlayerStatsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"GameInfo"];
    self.games = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    NSManagedObject *info = [self.games objectAtIndex:self.index];
    NSSet *details = [info valueForKey:@"toPlayerStats"];
    self.playerStats = [[details allObjects] mutableCopy];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 12;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *tableviewCell = @"PlayersStatsTableViewCell";
    PlayersStatsTableViewCell *cell = (id)[tableView dequeueReusableCellWithIdentifier:tableviewCell];
    
    if(!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"PlayersStatsTableViewCell" bundle:nil] forCellReuseIdentifier:tableviewCell];
        cell = [tableView dequeueReusableCellWithIdentifier:tableviewCell];
    }
    cell.playerName.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] playerName]];
    cell.twoPointsMade.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] twoPointsMade]];
    cell.twoPointsMiss.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] twoPointsMiss]];
    cell.threePointsMade.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] threePointsMade]];
    cell.threePointsMiss.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] threePointsMiss]];
    cell.freeThrowsMade.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] freeThrowsMade]];
    cell.freeThrowsMiss.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] freeThrowsMiss]];
    cell.offRebounds.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] offRebounds]];
    cell.defRebounds.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] defRebounds]];
    cell.assists.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] assists]];
    cell.steals.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] steals]];
    cell.blocks.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] blocks]];
    cell.turnovers.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] turnovers]];
    cell.fouls.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] fouls]];
    cell.totalPoints.text = [NSString stringWithFormat:@"%@", [[self.playerStats objectAtIndex:indexPath.row] totalPoints]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
