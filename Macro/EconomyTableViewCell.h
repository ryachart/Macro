//
//  EconomyTableViewCell.h
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Player;

@interface EconomyTableViewCell : UITableViewCell
@property (nonatomic, retain) Player *player;
@property (nonatomic, retain) IBOutlet UILabel *mineralLabel;
@property (nonatomic, retain) IBOutlet UILabel *gasLabel;
@property (nonatomic, retain) IBOutlet UILabel *supplyLabel;

-(void)update;
@end
