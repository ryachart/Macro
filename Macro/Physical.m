//
//  Physical.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Physical.h"

@implementation Physical
@synthesize health;
@synthesize maximumHealth;
@synthesize isBuilding;
@synthesize maximumSupplyContribution;
@synthesize title;
@synthesize owner;

-(id)init{
    if (self = [super init]){
        health = 0;
        maximumHealth = 0;
        isBuilding = YES;
        maximumSupplyContribution = 0;
    }
    return self;
}

-(NSString*)title{
    return NSStringFromClass([self class]);
}

-(void)update:(CFTimeInterval)interval{
    
}
@end
