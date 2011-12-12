//
//  HumanBarracks.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "HumanBarracks.h"

@implementation HumanBarracks
-(id)init{
    if (self = [super init]){
        self.maximumSupplyContribution = 0;
        self.structureName = @"HumanBarracks";
        self.isBuilder = YES;
        self.mineralCost = 150;
        self.buildTime = 65;
    }
    return self;
}
@end
