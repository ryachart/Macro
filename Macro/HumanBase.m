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
    }
    return self;
}

@end
