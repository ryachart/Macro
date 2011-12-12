//
//  GameInstance.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NETWORK_FRAME_INTERVAL (10.0f/60.0f)
@class Map;
@class Player;
@interface GameInstance : NSObject

@property (nonatomic) CFTimeInterval gameDuration;
@property (nonatomic, retain) NSArray* players;
@property (nonatomic, retain) Map *map;
@property (nonatomic, readonly) Player *localPlayer;
@property (nonatomic, readwrite) BOOL isServer;

-(id)initWithMap:(Map*)newMap andPlayers:(NSArray*)newPlayers;
-(void)update:(CFTimeInterval)interval;
@end
