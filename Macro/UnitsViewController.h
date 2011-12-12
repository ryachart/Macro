//
//  UnitsViewController.h
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameInstance;

@interface UnitsViewController : UITableViewController
@property (nonatomic, retain) GameInstance* gameInstance;

-(id)initWithGameInstance:(GameInstance*)instance;


-(void)display;
@end
