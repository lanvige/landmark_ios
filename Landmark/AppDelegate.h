//
//  AppDelegate.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NavigationManager;


@interface AppDelegate : NSObject <UIApplicationDelegate>
{
    @private
    NavigationManager *_navigationManager;
}

// Global window
@property (strong, nonatomic) UIWindow *window;

// Shared navigation manager
+ (NavigationManager *)sharedNavigationManager;

@end
