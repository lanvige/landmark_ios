//
//  AppDelegate.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "AppDelegate.h"

#import "NavigationManager.h"
#import "AFNetworkActivityIndicatorManager.h"
#import "DDTTYLogger.h"

#import "MainViewController.h"
#import "SlideViewController.h"
#import "LeftViewController.h"
#import "HomeViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize slideViewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initial the AFNetworking manager.
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    
    //Adds the logger to the console (similar to nslog)
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    // And we also enable colors
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];

    // Init the window as global.
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _navigationManager = [[NavigationManager alloc] initWithWindow:_window];
    [_navigationManager displayHomeView];

    
    MainViewController *mainViewController = [[MainViewController alloc] initWithNibName:@"MainView_iPhone" bundle:nil];
    SlideViewController *slideViewController = [[SlideViewController alloc] initWithRootViewController:mainViewController];
    
    LeftViewController *leftViewController = [[LeftViewController alloc] init];
    leftViewController.mainViewController = mainViewController;  // assign weak reference to main view
    
//    HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeView_iPhone" bundle:nil];
    [slideViewController setLeftViewController:leftViewController rightViewController:nil];
    
    _window.rootViewController = slideViewController;
    [_window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
