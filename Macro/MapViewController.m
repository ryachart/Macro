//
//  MapViewController.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "Map.h"
#import "GameInstance.h"
#import "Location.h"
#import "Player.h"
#import "Species.h"
#import "Structure.h"

@implementation MapViewController
@synthesize gameInstance;
@synthesize scrollView;

-(id)initWithGameInstance:(GameInstance*)instance
{
    self = [super initWithNibName:@"MapViewController"  bundle:nil];
    if (self) {
        // Custom initialization
        self.gameInstance = instance;
        NSLog(@"%@", self);
        NSLog(@"%@", [self.view subviews]);
    }
    return self;
}

-(void)display{
    
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(void)locationSelected:(UIButton*)sender{
    //Location *selectedLocation = [self.gameInstance.map.locations objectAtIndex:[sender tag]];
    
    UIActionSheet *locationMenu = [[UIActionSheet alloc] initWithTitle:@"Location Menu" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Attack Here" otherButtonTitles:@"Expand Here", nil];
    locationMenu.tag = sender.tag;
    [locationMenu showInView:self.view];
    [locationMenu release];
}


-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    Location *selectedLocation = [self.gameInstance.map.locations objectAtIndex:[actionSheet tag]];
    NSLog(@"Selected %i", buttonIndex);
    switch (buttonIndex) {
        case 0: //Attack here
            break;
        case 1: //Expand here
            if (!selectedLocation.controller){
                [selectedLocation setController:self.gameInstance.localPlayer];
                [self.gameInstance.localPlayer buildStructure:[Species baseForSpecies:self.gameInstance.localPlayer.species]];
            }
            break;
        case 2:
            break;
        default:
            break;
    }
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.scrollView.contentSize = self.gameInstance.map.mapSize;
    self.scrollView.backgroundColor = [UIColor blackColor];
    int i = 0;
    for (Location *loc in self.gameInstance.map.locations){
        UIButton *locationButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [locationButton addTarget:self action:@selector(locationSelected:) forControlEvents:UIControlEventTouchUpInside];
        locationButton.center = loc.mapPoint;
        
        if (loc.controller == self.gameInstance.localPlayer){
            locationButton.backgroundColor = [UIColor greenColor];
        }else if (loc.controller == nil){
            locationButton.backgroundColor = [UIColor blueColor];
        }else{
            locationButton.backgroundColor = [UIColor redColor];
        }
        [self.scrollView addSubview:locationButton];
        locationButton.tag = i;
        
        i++;
    }

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
