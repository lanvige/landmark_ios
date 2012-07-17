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

@property (strong, nonatomic) UIWindow *window;

@end
