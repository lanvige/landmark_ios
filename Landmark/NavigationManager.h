//
//  NavigationManager.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SplashViewController;
@class LoginViewController;
@class HomeViewController;
@class SettingsViewController;
@class AboutViewController;

@interface NavigationManager : NSObject
{
    @private
    UIWindow *_window;
    
    UIViewController *_currentViewController;
    
    SplashViewController *_splashViewController;
    LoginViewController *_loginViewContgroller;
    HomeViewController *_homeViewController;
    SettingsViewController *_settingsViewController;
    UINavigationController *_navigationController;
    AboutViewController *_aboutViewController;
}

@property (strong, nonatomic) UITabBarController *tabBarController;

- (id)initWithWindow:(UIWindow *)window;

- (void)displaySplash;
- (void)displayHome;

@end
