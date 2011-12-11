//
//  MainGameViewController.h
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UIUpdateFrameInterval  20.0f/60.0f
@class GameInstance;

@interface MainGameViewController : UITableViewController
@property (nonatomic, retain) GameInstance *gameInstance;
@property (nonatomic, retain) UISegmentedControl *gameContextSwitcher;
@end
