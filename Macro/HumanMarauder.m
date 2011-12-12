//
//  HumanMarauder.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanMarauder.h"

@implementation HumanMarauder
-(id)init{
    if (self = [super init]){
        self.health = 125;
        self.maximumHealth = 125;
        self.buildTime = 30;
        self.techDependencies = nil;
        self.title = NSStringFromClass([self class]);
        self.mineralCost = 100;
        self.gasCost = 25;
        self.supplyCost = 2;
        self.armorValue = 1;
    }
    return self;
}
@end
