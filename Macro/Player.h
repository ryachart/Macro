//
//  Player.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Species.h"

@class Structure;
@class Unit;

#define BasicGame_InitialWorkers 6
#define BasicGame_InitialMinerals 50

@interface Player : NSObject

@property (readonly) SpeciesType species;
@property (nonatomic) NSInteger minerals;
@property (nonatomic) NSInteger gas;
@property (nonatomic, retain) NSMutableArray *structures;
@property (nonatomic, retain) NSMutableArray *units;

-(id)initWithSpecies:(SpeciesType)type;

-(void)addStructure:(Structure*)structure;
-(void)addUnit:(Unit*)unit;

-(void)initializeForBasicGame;

-(NSInteger)currentSupply;
-(NSInteger)maximumSupply;

-(void)update:(CFTimeInterval)interval;
@end
