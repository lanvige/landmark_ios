//
//  AboutViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/25/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "AboutViewController.h"


@implementation AboutViewController

@synthesize delegate = _delegate;

@synthesize tableContents;
@synthesize sortedKeys;

#pragma mark -
#pragma mark Implementation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
	self = [self initWithNibName:@"AboutView_iPhone" bundle:nil];	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    // Add a done button at left of navigation.
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"done", @"")
                                                                 style:UIBarButtonItemStyleBordered 
                                                                target:self action:@selector(doneActionPressed:)];
    self.navigationItem.leftBarButtonItem = itemDone;
    self.navigationItem.title = NSLocalizedString(@"about", @"");
    
    NSArray *arrTemp1 = [[NSArray alloc]initWithObjects:@"Andrew", @"Aubrey", @"Alice", nil];
    NSDictionary *temp = [[NSDictionary alloc] initWithObjectsAndKeys:arrTemp1, @"", nil];
    self.tableContents = temp;
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

// Show the about page.
- (void)doneActionPressed: (id)sender
{
    // Call the delegate to dismiss the modal view
    //[delegate didDismissModalView];
    //[self dismissModalViewControllerAnimated:TRUE];
    
    [self.navigationController dismissModalViewControllerAnimated:YES];
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
	
	NSArray *listData = [self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	
	if(cell == nil) 
    {
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
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You selected" 
                                                    message:message delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
	[alert show];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
