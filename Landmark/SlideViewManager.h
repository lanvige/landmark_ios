//
//  SlideViewManager
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kSlidebarWidth 270

@interface SlideViewManager : NSObject<UIGestureRecognizerDelegate> {
    CGPoint originalOrigin;
}

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, strong) UITableViewController *slideMenuController;

+ (SlideViewManager *) sharedManager;

// this is all you should need to setup your app
+ (void) configureWithNavigationController:(UINavigationController *)controller 
                        slideViewController:(id)viewController;

@end
