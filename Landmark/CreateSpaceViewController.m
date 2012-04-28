//
//  NewSpaceViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "CreateSpaceViewController.h"
#import "LocationViewController.h"

@implementation CreateSpaceViewController

@synthesize nameTextFiled;
@synthesize locationTextFiled;

@synthesize tableContents;
@synthesize sortedKeys;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Hidden the tab bar.
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"Add Landmark", @"");
    
    [self buildViewTable];
}

- (void)buildViewTable
{
    // Build data for table.
    NSArray *nameArrItem = [[NSArray alloc]initWithObjects:@"Name", nil];
    
    // Build data for table.
    NSArray *locationArrItem = [[NSArray alloc]initWithObjects:@"Location", @"Current", nil];
    
    NSDictionary *dictItems = [[NSDictionary alloc] initWithObjectsAndKeys:nameArrItem, @"", locationArrItem, @"", nil];
    self.tableContents = dictItems;
    self.sortedKeys =[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



#pragma mark -
#pragma mark Table Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.sortedKeys count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return [self.sortedKeys objectAtIndex:section];
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section 
{
	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:section]];
	return [listData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	
	if(cell == nil) 
    {	
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
	}
	
	NSUInteger row = [indexPath row];
	cell.textLabel.text = [listData objectAtIndex:row];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	//NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	//NSString *rowValue = [listData objectAtIndex:row];
	//NSString *message = [[NSString alloc] initWithFormat:rowValue];
	//[alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //NSLog([NSString stringWithFormat:@"%d", row]);
    switch (row) 
    {
        case 0:
        {
        }
    }
}


#pragma mark -
#pragma mark textbox keyboard hidden

-(IBAction)textFiledReturnEditing:(id)sender 
{
    [sender resignFirstResponder];
}

// When touch the backgroud to close keyboard.
- (IBAction)backgroundTap:(id)sender
{
    [nameTextFiled resignFirstResponder];
    [locationTextFiled resignFirstResponder];
}

- (IBAction)takePicture:(id)sender
{
    //Show a items let use upload pic from pic/take from camera.
}

// Open a float layer for map, then translate the location to current page.
-(IBAction)openMap:(id)sender
{
    LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationView_iPhone" bundle:nil];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:locationViewController];
    
    [self presentModalViewController:mapNavigationController animated:YES];
}

-(IBAction)xx:(id)sender
{
    LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationView_iPhone" bundle:nil];
    [self.navigationController pushViewController:locationViewController animated:TRUE];
}

- (IBAction)finishButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
