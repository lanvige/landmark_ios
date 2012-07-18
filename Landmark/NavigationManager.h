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

@property (nonatomic, strong) UIViewController *currentViewController;

@property (nonatomic, strong) UITabBarController *tabBarController;
@property (nonatomic, strong) UINavigationController *homeNavigationController;
@property (nonatomic, strong) UINavigationController *sharingsNavigationController;
@property (nonatomic, strong) UINavigationController *contactsNavigationController;
@property (nonatomic, strong) UINavigationController *settingsNavigationController;

@property (nonatomic, strong) SplashViewController *splashViewController;
@property (nonatomic, strong) LoginViewController *loginViewContgroller;
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) SharingsViewController *sharingsViewController;
@property (nonatomic, strong) ContactsViewController *contactsViewController;
@property (nonatomic, strong) SettingsViewController *settingsViewController;

- (id)initWithWindow:(UIWindow *)window;

- (void)displaySplash;
- (void)displayRootView;

@end
