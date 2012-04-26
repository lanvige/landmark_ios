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
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStyleBordered 
                                                                target:self action:@selector(doneActionPressed:)];
    self.navigationItem.leftBarButtonItem = itemDone;
    self.navigationItem.title = @"About";
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

@end
