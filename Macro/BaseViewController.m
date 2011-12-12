//
//  BaseViewController.m
//  Macro
//
//  Created by Ryan Hart on 12/11/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "BaseViewController.h"

#import "StructureViewController.h"
#import "BuilderViewController.h"
#import "StructureTableViewCell.h"
#import "EconomyTableViewCell.h"

#import "GameInstance.h"
#import "Player.h"
#import "Structure.h"
#import "Physical.h"

@implementation BaseViewController
@synthesize gameInstance;
@synthesize navigationController;
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(id)initWithGameInstance:(GameInstance *)newInstance{
    if (self = [super initWithNibName:@"BaseViewController" bundle:nil]){
        self.gameInstance = newInstance;
    }
    return self;
}


#pragma mark - Gameloop

-(void)display{
    for (UITableViewCell* cell in self.tableView.visibleCells){
        if ([cell respondsToSelector:@selector(update)]){
            [(StructureTableViewCell*)cell update];
        }
    }
}

#pragma mark - Table View Delegate & Data Source

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1 || indexPath.section == 2){
        return 60.0f;
    }
    return 90.0f;
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
            
            return 1;
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
    static NSString* cellIdentifier = @"Economy";
    static NSString* cellIdentifier2 = @"Structure";
    UITableViewCell *cell = nil;;
    
    
    //Cell Configuration
    if (indexPath.section == 0){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell){
            cell = [[EconomyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
            [(EconomyTableViewCell*)cell setPlayer:self.gameInstance.localPlayer];
        }
    }
    else if (indexPath.section == 1){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (!cell){
            cell = [[StructureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        Structure *currentStructure = [self.gameInstance.localPlayer.productionFacilities objectAtIndex:[indexPath row]];
        
        [(StructureTableViewCell*)cell setStructure:currentStructure];
        
        
    }else if (indexPath.section == 2){
        cell  = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier2];
        if (!cell){
            cell = [[StructureTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier2];
        }
        Structure *currentStructure = [self.gameInstance.localPlayer.infrastructure objectAtIndex:[indexPath row]];
        
        [(StructureTableViewCell*)cell setStructure:currentStructure];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        Structure *currentStructure = [self.gameInstance.localPlayer.productionFacilities objectAtIndex:[indexPath row]];
        if (currentStructure.isBuilder && !currentStructure.isBuilding){
            StructureViewController *structureVC = [[StructureViewController alloc] initWithGameInstance:self.gameInstance andStructure:currentStructure];
            [self.navigationController pushViewController:structureVC animated:YES];
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
