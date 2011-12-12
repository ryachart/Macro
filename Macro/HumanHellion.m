//
//  HumanHellion.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanHellion.h"

@implementation HumanHellion
-(id)init{
    if (self = [super init]){
        self.health = 90;
        self.maximumHealth = 90;
        self.buildTime = 30;
        self.techDependencies = nil;
        self.title = NSStringFromClass([self class]);
        self.mineralCost = 100;
        self.gasCost = 0;
        self.supplyCost = 2;
    }
    return self;
}
@end
