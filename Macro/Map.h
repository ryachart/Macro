//
//  Map.h
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Location.h"

@interface Map : NSObject

@property (nonatomic, retain) NSArray *locations;
@property (nonatomic, retain) UIImage *mapImage;
@property (nonatomic, readwrite) CGSize mapSize;

@end
