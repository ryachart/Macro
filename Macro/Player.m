//
//  Player.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "Unit.h"
#import "Structure.h"
#import "Worker.h"

@implementation Player

@synthesize minerals;
@synthesize gas;
@synthesize structures;
@synthesize units;
@synthesize species;
@synthesize inProgressStructures;

-(id)initWithSpecies:(SpeciesType)type{
    if (self = [super init]){
    
        species = type;
        self.structures = [NSMutableArray arrayWithObjects: nil];
        self.units = [NSMutableArray arrayWithObjects: nil];
        self.inProgressStructures = [NSMutableArray arrayWithObjects:nil];
        
    }
    return self;
}

-(NSInteger)numberOfWorkers{
    NSInteger workers = 0;
    for (Unit *unit in self.units){
        if (unit.unitType == UnitTypeWorker){
            workers++;
        }
    }
    return workers;
}

-(NSArray*)army{
    NSMutableArray *army = [NSMutableArray arrayWithCapacity:100];
    for (Unit *unit in self.units){
        if (unit.unitType == UnitTypeFighter || unit.unitType == UnitTypeScout  ){
            [army addObject:unit];
        }
    }
    return army;
}

-(BOOL)hasStructureWithTitle:(NSString*)title{
    return [self structuresWithTitle:title] > 0;
}

-(NSUInteger)structuresWithTitle:(NSString*)title{
    NSInteger number = 0;
    for (Structure *structure in self.structures){
        if ([structure.title isEqualToString:title] && !structure.isBuilding){
            number++;
        }
    }
    return number;
}

-(void)buildStructure:(Structure*)structure{
    if (self.minerals >= structure.mineralCost && self.gas >= structure.gasCost){
        self.minerals -= structure.mineralCost;
        self.gas -= structure.gasCost;
        structure.isBuilding = YES;
        [self addStructure:structure];
    }else{
        
    }
}

-(void)addStructure:(Structure*)structure{
    [structure setOwner:self];
    [self.structures addObject:structure];
}

-(void)addUnit:(Unit*)unit{
    BOOL isFinishedUnit = NO;
    for (Structure *structure in self.structures){
        if ([structure.inProgressUnits containsObject:unit]){
            isFinishedUnit = YES;
        }
    }
    
    if (([self currentSupply] + [unit supplyCost]) <= [self maximumSupply] || isFinishedUnit){
        [unit setOwner:self];
        [self.units addObject:unit];
    }else{
        //You can't build that unit.  Insufficient supply
    }
}

-(void)initializeForBasicGame{
    Structure *base = [Species baseForSpecies:self.species];
    [base setIsBuilding:NO];
    [self addStructure:base];
    
    for (int i = 0; i < BasicGame_InitialWorkers; i++){
        Worker *worker = [Species workerForSpecies:self.species];
        [worker setIsBuilding:NO];
        [worker setType:MineralWorker];
        [self addUnit:worker];
    }
    
    self.minerals = 50;
    self.gas = 0;
    
}

-(void)update:(CFTimeInterval)interval{
    for (Unit *unit in self.units){
        [unit update:interval];
    }
    for (Structure *structure in self.structures){
        [structure update:interval];
    }
}

-(NSArray*)productionFacilities{
    NSMutableArray *prodFacs = [NSMutableArray arrayWithCapacity:5];
    
    for (Structure *struc in self.structures){
        if (struc.isBuilder){
            [prodFacs addObject:struc];
        }
    }
    return prodFacs;
}

-(NSArray*)infrastructure{
    NSMutableArray *infra = [NSMutableArray arrayWithCapacity:5];
    
    for (Structure *struc in self.structures){
        if (!struc.isBuilder){
            [infra addObject:struc];
        }
    }
    return infra;
    
}

-(NSInteger)currentSupply{
    NSInteger currentSupply = 0;
    for (Unit* unit in self.units){
        currentSupply += unit.supplyCost;
    }
    
    for (Structure *structure in self.structures){
        for (Unit *inProgressUnit in structure.inProgressUnits){
            currentSupply += inProgressUnit.supplyCost;
        }
    }
    return currentSupply;
}

-(NSInteger)maximumSupply{
    NSInteger maxSupply = 0;
    for (Structure *structure in self.structures){
        if (!structure.isBuilding){
            maxSupply += structure.maximumSupplyContribution;
        }
    }
    
    for (Unit *unit in self.units){
        maxSupply += unit.maximumSupplyContribution;
    }
    return MIN(maxSupply, BasicGame_MaximumSupply);
}
@end
