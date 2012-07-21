//
//  NavigationManager.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SplashViewController;
@class SlideViewController;
@class MainViewController;
@class LeftViewController;
@class HomeViewController;

@interface NavigationManager : NSObject
{
    @private
    UIWindow *_window;
}

@property (nonatomic, strong) SplashViewController *splashViewController;

@property (nonatomic, strong) SlideViewController *slideViewController;
@property (nonatomic, strong) MainViewController *mainViewController;
@property (nonatomic, strong) LeftViewController *leftViewController;
@property (nonatomic, strong) HomeViewController *homeViewController;

- (id)initWithWindow:(UIWindow *)window;

- (void)displaySplashView;
- (void)displayHomeView;

@end
