//
//  Structure.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Physical.h"

@class Unit;

@interface Structure : Physical

@property (nonatomic, retain) NSString* structureName;
@property (nonatomic, retain) NSMutableArray *inProgressUnits;
@property (nonatomic) BOOL isBuilder;
@property (nonatomic) BOOL isDefender;

-(void)buildUnit:(Unit*)unit;

@end
