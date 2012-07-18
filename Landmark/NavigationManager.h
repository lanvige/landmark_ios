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
@class SharingsViewController;
@class ContactsViewController;
@class SettingsViewController;

@interface NavigationManager : NSObject
{
    @private
    UIWindow *_window;
}

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) SplashViewController *splashViewController;
@property (strong, nonatomic) LoginViewController *loginViewContgroller;

@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *homeNavigationController;
@property (strong, nonatomic) UINavigationController *sharingsNavigationController;
@property (strong, nonatomic) UINavigationController *contactsNavigationController;
@property (strong, nonatomic) UINavigationController *settingsNavigationController;

@property (strong, nonatomic) HomeViewController *homeViewController;
@property (strong, nonatomic) SharingsViewController *sharingsViewController;
@property (strong, nonatomic) ContactsViewController *contactsViewController;
@property (strong, nonatomic) SettingsViewController *settingsViewController;

- (id)initWithWindow:(UIWindow *)window;

- (void)displaySplash;
- (void)displayRootView;

@end
