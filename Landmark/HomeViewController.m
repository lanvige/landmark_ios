//
//  MainViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController

#pragma mark -
#pragma mark Synthesize

@synthesize tableContents;
@synthesize sortedKeys;

#pragma mark -
#pragma mark Implementation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"home", @"home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (id)init
{
	self = [self initWithNibName:@"HomeView_iPhone" bundle:nil];	
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
	
	if(cell == nil) {
		
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
	}
	
	NSUInteger row = [indexPath row];
	cell.textLabel.text = [listData objectAtIndex:row];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	NSString *rowValue = [listData objectAtIndex:row];
	
	NSString *message = [[NSString alloc] initWithFormat:rowValue];
	UIAlertView *alert = [[UIAlertView alloc] 
						  initWithTitle:@"You selected" 
						  message:message delegate:nil 
						  cancelButtonTitle:@"OK" 
						  otherButtonTitles:nil];
	[alert show];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
