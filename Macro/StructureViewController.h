//
//  StructureViewController.h
//  Macro
//
//  Created by Ryan Hart on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameInstance;
@class Structure;

@interface StructureViewController : UITableViewController
@property (nonatomic, retain) GameInstance *gameInstance;
@property (nonatomic, retain) Structure *structure;

-(id)initWithGameInstance:(GameInstance*)instance andStructure:(Structure*)structure;

@end
