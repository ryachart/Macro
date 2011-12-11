//
//  HumanBase.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanBase.h"

@implementation HumanBase
-(id)init{
    if (self = [super init]){
        self.maximumSupplyContribution = 10;
        self.structureName = @"HumanBase";
        self.isBuilder = YES;
        self.mineralCost = 400;
    }
    return self;
}

@end
