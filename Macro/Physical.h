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
@property (nonatomic, retain) Player* owner;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger maximumHealth;
@property (readwrite) BOOL isBuilding; //Defaults to YES
@property (nonatomic) NSInteger maximumSupplyContribution;

-(void)update:(CFTimeInterval)interval;
@end
