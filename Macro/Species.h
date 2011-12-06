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

typedef enum {
    Robots,
    Humans,
    Bugs
} SpeciesTypes;

@interface Species : NSObject

//All of the structures for a species
-(NSArray*)structuresForSpecies;

//All of the units for a species
-(NSArray*)unitsForSpecies;

//Tech Tree Management
-(BOOL)player:(Player*)player hasTechForPhysical:(Physical*)physical;

@end
