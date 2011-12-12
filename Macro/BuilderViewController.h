//
//  BuilderViewController.h
//  Macro
//
//  Created by Ryan Hart on 12/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GameInstance;
@interface BuilderViewController : UITableViewController

@property (nonatomic, retain) GameInstance *gameInstance;
-(id)initWithGameInstance:(GameInstance*)instance;

@end
