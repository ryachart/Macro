//
//  Worker.h
//  Macro
//
//  Created by Ryan Hart on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Unit.h"

typedef enum {
    GasWorker,
    MineralWorker
} WorkerType;

@interface Worker : Unit
@property (nonatomic) WorkerType type;
@property (nonatomic) NSInteger gainsPerMinute;
@end
