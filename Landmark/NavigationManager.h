//
//  NavigationManager.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SplashViewController;

@interface NavigationManager : NSObject
{
    @private
    UIWindow *_window;
    
    SplashViewController *_splashViewController;
    
    UIViewController *_currentViewController;
}

- (id)initWithWindow:(UIWindow *)window;

- (void)displaySplash;

@end
