//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SlideMenuViewController.h"

#import "SlideView.h"
#import "HomeViewController.h"

@implementation SlideMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [NSString stringWithFormat:@"Section %d", section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item %d", indexPath.row];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeViewController *demoController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
    demoController.title = [NSString stringWithFormat:@"Demo Controller #%d-%d", indexPath.section, indexPath.row];
    
    NSArray *controllers = [NSArray arrayWithObject:demoController];
    [SlideViewManager sharedManager].navigationController.viewControllers = controllers;
    [SlideViewManager sharedManager].navigationController.viewState = SlideViewStateHidden;
}

@end
