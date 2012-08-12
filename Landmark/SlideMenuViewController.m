//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SlideMenuViewController.h"

#import "SlideView.h"
#import "HomeViewController.h"
#import "SharingsViewController.h"
#import "ContactsViewController.h"
#import "SettingsViewController.h"

@implementation SlideMenuViewController

@synthesize tableContents;
@synthesize sortedKeys;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Build data for table.
    NSArray *arrItems = [[NSArray alloc]initWithObjects:@"Home", @"Sharings", @"Contacts", @"Settings", nil];
    NSDictionary *dictItems = [[NSDictionary alloc] initWithObjectsAndKeys:arrItems, @"", nil];
    self.tableContents = dictItems;
    self.sortedKeys = [[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    self.tableView.rowHeight = 70.0f;
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %d", section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Hidden the section header.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:section]];
	return [listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    NSArray *listData = [self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSUInteger row = [indexPath row];
	cell.textLabel.text = [listData objectAtIndex:row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	//NSString *rowValue = [listData objectAtIndex:row];
	//NSString *message = [[NSString alloc] initWithFormat:rowValue];
	//[alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //NSLog([NSString stringWithFormat:@"%d", row]);
    switch (row) {
        case 0: {
            HomeViewController *homeController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
            NSArray *controllers = [NSArray arrayWithObject:homeController];
            [SlideViewManager sharedManager].navigationController.viewControllers = controllers;
            [SlideViewManager sharedManager].navigationController.viewState = SlideViewStateHidden;
            break;
        }
        case 1: {
            // How to fix init with sytle invoke?
            SharingsViewController *sharingsViewController = [[SharingsViewController alloc] initWithStyle:nil];
            NSArray *controllers = [NSArray arrayWithObject:sharingsViewController];
            [SlideViewManager sharedManager].navigationController.viewControllers = controllers;
            [SlideViewManager sharedManager].navigationController.viewState = SlideViewStateHidden;
            break;
        }
        case 2: {
            ContactsViewController *contactsViewController = [[ContactsViewController alloc] initWithStyle:nil];
            NSArray *controllers = [NSArray arrayWithObject:contactsViewController];
            [SlideViewManager sharedManager].navigationController.viewControllers = controllers;
            [SlideViewManager sharedManager].navigationController.viewState = SlideViewStateHidden;
            break;
        }
        case 3:
        {
            SettingsViewController *settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsView_iPhone" bundle:nil];
            NSArray *controllers = [NSArray arrayWithObject:settingsViewController];
            [SlideViewManager sharedManager].navigationController.viewControllers = controllers;
            [SlideViewManager sharedManager].navigationController.viewState = SlideViewStateHidden;
            break;
        }
    }
}

@end
