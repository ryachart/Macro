//
//  StructureTableViewCell.h
//  Macro
//
//  Created by Ryan Hart on 12/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Structure;


@interface StructureTableViewCell : UITableViewCell

@property (nonatomic, retain) Structure *structure;
@property (nonatomic, retain) IBOutlet UIImageView *structureIconImageView;
@property (nonatomic, retain) IBOutlet UIImageView *buildingUnitImageView;
@property (nonatomic, retain) IBOutlet UIProgressView *buildingUnitProgressView;
@property (nonatomic, retain) IBOutlet UILabel *infoLabel;
@property (nonatomic, retain) IBOutlet UILabel *structureNameLabel;

-(void)update;
@end
