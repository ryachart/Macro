//
//  AssetManager.m
//  Macro
//
//  Created by Ryan Hart on 12/8/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AssetManager.h"



@implementation AssetManager

+(UIImage*)imageForTitle:(NSString*)title{
    UIImage *image = nil;
    
    NSDictionary  *dictionaryOfAssets = [NSDictionary dictionaryWithObjects:
                                                [NSArray arrayWithObjects:
                                                 [UIImage imageNamed:@"human_worker"],
                                                 [UIImage imageNamed:@"human_worker"],
                                                 [UIImage imageNamed:@"human_base"],
                                                 [UIImage imageNamed:@"human_barracks"],
                                                 [UIImage imageNamed:@"human_marine"],
                                                 [UIImage imageNamed:@"human_marauder"],
                                                 [UIImage imageNamed:@"human_hellion"],
                                                 nil]
                                                                           forKeys:
                                                [NSArray arrayWithObjects:
                                                 @"Mineral SCV", 
                                                 @"Gas SCV",
                                                 @"HumanBase", 
                                                 @"HumanBarracks",
                                                 @"HumanMarine",
                                                 @"HumanMarauder", 
                                                 @"HumanHellion",
                                                 nil]];
    
    
    image = [dictionaryOfAssets objectForKey:title];
    
    if (!image){
        image = [UIImage imageNamed:@"SC2_icon"];
    }
    
    return image;
}

@end
