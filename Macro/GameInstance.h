//
//  GameInstance.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Map;
@class Player;
@interface GameInstance : NSObject

@property (nonatomic) CFTimeInterval gameDuration;
@property (nonatomic, retain) NSArray* players;
@property (nonatomic, retain) Map *map;
@property (nonatomic, readonly) Player *localPlayer;

-(id)initWithMap:(Map*)newMap andPlayers:(NSArray*)newPlayers;
-(void)update:(CFTimeInterval)interval;
@end
