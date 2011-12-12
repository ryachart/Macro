//
//  HumanFactory.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanFactory.h"

@implementation HumanFactory
-(id)init{
    if (self = [super init]){
        self.maximumSupplyContribution = 0;
        self.structureName = @"HumanFactory";
        self.isBuilder = YES;
        self.mineralCost = 150;
        self.gasCost = 100;
        self.buildTime = 60;
    }
    return self;
}
@end
