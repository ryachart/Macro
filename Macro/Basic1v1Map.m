//
//  Basic1v1Map.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Basic1v1Map.h"

@implementation Basic1v1Map
-(id)init{
    if (self = [super init]){
        self.mapSize = CGSizeMake(1000, 400);
        
        Location *startPointA = [Location startPoint];
        startPointA.mapPoint = CGPointMake(self.mapSize.width * .1 , self.mapSize.height * .5);
        
        Location *startPointB = [Location startPoint];
        startPointB.mapPoint = CGPointMake(self.mapSize.width * .9, self.mapSize.height * .5);
        
        //Make the expansions
        Location *naturalA = [Location expansion];
        naturalA.mapPoint = CGPointMake(self.mapSize.width * .2, self.mapSize.height * .3);
        
        Location *naturalB = [Location expansion];
        naturalB.mapPoint = CGPointMake(self.mapSize.width * .8, self.mapSize.height * .3);
        
        
        
        
        
        self.locations = [NSArray arrayWithObjects:startPointA, startPointB, naturalA, naturalB, nil];
    }
    return self;
}

@end
