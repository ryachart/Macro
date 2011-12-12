//
//  HumanMarine.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanMarine.h"

@implementation HumanMarine

-(id)init{
    if (self = [super init]){
        self.health = 45;
        self.maximumHealth = 45;
        self.buildTime = 25;
        self.techDependencies = nil;
        self.title = NSStringFromClass([self class]);
        self.mineralCost = 50;
        self.gasCost = 0;
        self.supplyCost = 1;
    }
    return self;
}

@end
