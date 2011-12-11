//
//  MainGameViewController.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MainGameViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "StructureViewController.h"
#import "BuilderViewController.h"
#import "StructureTableViewCell.h"

#import "GameInstance.h"
#import "Player.h"
#import "Structure.h"
#import "Physical.h"

@interface MainGameViewController ()
@property (nonatomic, retain) CADisplayLink *link;
@property (nonatomic) CFTimeInterval timeSinceLastUIUpdate;

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
    for (UITableViewCell* cell in self.tableView.visibleCells){
        if ([cell respondsToSelector:@selector(update)]){
            [(StructureTableViewCell*)cell update];
        }
    }
    //Reload the status cells
    if (self.navigationController.topViewController == self){
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    }

}

-(void)switchContext:(UISegmentedControl*)contextSwitcher{
    
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
    
    
    self.gameContextSwitcher = [[[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Main", @"Units", @"Map", nil]] autorelease];
    self.gameContextSwitcher.segmentedControlStyle = UISegmentedControlStyleBezeled;
    self.gameContextSwitcher.selectedSegmentIndex = 0;
    self.gameContextSwitcher.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.gameContextSwitcher.frame = CGRectMake(0, 0, 200, 30);
    [self.gameContextSwitcher addTarget:self action:@selector(switchContext:) forControlEvents:UIControlEventValueChanged];
    
    self.navigationItem.titleView = self.gameContextSwitcher;
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showBuilderViewController)] autorelease];
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [self.link setFrameInterval:1.0/60.0];
}


#pragma mark - Table View Delegate & Data Source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 || indexPath.section == 2){
        return 90.0f;
    }
    return 30.0f;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Status";
        case 1:
            return @"Production Facilities";
        case 2:
            return @"Infrastructure";

    }
    return nil;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            //Minerals
            //Gas
            //Supply
            return 3;
        case 1:
            //Each structure builds something
            return [[self.gameInstance.localPlayer productionFacilities] count];
            break;
        case 2:
            return [[self.gameInstance.localPlayer infrastructure] count];
            break;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //Resources
    //Prod. Facs.
    //Infra.
    return 3;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdentifier = @"Cell";
    static NSString* cellIdentifier2 = @"Cell2";
    UITableViewCell *cell;

    
    //Cell Configuration
    if (indexPath.section == 0){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = [NSString stringWithFormat:@"Minerals: %i", self.gameInstance.localPlayer.minerals];
                break;
            case 1:
                cell.textLabel.text = [NSString stringWithFormat:@"Gas: %i", self.gameInstance.localPlayer.gas];
                break;
            case 2:
                cell.textLabel.text = [NSString stringWithFormat:@"Supply: %i/%i", self.gameInstance.localPlayer.currentSupply, self.gameInstance.localPlayer.maximumSupply];
                break;
            default:
                break;
        }
    }
    else if (indexPath.section == 1){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (!cell){
            cell = [[StructureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        Structure *currentStructure = [self.gameInstance.localPlayer.productionFacilities objectAtIndex:[indexPath row]];
        
        [(StructureTableViewCell*)cell setStructure:currentStructure];
    
        
    }else if (indexPath.section == 2){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (!cell){
            cell = [[StructureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        Structure *currentStructure = [self.gameInstance.localPlayer.infrastructure objectAtIndex:[indexPath row]];
        
        [(StructureTableViewCell*)cell setStructure:currentStructure];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        Structure *currentStructure = [self.gameInstance.localPlayer.structures objectAtIndex:[indexPath row]];
        if (currentStructure.isBuilder && !currentStructure.isBuilding){
            StructureViewController *structureVC = [[StructureViewController alloc] initWithGameInstance:self.gameInstance andStructure:currentStructure];
            [self.navigationController pushViewController:structureVC animated:YES];
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
