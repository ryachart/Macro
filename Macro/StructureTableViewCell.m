//
//  StructureTableViewCell.m
//  Macro
//
//  Created by Ryan Hart on 12/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "StructureTableViewCell.h"
#import "Structure.h"
#import "Physical.h"
#import "AssetManager.h"

@implementation StructureTableViewCell
@synthesize structure;
@synthesize buildingUnitImageView;
@synthesize buildingUnitProgressView;
@synthesize structureIconImageView;
@synthesize infoLabel;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"StructureTableViewCell" owner:self options:nil];
    self = [nib objectAtIndex:0];
    if (self) {
        // Initialization code
        
        
        
    }
    return self;
}
-(void)setStructure:(Structure*)newStructure{
    [structure release];
    structure = [newStructure retain];
    
    self.structureIconImageView.image = [AssetManager imageForTitle:structure.title];
}


-(void)update{
    if (self.structure && !self.structure.isBuilding){
        if (!self.structureIconImageView){
            self.structureIconImageView.image = [AssetManager imageForTitle:structure.title];
        }
        if (self.structure.inProgressUnits.count > 0){
            self.infoLabel.text = @"Building:";
            Physical *inProgressUnit = [structure.inProgressUnits objectAtIndex:0];
            self.buildingUnitProgressView.hidden = NO;
            self.buildingUnitImageView.hidden = NO;
            self.buildingUnitImageView.image = [AssetManager imageForTitle:[inProgressUnit title]];
            self.buildingUnitProgressView.progress = inProgressUnit.elapsedBuildingProgress / inProgressUnit.buildTime;
        }else{
            self.buildingUnitImageView.hidden = YES;
            self.buildingUnitImageView.image = nil;
            self.buildingUnitProgressView.progress = 0.0;
            self.buildingUnitProgressView.hidden = YES;
            self.infoLabel.text = @"Idle";
        }
    }else if (self.structure && self.structure.isBuilding){
        self.buildingUnitProgressView.hidden = NO;
        self.structureIconImageView.alpha = .5;
        self.infoLabel.text = @"Under Constr.";
        self.buildingUnitProgressView.progress = self.structure.elapsedBuildingProgress / self.structure.buildTime;
    
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
