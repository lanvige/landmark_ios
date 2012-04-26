//
//  SettingsViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/25/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SettingsViewController.h"
#import "AboutViewController.h"

@implementation SettingsViewController

#pragma mark -
#pragma mark Synthesize

@synthesize aboutViewController;
@synthesize aboutNavigationController;
@synthesize aboutButton;

#pragma mark -
#pragma mark Implementation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Set the title and image for Tab bar.
        self.title = NSLocalizedString(@"Settings", @"Settings");
        self.tabBarItem.image = [UIImage imageNamed:@"setting"];
    }
    return self;
}

- (id)init
{
	self = [self initWithNibName:@"SettingsView_iPhone" bundle:nil];	
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Change the bar's style.
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"Settings", @"Settings");
    
    // Add a about button on the right of bar.
    self.aboutButton = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"About", @"About")
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(aboutAction:)];
    
    // What's the different between navigationBar.topItem with navigationItem.
    self.navigationItem.rightBarButtonItem = self.aboutButton;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark ButtonAction

// Show the about page.
- (void)aboutAction: (id)sender
{
    self.aboutViewController = [[AboutViewController alloc] init];
    //_aboutViewController.delegate = self;
    aboutNavigationController = [[UINavigationController alloc] initWithRootViewController:self.aboutViewController];
    
    [self presentModalViewController:aboutNavigationController animated:YES];
}

@end
