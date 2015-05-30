//
//  ViewController.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 3/11/14.
//  Copyright (c) 2014 Chieh-Fu Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) int twoPoints;
@property (nonatomic, copy) NSString *statsFileName;
@end

@implementation ViewController
@synthesize managedObjectContext = _managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    [self addPlayerStats];
    [self addScoreDisplay];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                        selector:@selector(homeScoreChanged:)
                                        name:@"homeScore" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (IBAction)saveButtonPressed:(id)sender {

    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Type the file name"
                                                                   message:@"save your stats"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"File name";
     }];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              UITextField *fileName = alert.textFields.firstObject;
                                                              self.statsFileName = [NSString stringWithString:fileName.text];
                                                              [self saveDataIntoDatabase];
                                                          }];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)newButtonPressed:(id)sender {
    for (UIView *subView in self.view.subviews)
    {
        if ([subView isKindOfClass:[PlayerStatsTableViewController class]])
        {
            [subView removeFromSuperview];
        }
    }
    [self addPlayerStats];
    [self addScoreDisplay];
}

- (void)homeScoreChanged:(NSNotification *)note {
    NSDictionary *theData = [note userInfo];
    if (theData != nil) {
        NSNumber *n = [theData objectForKey:@"homeScore"];
        int score = [n intValue];
        scoreDisplayVC.homeScoreLabel.text = [NSString stringWithFormat:@"%d", score];
    }
}

- (void)addPlayerStats {
    testVC = [[PlayerStatsTableViewController alloc] initWithNibName:@"PlayerStatsTableViewController" bundle:[NSBundle mainBundle]];
    testVC.view.frame = CGRectMake(10, 40, 950, 650);
    [self addChildViewController:testVC];
    [self.view addSubview:testVC.view];
}

- (void)addScoreDisplay {
    scoreDisplayVC = [[ScoreDisplayViewController alloc] initWithNibName:@"ScoreDisplayViewController" bundle:[NSBundle mainBundle]];
    scoreDisplayVC.view.frame = CGRectMake(710, 40, 300, 264);
    [self addChildViewController:scoreDisplayVC];
    [self.view addSubview:scoreDisplayVC.view];
}

- (void)saveDataIntoDatabase {
    NSManagedObjectContext *context = [self managedObjectContext];
    // Create a new managed object
    NSManagedObject *info = [NSEntityDescription insertNewObjectForEntityForName:@"GameInfo" inManagedObjectContext:context];
    [info setValue:self.statsFileName forKey:@"fileName"];
    
    for(int i=0;i<12;i++) {
        NSManagedObject *stats = [NSEntityDescription
                                  insertNewObjectForEntityForName:@"PlayerStats"
                                  inManagedObjectContext:context];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] playerName] forKey:@"playerName"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] twoPointsMade] forKey:@"twoPointsMade"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] twoPointsAttempt] forKey:@"twoPointsMiss"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] threePointsMade] forKey:@"threePointsMade"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] threePointsAttempt] forKey:@"threePointsMiss"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] freeThrowsMade] forKey:@"freeThrowsMade"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] freeThrowsAttempt] forKey:@"freeThrowsMiss"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] offRebounds] forKey:@"offRebounds"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] defRebounds] forKey:@"defRebounds"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] assists] forKey:@"assists"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] steals] forKey:@"steals"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] blocks] forKey:@"blocks"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] turnovers] forKey:@"turnovers"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] fouls] forKey:@"fouls"];
        [stats setValue:[[testVC.playerArray objectAtIndex:i] totalPoints] forKey:@"totalPoints"];
        [stats setValue:info forKey:@"toGameInfo"];
    }
    
    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}

@end
