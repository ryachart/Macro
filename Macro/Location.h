//
//  Location.h
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

typedef enum {
    LocationTypeStart,
    LocationTypeExpansion
} LocationType;

@interface Location : NSObject

@property (nonatomic, readwrite) LocationType locationType;
@property (nonatomic, readwrite) CGPoint mapPoint;
@property (nonatomic, retain) NSArray *adjacentLocations;
@property (nonatomic, readwrite) float defensibility;
@property (nonatomic, readwrite) NSInteger remainingMinerals;
@property (nonatomic, readwrite) NSInteger remainingGas;
@property (nonatomic, readwrite) NSInteger mineralWorkerSaturation;
@property (nonatomic, readwrite) NSInteger gasWorkerSaturation;
@property (nonatomic, retain) Player *controller;

+(Location*)startPoint;
+(Location*)expansion;
+(Location*)goldExpansion;

@end
