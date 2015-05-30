//
//  Player.h
//  Basketball
//
//  Created by Chieh-Fu Chen on 5/21/15.
//  Copyright (c) 2015 Chieh-Fu Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject {
    NSString *playerName;
    NSNumber *twoPointsMade;
    NSNumber *twoPointsAttempt;
    NSNumber *threePointsMade;
    NSNumber *threePointsAttempt;
    NSNumber *freeThrowsMade;
    NSNumber *freeThrowsAttempt;
    NSNumber *offRebounds;
    NSNumber *defRebounds;
    NSNumber *steals;
    NSNumber *assists;
    NSNumber *blocks;
    NSNumber *turnovers;
    NSNumber *fouls;
    NSNumber *totalPoints;
}

@property(nonatomic,retain) NSString *playerName;
@property(nonatomic,retain) NSNumber *twoPointsMade;
@property(nonatomic,retain) NSNumber *twoPointsAttempt;
@property(nonatomic,retain) NSNumber *threePointsMade;
@property(nonatomic,retain) NSNumber *threePointsAttempt;
@property(nonatomic,retain) NSNumber *freeThrowsMade;
@property(nonatomic,retain) NSNumber *freeThrowsAttempt;
@property(nonatomic,retain) NSNumber *offRebounds;
@property(nonatomic,retain) NSNumber *defRebounds;
@property(nonatomic,retain) NSNumber *steals;
@property(nonatomic,retain) NSNumber *assists;
@property(nonatomic,retain) NSNumber *blocks;
@property(nonatomic,retain) NSNumber *turnovers;
@property(nonatomic,retain) NSNumber *fouls;
@property(nonatomic,retain) NSNumber *totalPoints;

@end
