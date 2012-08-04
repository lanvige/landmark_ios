//
//  LeftViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/21/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
                green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
                 blue:((float)(rgbValue & 0xFF))/255.0 \
                alpha:1.0]

#import "LeftViewController.h"

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SlideViewController.h"
#import "HomeViewController.h"

@implementation LeftViewController

@synthesize mainViewController = _mainViewController;


#pragma mark - View lifecycle

- (id)init {
    self = [super init];
    if (self) {
        // Custom initialization
 
//        UIImage *buttonImageGrey  = [[UIImage imageNamed:@"btn_grey.png"]  resizableImageWithCapInsets:UIEdgeInsetsMake(10, 36, 10, 36)];
//        float rightAlignPoint = 544.0f;
        
        UIButton *triggerLogin = [UIButton buttonWithType:UIButtonTypeCustom];
        [triggerLogin setAccessibilityIdentifier:@"login button"];
//        [triggerLogin setBackgroundImage:buttonImageGrey forState:UIControlStateNormal];
//        [triggerLogin setBackgroundImage:buttonImageGrey forState:UIControlStateSelected];
//        [triggerLogin setBackgroundImage:buttonImageGrey forState:UIControlStateHighlighted];
        triggerLogin.frame = CGRectMake(10, 60, 100, 44);
        [triggerLogin setTitle:@"Test" forState:UIControlStateNormal];
        [triggerLogin setTitleColor:UIColorFromRGB(0xFFFFFF) forState:UIControlStateNormal];
        [triggerLogin addTarget:self action:@selector(navigateToMainViewController) forControlEvents:UIControlEventTouchUpInside];
        
        // add to a view
        [self.view addSubview:triggerLogin];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.mainViewController = nil;
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

- (IBAction)navigateToMainViewController:(id)sender
{
    // Use the application delegate to interact with the Slide View Controller
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    SlideViewController * slideViewController = appDelegate.slideViewController;
    
    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
    [slideViewController showMainViewController:homeViewController];
}

@end
