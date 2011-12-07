//
//  MACViewController.m
//  Macro
//
//  Created by Ryan Hart on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MACViewController.h"
#import <QuartzCore/QuartzCore.h>

#import "StructureViewController.h"

#import "GameInstance.h"
#import "Player.h"
#import "Structure.h"
#import "Physical.h"

@interface MACViewController ()
@property (nonatomic, retain) CADisplayLink *link;
@property (nonatomic) CFTimeInterval timeSinceLastUIUpdate;

-(void)update:(CADisplayLink*)sender;
-(void)display;
@end


@implementation MACViewController
@synthesize link;
@synthesize gameInstance;
@synthesize timeSinceLastUIUpdate;

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
     [self.tableView reloadData];
}
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Macro Game";
    self.timeSinceLastUIUpdate = 0.0;

	// Do any additional setup after loading the view, typically from a nib.
    Player *bugPlayer = [[Player alloc] initWithSpecies:Bugs];
    [bugPlayer initializeForBasicGame];
    Player *humanPlayer = [[Player alloc] initWithSpecies:Humans];
    [humanPlayer initializeForBasicGame];
    self.gameInstance = [[[GameInstance alloc] initWithMap:nil andPlayers:[NSArray arrayWithObjects: humanPlayer, bugPlayer, nil]] autorelease];
    
    
    
    self.link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update:)];
    [self.link setFrameInterval:1.0/60.0];
}


#pragma mark - Table View Delegate & Data Source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1){
        return 90.0f;
    }
    return 30.0f;
}
-(NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"Status";
        case 1:
            return @"Structures";

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
            return [[self.gameInstance.localPlayer structures] count];
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //Resources
    //Structures
    return 2;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //Cell Configuration
    if (indexPath.section == 0){
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
        Structure *currentStructure = [self.gameInstance.localPlayer.structures objectAtIndex:[indexPath row]];
        cell.textLabel.text = [currentStructure title];
        if (currentStructure.inProgressUnits.count > 0){
            CFTimeInterval elapsedTime = ((Physical*)[currentStructure.inProgressUnits objectAtIndex:0]).elapsedBuildingProgress;
            CFTimeInterval totalTime = ((Physical*)[currentStructure.inProgressUnits objectAtIndex:0]).buildTime;
            cell.textLabel.text = [NSString stringWithFormat:@"%@ Building: %1.1f/%1.1f", [currentStructure title], elapsedTime, totalTime];
        }
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        Structure *currentStructure = [self.gameInstance.localPlayer.structures objectAtIndex:[indexPath row]];
        StructureViewController *structureVC = [[StructureViewController alloc] initWithGameInstance:self.gameInstance andStructure:currentStructure];
        [self.navigationController pushViewController:structureVC animated:NO];
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
