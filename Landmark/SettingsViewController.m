//
//  SettingsViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/25/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SettingsViewController.h"


@implementation SettingsViewController

#pragma mark -
#pragma mark Implementation

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // TODO:: Should set the title here or nav controller?
        //self.title = NSLocalizedString(@"Settings", @"Settings");
        //self.tabBarItem.image = [UIImage imageNamed:@"setting"];
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
	// Do any additional setup after loading the view.
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
