//
//  Physical.h
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface Physical : NSObject
//Building
@property (readwrite) CFTimeInterval elapsedBuildingProgress;
@property (readwrite) CFTimeInterval buildTime;
@property (readwrite) BOOL isBuilding; //Defaults to YES
@property (readwrite) NSInteger mineralCost;
@property (readwrite) NSInteger gasCost;

//Belonging
@property (nonatomic, retain) Player* owner;

//Description
@property (nonatomic, retain) NSString *title;

//Health
@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger maximumHealth;

//Supply
@property (nonatomic) NSInteger maximumSupplyContribution;

//Tech
@property (nonatomic, retain) NSArray *techDependencies;


-(void)update:(CFTimeInterval)interval;
@end
