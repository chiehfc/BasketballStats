//
//  Player.m
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/21/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize playerName,
            twoPointsMade,
            twoPointsAttempt,
            threePointsMade,
            threePointsAttempt,
            freeThrowsMade,
            freeThrowsAttempt,
            offRebounds,
            defRebounds,
            steals,
            assists,
            blocks,
            turnovers,
            fouls,
            totalPoints;

- (id)init {
    if(!(self = [super init]))
    {
        return nil;
    }
    
    playerName = @"";
    twoPointsMade = [NSNumber numberWithInt:0];
    twoPointsAttempt = [NSNumber numberWithInt:0];
    threePointsMade = [NSNumber numberWithInt:0];
    threePointsAttempt = [NSNumber numberWithInt:0];
    freeThrowsMade = [NSNumber numberWithInt:0];
    freeThrowsAttempt = [NSNumber numberWithInt:0];
    offRebounds = [NSNumber numberWithInt:0];
    defRebounds = [NSNumber numberWithInt:0];
    steals = [NSNumber numberWithInt:0];
    assists = [NSNumber numberWithInt:0];
    blocks = [NSNumber numberWithInt:0];
    turnovers = [NSNumber numberWithInt:0];
    fouls = [NSNumber numberWithInt:0];
    totalPoints = [NSNumber numberWithInt:0];
    
    return self;
}

@end
