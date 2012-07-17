//
//  ContractsViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/28/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "ContactsViewController.h"

#import "LMUser.h"


@implementation ContactsViewController



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

- (void)bindingContactData {}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidUnload {    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
