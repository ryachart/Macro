//
//  EconomyTableViewCell.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "EconomyTableViewCell.h"
#import "Player.h"

@implementation EconomyTableViewCell
@synthesize player;
@synthesize mineralLabel;
@synthesize gasLabel;
@synthesize supplyLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"EconomyTableViewCell" owner:self options:nil];
    self = [nib objectAtIndex:0];
    if (self) {
        // Initialization code
        
    }
    return self;
}


-(void)update{
    self.mineralLabel.text = [NSString stringWithFormat:@"%i", self.player.minerals];
    self.gasLabel.text = [NSString stringWithFormat:@"%i", self.player.gas];
    self.supplyLabel.text = [NSString stringWithFormat:@"%i/%i", self.player.currentSupply, self.player.maximumSupply];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
