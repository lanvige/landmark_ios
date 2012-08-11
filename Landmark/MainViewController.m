//
//  MainViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/21/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "MainViewController.h"

#import "SlideView.h"
#import "CreateSharingViewController.h"

@implementation MainViewController

@synthesize shareButton;
@synthesize csViewController;

#pragma mark - Custom event

- (void)addShare:(id)sender {
    // Open share view.
    csViewController = [[CreateSharingViewController alloc] initWithNibName:@"CreateSharingView" bundle:nil];
    [self.navigationController pushViewController:csViewController animated:TRUE];
}

#pragma mark - View lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"Lamdmark", @"home");
        self.tabBarItem.image = [UIImage imageNamed:@"home"];
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Add a about button on the right of bar.
    shareButton = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"Share", @"")
                                                       style:UIBarButtonItemStyleBordered
                                                      target:self
                                                      action:@selector(addShare:)];
    
    // What's the different between navigationBar.topItem with navigationItem.
    self.navigationItem.rightBarButtonItem = shareButton;
    
    [self setupSlideViewBarButtonItem];
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

@end
