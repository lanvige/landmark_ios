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
#import "HistoryViewController.h"
#import "ContactsViewController.h"
#import "SettingsViewController.h"
#import "AboutViewController.h"

@implementation NavigationManager

@synthesize currentViewController;
@synthesize splashViewController;
@synthesize loginViewContgroller;

@synthesize tabBarController;
@synthesize homeNavigationController;
@synthesize historyNavigationController;
@synthesize contactsNavigationController;
@synthesize settingsNavigationController;

@synthesize homeViewController;
@synthesize historyViewController;
@synthesize contactsViewController;
@synthesize settingsViewController;

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
    self.splashViewController = [[SplashViewController alloc] init];
    self.splashViewController.view.frame = [[UIScreen mainScreen] applicationFrame];
    
    // Remove other view & controller
    if(self.currentViewController)
    {
        [self.currentViewController.view removeFromSuperview];
    }
    
    self.currentViewController = self.splashViewController;
    
    // Add splash view to window
    [_window addSubview:self.splashViewController.view];
}


- (void)displayRootView
{    
    self.homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
    //self.historyViewController = [[HistoryViewController alloc] initWithNibName:@"HistoryView_iPhone" bundle:nil];
    self.historyViewController = [[HistoryViewController alloc] initWithStyle:UITableViewStylePlain];
    self.contactsViewController = [[ContactsViewController alloc] initWithStyle:UITableViewStylePlain];
    self.settingsViewController = [[SettingsViewController alloc] initWithNibName:@"SettingsView_iPhone" bundle:nil];
    
    // Init a new nav controller as container to include setting view.
    self.homeNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
    self.historyNavigationController = [[UINavigationController alloc] initWithRootViewController:self.historyViewController];
    self.contactsNavigationController = [[UINavigationController alloc] initWithRootViewController:self.contactsViewController];
    self.settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:self.settingsViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeNavigationController, historyNavigationController, contactsNavigationController, settingsNavigationController, nil];
    
    // Remove other view & controller
    if(self.currentViewController)
    {
        [self.currentViewController.view removeFromSuperview];
    }
    
    self.currentViewController = self.tabBarController;
    [_window addSubview:self.tabBarController.view];
}

@end
