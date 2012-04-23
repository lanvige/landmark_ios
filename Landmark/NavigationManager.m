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

@implementation NavigationManager


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


- (void)displayLogin
{
    _loginViewContgroller = [[LoginViewController alloc] init];
    _loginViewContgroller.view.frame = [[UIScreen mainScreen] applicationFrame];
    
    // Remove other view & controller
    if(_currentViewController)
    {
        [_currentViewController.view removeFromSuperview];
    }
    
    _currentViewController = _loginViewContgroller;
    
    // Add splash view to window
    [_window addSubview:_loginViewContgroller.view];
}

@end
