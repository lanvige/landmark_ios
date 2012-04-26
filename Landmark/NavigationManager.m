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
@synthesize homeNavigationController;
@synthesize settingsNavigationController;

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


- (void)displayRootView
{    
    _homeViewController = [[HomeViewController alloc] init];
    _settingsViewController = [[SettingsViewController alloc] init];
    
    // Init a new nav controller as container to include setting view.
    self.homeNavigationController = [[UINavigationController alloc] initWithRootViewController:_homeViewController];
    self.settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:_settingsViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNavigationController, settingsNavigationController, nil];
    
    // Remove other view & controller
    if(_currentViewController)
    {
        [_currentViewController.view removeFromSuperview];
    }
    
    _currentViewController = self.tabBarController;
    [_window addSubview:self.tabBarController.view];
}

@end
