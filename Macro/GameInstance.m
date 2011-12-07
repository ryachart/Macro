//
//  GameInstance.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameInstance.h"
#import "Map.h"
#import "Player.h"

@interface GameInstance ()

@end

@implementation GameInstance
@synthesize map;
@synthesize players;
@synthesize gameDuration;
@synthesize localPlayer;

-(id)initWithMap:(Map*)newMap andPlayers:(NSArray*)newPlayers{
    if (self = [super init]){
        self.map = newMap;
        self.players = newPlayers;
        gameDuration = 0.0;
    }
    return self;
}

-(void)update:(CFTimeInterval)interval{
    
    self.gameDuration += interval;
    
    for (Player *player in self.players){
        [player update:interval];
    }
    NSLog(@"%1.2f", gameDuration);
}

-(Player*)localPlayer{
    //First player in the players array is always the local player
    return [self.players objectAtIndex:0];
}
@end
