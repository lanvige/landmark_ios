//
//  SharingsViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/28/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SharingsViewController.h"

#import "LMCommon.h"
#import "LMSharing.h"
#import "SharingTableViewCell.h"
#import "SharingMappingProvider.h"

#import "CreateSpaceViewController.h"


@interface SharingsViewController ()

@property (nonatomic, strong) SharingMappingProvider *sharingMappingProvider;
- (void)reload:(id)sender;

@end

@implementation SharingsViewController {

@private
    NSArray *_sharings;
    __strong UIActivityIndicatorView *_activityIndicatorView;
}

@synthesize sharingMappingProvider;
@synthesize csViewController;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    
    if (self) 
    {
        self.title = @"Sharings";
        self.tabBarItem.image = [UIImage imageNamed:@"sharings"];
    }
    
    sharingMappingProvider = [[SharingMappingProvider alloc] init];
    
    return self;
}

- (void)reload:(id)sender {
    [self loadSharings];
}

- (void)addSharing:(id)sender {
    // TODO:: Open another to add the sharing info.
    
    self.csViewController = [[CreateSharingViewController alloc] initWithNibName:@"CreateSharingView" bundle:nil];
    [self.navigationController pushViewController:csViewController animated:TRUE];
}

- (void)loadSharings {
    [_activityIndicatorView startAnimating];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    [sharingMappingProvider getSharingsWithBlock:^(NSArray *sharings) {
        if (sharings) {
            _sharings = sharings;
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
    
    self.navigationItem.title = NSLocalizedString(@"Sharings", @"");
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    // self.title = NSLocalizedString(@"AFNetworking", nil);
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_activityIndicatorView];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSharing:)];
    
    self.tableView.rowHeight = 55.0f;
}

- (void)viewDidUnload {
    _activityIndicatorView = nil;
    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self loadSharings];
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
    return [_sharings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    SharingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[SharingTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.sharing = [_sharings objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    SharingTableViewCell *cell = (SharingTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    [_activityIndicatorView startAnimating];
    
    DLog(@"%@", cell.sharing.mID);
    [sharingMappingProvider getSharingWithID:[NSString stringWithFormat:@"%@", cell.sharing.mID] 
                                   block:^(LMSharing *sharing) {
        if (sharing) {
            DLog(@"Sharing Content - %@", sharing.title);
        }
        
        [_activityIndicatorView stopAnimating];
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }];
    
}




@end
