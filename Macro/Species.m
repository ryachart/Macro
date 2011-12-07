//
//  Species.m
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Species.h"

#import "BugWorker.h"
#import "HumanWorker.h"
#import "RobotWorker.h"
#import "BugBase.h"
#import "HumanBase.h"
#import "RobotBase.h"

@implementation Species


+(Worker*)workerForSpecies:(SpeciesType)type{
    Worker *workerToReturn = nil;
    switch (type) {
        case Bugs:
            workerToReturn = (Worker*)[[BugWorker alloc] init];
            break;
        case Humans:
            workerToReturn = (Worker*)[[HumanWorker alloc] init];
            break;
        case Robots:
            workerToReturn = (Worker*)[[RobotWorker alloc] init];
            break;
        default:
            break;
    }
    return [workerToReturn autorelease];
}

+(Structure*)baseForSpecies:(SpeciesType)type{
    Structure *structureToReturn = nil;
    switch (type) {
        case Bugs:
            structureToReturn = [[BugBase alloc] init];
            break;
        case Humans:
            structureToReturn = [[HumanBase alloc] init];
            break;
        case Robots:
            structureToReturn = [[RobotBase alloc] init];
            break;
        default:
            break;
    }
    return structureToReturn;
}
@end
