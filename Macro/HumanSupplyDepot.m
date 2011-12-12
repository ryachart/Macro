//
//  HumanSupplyDepot.m
//  Macro
//
//  Created by Ryan Hart on 12/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanSupplyDepot.h"

@implementation HumanSupplyDepot
-(id)init{
    if (self = [super init]){
        self.maximumSupplyContribution = 8;
        self.structureName = @"HumanSupplyDepot";
        self.isBuilder = NO;
        self.mineralCost = 100;
        self.buildTime = 30;
    }
    return self;
}

-(void)update:(CFTimeInterval)interval{
    [super update:interval];
}
@end
