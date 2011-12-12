//
//  MapViewController.h
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GameInstance;

@interface MapViewController : UIViewController <UIActionSheetDelegate>
@property (nonatomic, retain) GameInstance *gameInstance;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
-(id)initWithGameInstance:(GameInstance*)gameInstance;
-(void)locationSelected:(id)sender;
-(void)display;
@end
