//
//  ContractsViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/28/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "ContactsViewController.h"

#import "RestKit/RKTableController.h"
#import <RestKit/RestKit.h>
#import <RestKit/UI.h>

#import "LMUser.h"

@interface ContactsViewController()

// Used for...
@property (nonatomic, strong) RKFetchedResultsTableController *tableController;

@end



@implementation ContactsViewController

@synthesize tableController;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.title = NSLocalizedString(@"contacts", @"");
        self.tabBarItem.image = [UIImage imageNamed:@"contacts"];
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavagation];
    [self bindingContactData];
}

- (void)setupNavagation {
    // Change the bar's style.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"contacts", @"");
}

- (void)bindingContactData {
//    /**
//     Configure the RestKit table controller to drive our view
//     */
//    self.tableController = [[RKObjectManager sharedManager] fetchedResultsTableControllerForTableViewController:self];
//    self.tableController.autoRefreshFromNetwork = YES;
//    self.tableController.pullToRefreshEnabled = YES;
//    self.tableController.resourcePath = @"/v1/users";
//    self.tableController.variableHeightRows = YES;
//    //    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"createdAt" ascending:NO];
//    //    self.tableController.sortDescriptors = [NSArray arrayWithObject:descriptor];
//    
//    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
//    cellMapping.cellClassName = @"LMUserCell";
//    cellMapping.reuseIdentifier = @"LMUser";
//    cellMapping.rowHeight = 100.0;
//    [cellMapping mapKeyPath:@"name" toAttribute:@"nameLabel.text"];
//    [cellMapping mapKeyPath:@"email" toAttribute:@"mailLabel.text"];
//    
//    [tableController mapObjectsWithClass:[LMUser class] toTableCellsWithMapping:cellMapping];
//    
//    /**
//     Use a custom Nib to draw our table cells for RKGHIssue objects
//     */
//    [self.tableView registerNib:[UINib nibWithNibName:@"LMUserCell" bundle:nil] forCellReuseIdentifier:@"LMUser"];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
