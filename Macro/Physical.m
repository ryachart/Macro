//
//  Physical.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Physical.h"

@implementation Physical
@synthesize health;
@synthesize maximumHealth;
@synthesize isBuilding;
@synthesize maximumSupplyContribution;
@synthesize title;
@synthesize owner;
@synthesize techDependencies;
@synthesize buildTime;
@synthesize elapsedBuildingProgress;
@synthesize mineralCost;
@synthesize gasCost;
@synthesize armorValue;
-(id)init{
    if (self = [super init]){
        health = 0;
        maximumHealth = 0;
        buildTime = 0;
        elapsedBuildingProgress = 0;
        isBuilding = YES;
        maximumSupplyContribution = 0;
        techDependencies = nil;
        self.title = NSStringFromClass([self class]);
    }
    return self;
}

-(void)update:(CFTimeInterval)interval{
    if (self.isBuilding){
        elapsedBuildingProgress += interval;
    }
    
    if (self.elapsedBuildingProgress >= self.buildTime){
        self.elapsedBuildingProgress = 0.0;
        self.isBuilding = NO;
    }
    
}
@end
