//
//  Structure.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Structure.h"

@implementation Structure
@synthesize maximumSupplyContribution;
@synthesize isBuilder;
@synthesize isDefender;

-(id)init{
    if (self = [super init]){
        self.isBuilder = NO;
        self.isDefender = NO;
    }
    return self;
}
@end
