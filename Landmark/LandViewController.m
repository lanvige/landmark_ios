//
//  NewViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LandViewController.h"


@implementation LandViewController

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
	self = [self initWithNibName:@"LandView_iPhone" bundle:nil];	
	return self;
}

- (void)viewDidLoad
{
    // Change the bar in first page.
    self.navigationController.navigationBar.hidden = FALSE;
    
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
