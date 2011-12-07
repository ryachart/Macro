//
//  Species.h
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;
@class Physical;
@class Worker;
@class Structure;

typedef enum {
    Robots,
    Humans,
    Bugs
} SpeciesType;

@interface Species : NSObject

//All of the structures for a species
+(NSArray*)structuresForSpecies;

//All of the units for a species
+(NSArray*)unitsForSpecies;

//Tech Tree Management
+(NSArray*)availableStructuresForPlayer:(Player*)player;
+(NSArray*)availableUnitsForPlayer:(Player*)player fromStructure:(Structure*)structure;

+(Worker*)workerForSpecies:(SpeciesType)type;
+(Structure*)baseForSpecies:(SpeciesType)type;

@end
