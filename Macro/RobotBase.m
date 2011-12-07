//
//  RobotBase.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "RobotBase.h"

@implementation RobotBase
-(id)init{
    if (self = [super init]){
        self.maximumSupplyContribution = 10;
    }
    return self;
}
@end
