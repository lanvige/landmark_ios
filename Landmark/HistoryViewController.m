//
//  HistoryViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/28/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "HistoryViewController.h"

#import "LMUser.h"
#import "UserTableViewCell.h"
#import "UserMappingProvider.h"


@interface HistoryViewController ()
- (void)reload:(id)sender;
@end

@implementation HistoryViewController {

@private
    NSArray *_users;
    __strong UIActivityIndicatorView *_activityIndicatorView;
}

- (void)reload:(id)sender {
    [_activityIndicatorView startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [UserMappingProvider usersWithBlock:^(NSArray *users) {
        if (users) {
            _users = users;
            [self.tableView reloadData];
        }
        
        [_activityIndicatorView stopAnimating];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
}

#pragma mark - UIViewController

- (void)loadView {
    [super loadView];
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityIndicatorView.hidesWhenStopped = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"AFNetworking", nil);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activityIndicatorView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload:)];
    
    self.tableView.rowHeight = 70.0f;
}

- (void)viewDidUnload {
    _activityIndicatorView = nil;
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.user = [_users objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
