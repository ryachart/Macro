//
//  Player.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) NSInteger minerals;
@property (nonatomic) NSInteger gas;
@property (nonatomic, retain) NSArray *structures;
@property (nonatomic, retain) NSArray *units;

@end
