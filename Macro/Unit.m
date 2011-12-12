//
//  Unit.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Unit.h"

@implementation Unit
@synthesize supplyCost;
@synthesize unitType;

-(id)init{
    if (self = [super init]){
        self.supplyCost = 0;
        self.unitType = UnitTypeFighter;
    }
    return self;
}


@end
