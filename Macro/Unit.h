//
//  Unit.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Physical.h"

typedef enum {
    UnitTypeWorker,
    UnitTypeScout,
    UnitTypeFighter
} UnitType;

@interface Unit : Physical

@property (nonatomic, readwrite) UnitType unitType;

@property (nonatomic) NSInteger supplyCost;

@end
