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
    if (isBuilding){
        elapsedBuildingProgress += interval;
    }
    
    if (elapsedBuildingProgress >= buildTime){
        elapsedBuildingProgress = 0.0;
        isBuilding = NO;
    }
    
}
@end
