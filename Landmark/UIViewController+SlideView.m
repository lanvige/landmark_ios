//
//  UIViewController+SlideMenu.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/24/12.
//  Copyright (c) 2012 Lanvige Inc. All rights reserved.
//

#import "UIViewController+SlideView.h"

#import "SlideViewManager.h"
#import <objc/runtime.h>

@interface UIViewController (SlideViewPrivate)
- (void)toggleSlideView:(BOOL)hidden;
@end

@implementation UIViewController (SlideView)

static char viewStateKey;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void) toggleSlideViewPressed:(id)sender {
    if(self.navigationController.viewState == SlideViewStateVisible) {
        [self.navigationController setViewState:SlideViewStateHidden];
    } else {
        [self.navigationController setViewState:SlideViewStateVisible];
    }
}

- (void) backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) setupSlideViewBarButtonItem {
    if(self.navigationController.viewState == SlideViewStateVisible || 
       [[self.navigationController.viewControllers objectAtIndex:0] isEqual:self]) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] 
                                                 initWithImage:[UIImage imageNamed:@"ButtonMenu.png"] style:UIBarButtonItemStyleBordered 
                                                 target:self action:@selector(toggleSlideViewPressed:)];
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back-arrow"] 
                                         style:UIBarButtonItemStyleBordered target:self action:@selector(backButtonPressed:)];
    }
}

- (void)setViewState:(SlideViewState)viewState {
    if(![self isKindOfClass:[UINavigationController class]]) {
        self.navigationController.viewState = viewState;
        return;
    }
    
    SlideViewState currentState = self.viewState;
    
    objc_setAssociatedObject(self, &viewStateKey, [NSNumber numberWithInt:viewState], OBJC_ASSOCIATION_RETAIN);
    
    switch (currentState) {
        case SlideViewStateHidden:
            if (viewState == SlideViewStateVisible) {
                [self toggleSlideView:NO];
            }
            break;
        case SlideViewStateVisible:
            if (viewState == SlideViewStateHidden) {
                [self toggleSlideView:YES];
            }
            break;
        default:
            break;
    }
}

- (SlideViewState)viewState {
    if(![self isKindOfClass:[UINavigationController class]]) {
        return self.navigationController.viewState;
    }
    
    return (SlideViewState)[objc_getAssociatedObject(self, &viewStateKey) intValue];
}

- (void)animationFinished:(NSString *)animationID finished:(BOOL)finished context:(void *)context
{
    if ([animationID isEqualToString:@"toggleSlideView"])
    {
        if([self isKindOfClass:[UINavigationController class]]) {
            UINavigationController *controller = (UINavigationController *)self;
            [controller.visibleViewController setupSlideViewBarButtonItem];
            
            // disable user interaction on the current view controller
            controller.visibleViewController.view.userInteractionEnabled = (self.viewState == SlideViewStateHidden);
        }
    }
}

@end


@implementation UIViewController (SlideViewPrivate)

// TODO: alter the duration based on the current position of the menu
// to provide a smoother animation
- (void) toggleSlideView:(BOOL)hidden {
    if(![self isKindOfClass:[UINavigationController class]]) return;
    
    [UIView beginAnimations:@"toggleSlideView" context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    [UIView setAnimationDuration:kMenuAnimationDuration];
    
    CGRect frame = self.view.frame;
    frame.origin = CGPointZero;
    
    if (!hidden) {
        switch (self.interfaceOrientation) 
        {
            case UIInterfaceOrientationPortrait:
                frame.origin.x = kSlidebarWidth;
                break;
                
            case UIInterfaceOrientationPortraitUpsideDown:
                frame.origin.x = -1*kSlidebarWidth;
                break;
                
            case UIInterfaceOrientationLandscapeLeft:
                frame.origin.y = -1*kSlidebarWidth;
                break;
                
            case UIInterfaceOrientationLandscapeRight:
                frame.origin.y = kSlidebarWidth;
                break;
        } 
    }
    self.view.frame = frame;
        
    [UIView commitAnimations];
}

@end 
