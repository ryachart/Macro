//
//  Location.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Location.h"

@implementation Location
@synthesize remainingGas;
@synthesize remainingMinerals;
@synthesize mapPoint;
@synthesize adjacentLocations;
@synthesize defensibility;
@synthesize locationType;
@synthesize mineralWorkerSaturation;
@synthesize gasWorkerSaturation;
@synthesize controller;

+(Location*)startPoint{
    Location *startPoint = [Location new];
    
    startPoint.remainingGas = 5000;
    startPoint.remainingMinerals = 12000;
    startPoint.locationType = LocationTypeStart;
    startPoint.defensibility = .9;
    startPoint.mineralWorkerSaturation = 24;
    startPoint.gasWorkerSaturation = 6;

    return [startPoint autorelease];
}

+(Location*)expansion{
    Location *startPoint = [Location new];
    
    startPoint.remainingGas = 5000;
    startPoint.remainingMinerals = 12000;
    startPoint.locationType = LocationTypeExpansion;
    startPoint.defensibility = .6;
    startPoint.mineralWorkerSaturation = 24;
    startPoint.gasWorkerSaturation = 6;
    
    return [startPoint autorelease];
}
+(Location*)goldExpansion{
    return nil;
}

@end
