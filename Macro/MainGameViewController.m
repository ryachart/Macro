//
//  MainGameViewController.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainGameViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "BaseViewController.h"
#import "UnitsViewController.h"
#import "MapViewController.h"
#import "BuilderViewController.h"

#import "GameInstance.h"
#import "Player.h"

#import "Basic1v1Map.h"


@interface MainGameViewController ()
@property (nonatomic, retain) CADisplayLink *link;
@property (nonatomic) CFTimeInterval timeSinceLastUIUpdate;
@property (nonatomic, retain) UISegmentedControl *gameContextSwitcher;
@property (nonatomic, retain) UnitsViewController *unitsVC;
@property (nonatomic, retain) MapViewController *mapVC;
@property (nonatomic, retain) BaseViewController *baseVC;
-(void)update:(CADisplayLink*)sender;
-(void)display;
-(void)switchContext:(UISegmentedControl*)contextSwitcher;
-(void)showBuilderViewController;
@end


@implementation MainGameViewController
@synthesize link;
@synthesize gameInstance;
@synthesize timeSinceLastUIUpdate;
@synthesize gameContextSwitcher;
@synthesize baseVC;
@synthesize unitsVC;
@synthesize mapVC;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



#pragma mark - Run Loop

-(void)update:(CADisplayLink*)sender{
    CFTimeInterval interval = [sender duration];
    
    [self.gameInstance update:interval];
    
    self.timeSinceLastUIUpdate += interval;
    if (self.timeSinceLastUIUpdate >= UIUpdateFrameInterval){
        [self display];
    }
}

-(void)display{
    //Reload the status cells
    [self.baseVC display];

}

-(void)switchContext:(UISegmentedControl*)contextSwitcher{
    [self.baseVC.view removeFromSuperview];
    [self.baseVC removeFromParentViewController];
    [self.unitsVC.view removeFromSuperview];
    [self.unitsVC removeFromParentViewController];
    [self.mapVC.view removeFromSuperview];
    [self.mapVC removeFromParentViewController];
    
    switch (contextSwitcher.selectedSegmentIndex) {
        case 0:
            [self addChildViewController:self.baseVC];
            [self.view addSubview:self.baseVC.view];
            break;
        case 1:
            [self addChildViewController:self.unitsVC];
            [self.view addSubview:self.unitsVC.view];
            break;
        case 2:
            [self addChildViewController:self.mapVC];
            [self.view addSubview:self.mapVC.view];
            break;
        default:
            break;
    }
}

-(void)showBuilderViewController{
    BuilderViewController *builderVC = [[BuilderViewController alloc] initWithGameInstance:self.gameInstance];
    [self.navigationController pushViewController:builderVC animated:YES];
    [builderVC release];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.timeSinceLastUIUpdate = 0.0;

	// Do any additional setup after loading the view, typically from a nib.
    Player *bugPlayer = [[Player alloc] initWithSpecies:Bugs];
    [bugPlayer initializeForBasicGame];
    Player *humanPlayer = [[Player alloc] initWithSpecies:Humans];
    [humanPlayer initializeForBasicGame];
    self.gameInstance = [[[GameInstance alloc] initWithMap:nil andPlayers:[NSArray arrayWithObjects: humanPlayer, bugPlayer, nil]] autorelease];
    
    self.gameInstance.map = [[[Basic1v1Map alloc] init] autorelease];
    
    [[self.gameInstance.map.locations objectAtIndex:0] setController:humanPlayer];
    [[self.gameInstance.map.locations objectAtIndex:1] setController:bugPlayer];
    
    self.view.contentMode = UIViewContentModeScaleToFill;
    self.gameContextSwitcher = [[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Main", @"Units", @"Map", nil]] autorelease];
    self.gameContextSwitcher.segmentedControlStyle = UISegmentedControlStyleBezeled;
    self.gameContextSwitcher.selectedSegmentIndex = 0;
    self.gameContextSwitcher.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.gameContextSwitcher.frame = CGRectMake(0, 0, 200, 30);
    [self.gameContextSwitcher addTarget:self action:@selector(switchContext:) forControlEvents:UIControlEventValueChanged];
    
    self.baseVC = [[[BaseViewController alloc] initWithGameInstance:self.gameInstance] autorelease];
    self.baseVC.view.frame   = CGRectMake(0, 0, 320, 460);
    self.baseVC.navigationController = self.navigationController;
    [self.view addSubview:self.baseVC.view];
    
    self.unitsVC = [[[UnitsViewController alloc] initWithGameInstance:self.gameInstance] autorelease];
    self.unitsVC.view.frame = CGRectMake(0, 0, 320, 460);
    
    self.mapVC = [[[MapViewController alloc] initWithGameInstance:self.gameInstance] autorelease];
    
    
    self.navigationItem.titleView = self.gameContextSwitcher;
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showBuilderViewController)] autorelease];
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [self.link setFrameInterval:1.0/60.0];
    
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];

}




- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [self.link invalidate];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

@end
