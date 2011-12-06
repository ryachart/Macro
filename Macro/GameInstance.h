//
//  GameInstance.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Map;

@interface GameInstance : NSObject

@property (nonatomic, retain) NSArray* players;
@property (nonatomic, retain) Map *map;

@end
