//
//  MainViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "HomeViewController.h"

#import "CreateSpaceViewController.h"
#import "LocationViewController.h"

@implementation HomeViewController

#pragma mark -
#pragma mark Synthesize

@synthesize codeTextFiled;
@synthesize tableContents;
@synthesize sortedKeys;

#pragma mark -
#pragma mark Implementation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"home", @"home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    // Build data for table.
    NSArray *arrItems = [[NSArray alloc]initWithObjects:@"Create a new Location", @"Tell your frends", @"Look arounds here", nil];
    NSDictionary *dictItems = [[NSDictionary alloc] initWithObjectsAndKeys:arrItems, @"", nil];
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
#pragma mark hide Navigation Bar only on first page
#pragma http://stackoverflow.com/questions/845583/iphone-hide-navigation-bar-only-on-first-page

- (void) viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
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
            CreateSpaceViewController *createSpaceViewController = [[CreateSpaceViewController alloc] initWithNibName:@"CreateSpaceView_iPhone" bundle:nil];
            [self.navigationController pushViewController:createSpaceViewController animated:TRUE];
            break;
        }
        case 1:
        {
            LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationView_iPhone" bundle:nil];
            [self.navigationController pushViewController:locationViewController animated:TRUE];
            break;
        }
        case 2:
            //self.createSpaceViewController = [[CreateSpaceViewController alloc] initWithNibName:@"CreateSpaceView_iPhone" bundle:nil];
            //[self.navigationController pushViewController:self.createSpaceViewController animated:false];
            break;
    }
}



#pragma mark -
#pragma mark textbox keyboard hidden

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [textField resignFirstResponder];
    textField.text = @"";
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [codeTextFiled resignFirstResponder];
}

@end
