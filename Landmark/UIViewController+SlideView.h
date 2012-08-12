//
//  UIViewController+SideMenu.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/24/12.
//  Copyright (c) 2012 Lanvige Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kMenuAnimationDuration 0.2

typedef enum {
    SlideViewStateHidden,
    SlideViewStateVisible
} SlideViewState;

@interface UIViewController (SlideView)

@property (nonatomic, assign) SlideViewState viewState;

// view controllers should call this on viewDidLoad in order to setup the proper UIBarButtonItem
- (void) setupSlideViewBarButtonItem;

@end
