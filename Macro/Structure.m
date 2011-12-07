//
//  Structure.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Structure.h"
#import "Unit.h"
#import "Player.h"


@implementation Structure
@synthesize maximumSupplyContribution;
@synthesize isBuilder;
@synthesize isDefender;
@synthesize inProgressUnits;
@synthesize structureName;

-(id)init{
    if (self = [super init]){
        self.isBuilder = NO;
        self.isDefender = NO;
        self.inProgressUnits = [NSMutableArray arrayWithObjects:nil];

    }
    return self;
}

-(void)buildUnit:(Unit *)unit{
    if (self.inProgressUnits.count != 0){
        //Already Building, can't build
    }else{
        if (self.owner.minerals >= unit.mineralCost && self.owner.gas >= unit.gasCost && (self.owner.currentSupply + unit.supplyCost) <= self.owner.maximumSupply){
            self.owner.minerals -= unit.mineralCost;
            self.owner.gas -= unit.gasCost;
            [self.inProgressUnits addObject:unit];
        }
    }
}

-(void)update:(CFTimeInterval)interval{
    for (Unit *unit in self.inProgressUnits){
        if (![unit isBuilding]){
            [self.owner addUnit:unit];
            [self.inProgressUnits removeObject:unit];
        }
    }
    
    for (Unit *unit in self.inProgressUnits){
        [unit update:interval];
    }
}
@end
