//
//  Worker.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Worker.h"
#import "Player.h"

@interface Worker ()
@property CFTimeInterval timeSinceLastGain;
@end

@implementation Worker
@synthesize type;
@synthesize gainFrequency;
@synthesize gainsPerReturn;
@synthesize timeSinceLastGain;

-(id)init{
    if (self = [super init]){
        self.gainFrequency = 6;
        self.gainsPerReturn = 5;
        self.timeSinceLastGain = 0;
        self.supplyCost = 1;
    }
    return self;
}

-(void)update:(CFTimeInterval)interval{
    
    self.timeSinceLastGain += interval;
    
    if (self.timeSinceLastGain >= self.gainFrequency){
        self.timeSinceLastGain = 0.0;
        switch (self.type) {
            case MineralWorker:
                self.owner.minerals += gainsPerReturn;
                break;
            case GasWorker:
                self.owner.gas += gainsPerReturn;
            default:
                break;
        }
    }
}
@end
