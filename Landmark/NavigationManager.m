//
//  NavigationManager.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "NavigationManager.h"

#import "SplashViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "AboutViewController.h"

@implementation NavigationManager

@synthesize tabBarController = _tabBarController;

// Set the _window as global window from appdelgate.
- (id)initWithWindow:(UIWindow *)window
{
    if(self = [super init])
    {
        _window = window;
    }
    
    return self;
}

- (void)displaySplash
{
    _splashViewController = [[SplashViewController alloc] init];
    _splashViewController.view.frame = [[UIScreen mainScreen] applicationFrame];
    
    // Remove other view & controller
    if(_currentViewController)
    {
        [_currentViewController.view removeFromSuperview];
    }

    _currentViewController = _splashViewController;
    
    // Add splash view to window
    [_window addSubview:_splashViewController.view];
}


- (void)displayHome
{    
    _homeViewController = [[HomeViewController alloc] init];
    _settingsViewController = [[SettingsViewController alloc] init];
    
    // Init a new nav controller as container to include setting view.
    _navigationController = [[UINavigationController alloc] initWithRootViewController:_settingsViewController];
    
    // Change the bar's style.
    _navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    // Add a about button on the right of bar.
    UIBarButtonItem *btnAbout = [[UIBarButtonItem alloc]initWithTitle:@"About" 
                                                        style:UIBarButtonItemStyleBordered 
                                                        target:self 
                                                        action:@selector(rightAction:)];

    NSLog(@"1");
    _navigationController.navigationBar.topItem.rightBarButtonItem = btnAbout;
    
    // Set the tile on bar.
    //_navigationController.navigationBar.topItem.title = @"About";
    
    // What's the different between navigationBar.topItem with navigationItem.
    // navigationController.navigationItem.rightBarButtonItem = btnAbout;
    // navigationController.navigationItem.title = @"Sayonara Chat";
    
    // Set the tab info, text and image.
    _navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Setting" image:[UIImage imageNamed:nil] tag:0];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:_homeViewController, _navigationController, nil];

    // Remove other view & controller
    if(_currentViewController)
    {
        [_currentViewController.view removeFromSuperview];
    }
    
    _currentViewController = self.tabBarController;
    [_window addSubview:self.tabBarController.view];
}

// Show the about page.
- (void)rightAction: (id)sender
{
    _aboutViewController = [[AboutViewController alloc] init];
    [_navigationController pushViewController:_aboutViewController animated:FALSE];
}

@end
