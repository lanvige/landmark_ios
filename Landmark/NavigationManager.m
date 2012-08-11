//
//  NavigationManager.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "NavigationManager.h"

#import "SplashViewController.h"
#import "MainViewController.h"
#import "HomeViewController.h"

@implementation NavigationManager

@synthesize splashViewController;
@synthesize slideViewController;
@synthesize mainViewController;
@synthesize leftViewController;
@synthesize homeViewController;

// Set the _window as global window from appdelgate.
- (id)initWithWindow:(UIWindow *)window
{
    if(self = [super init])
    {
        _window = window;
    }
    
    return self;
}

- (void)displaySplashView
{
    self.splashViewController = [[SplashViewController alloc] init];
    self.splashViewController.view.frame = [[UIScreen mainScreen] applicationFrame];
    
    // Add splash view to window
    [_window addSubview:self.splashViewController.view];
}


- (void)displayHomeView
{
//    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainView_iPhone" bundle:nil];
//    self.slideViewController = [[SlideViewController alloc] initWithRootViewController:mainViewController];
//    
//    self.leftViewController = [[LeftViewController alloc] init];
//    self.leftViewController.mainViewController = mainViewController;  // assign weak reference to main view
//    
//    self.homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
//    [self.slideViewController setLeftViewController:leftViewController rightViewController:nil];
//    
//    _window.rootViewController = self.slideViewController;
//    [_window makeKeyAndVisible];
}

@end
