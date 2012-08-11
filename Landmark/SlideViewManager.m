//
//  SlideViewManager.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SlideViewManager.h"

#import "UIViewController+SlideView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SlideViewManager

@synthesize navigationController;
@synthesize slideMenuController;

+ (SlideViewManager *) sharedManager {
    static dispatch_once_t once;
    static SlideViewManager *sharedManager;
    dispatch_once(&once, ^ { sharedManager = [[SlideViewManager alloc] init]; });
    return sharedManager;
}

+ (void) configureWithNavigationController:(UINavigationController *)controller 
                        slideViewController:(id)viewController {
    SlideViewManager *manager = [SlideViewManager sharedManager];
    manager.navigationController = controller;
    manager.slideMenuController = viewController;
    
    [controller setViewState:SlideViewStateHidden];
    
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] 
                                          initWithTarget:manager action:@selector(navigationBarPanned:)];
    [recognizer setMinimumNumberOfTouches:1];
	[recognizer setMaximumNumberOfTouches:1];
    [recognizer setDelegate:manager];
    [controller.navigationBar addGestureRecognizer:recognizer];
    
    recognizer = [[UIPanGestureRecognizer alloc] 
                  initWithTarget:manager action:@selector(navigationControllerPanned:)];
    [recognizer setMinimumNumberOfTouches:1];
	[recognizer setMaximumNumberOfTouches:1];
    [recognizer setDelegate:manager];
    [controller.view addGestureRecognizer:recognizer];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] 
                                             initWithTarget:manager action:@selector(navigationControllerTapped:)];
    [tapRecognizer setDelegate:manager];
    [controller.view addGestureRecognizer:tapRecognizer];
    
    [controller.view.superview insertSubview:[viewController view] belowSubview:controller.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:manager 
                                             selector:@selector(flipViewAccordingToStatusBarOrientation:) 
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification 
                                               object:nil];
    
    controller.view.layer.shadowOpacity = 0.75f;
    controller.view.layer.shadowRadius = 10.0f;
    controller.view.layer.shadowColor = [UIColor blackColor].CGColor;
}


#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return YES;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if([gestureRecognizer isKindOfClass:[UITapGestureRecognizer class]] && 
       self.navigationController.viewState != SlideViewStateHidden) return YES;
    
    if([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        if([gestureRecognizer.view isEqual:self.navigationController.view] && 
           self.navigationController.viewState != SlideViewStateHidden) return YES;
        
        if([gestureRecognizer.view isEqual:self.navigationController.navigationBar] && 
           self.navigationController.viewState == SlideViewStateHidden) return YES;
    }
    return NO;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer 
    shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
	return ![gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}

- (void) navigationControllerTapped:(id)sender {
    if(self.navigationController.viewState != SlideViewStateHidden) {
        [self.navigationController setViewState:SlideViewStateHidden];
    }
}

- (void) setNavigationControllerOffset:(CGFloat)xOffset {
    CGRect frame = self.navigationController.view.frame;
    frame.origin = CGPointZero;
    switch (self.navigationController.interfaceOrientation) 
    {
        case UIInterfaceOrientationPortrait:
            frame.origin.x = xOffset;
            break;
            
        case UIInterfaceOrientationPortraitUpsideDown:
            frame.origin.x = -1*xOffset;
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
            frame.origin.y = -1*xOffset;
            break;
            
        case UIInterfaceOrientationLandscapeRight:
            frame.origin.y = xOffset;
            break;
    }
    
    self.navigationController.view.frame = frame;
}

- (CGFloat) yAdjustedForInterfaceOrientation:(CGPoint)point {
    if(UIInterfaceOrientationIsPortrait(self.navigationController.interfaceOrientation)) {
        return ABS(point.y);
    } else {
        return ABS(point.x);
    }
}

- (CGFloat) xAdjustedForInterfaceOrientation:(CGPoint)point {
    if(UIInterfaceOrientationIsPortrait(self.navigationController.interfaceOrientation)) {
        return ABS(point.x);
    } else {
        return ABS(point.y);
    }
}

- (void) setXAdjustedForInterfaceOrientation:(CGFloat)newX point:(CGPoint)point {
    switch (self.navigationController.interfaceOrientation) 
    {
        case UIInterfaceOrientationPortrait:
            point.x = newX;
            break;
            
        case UIInterfaceOrientationPortraitUpsideDown:
            point.x = -1*newX;
            break;
            
        case UIInterfaceOrientationLandscapeLeft:
            point.y = -1*newX;
            break;
            
        case UIInterfaceOrientationLandscapeRight:
            point.y = newX;
            break;
    }
}

- (CGFloat) widthAdjustedForInterfaceOrientation:(UIView *)view {
    if(UIInterfaceOrientationIsPortrait(self.navigationController.interfaceOrientation)) {
        return view.frame.size.width;
    } else {
        return view.frame.size.height;
    }
}

// this method handles the navigation bar pan event
// and sets the navigation controller's frame as needed
- (void) handleNavigationBarPan:(UIPanGestureRecognizer *)recognizer {    
    UIView *view = self.navigationController.view;
    
	if(recognizer.state == UIGestureRecognizerStateBegan) {
        originalOrigin = view.frame.origin;
	}
    
    CGPoint translatedPoint = [recognizer translationInView:view];
    translatedPoint = CGPointMake([self xAdjustedForInterfaceOrientation:originalOrigin]+translatedPoint.x, 
                                  [self yAdjustedForInterfaceOrientation:originalOrigin]+translatedPoint.y);
    
    translatedPoint.x = MIN(translatedPoint.x, kSlidebarWidth);
    translatedPoint.x = MAX(translatedPoint.x, 0);
    
    [self setNavigationControllerOffset:translatedPoint.x];
    
	if(recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint velocity = [recognizer velocityInView:view];
        CGFloat finalX = translatedPoint.x + (.35*velocity.x);
        CGFloat viewWidth = [self widthAdjustedForInterfaceOrientation:view]; 
        
        if(self.navigationController.viewState == SlideViewStateHidden) {
            if(finalX > viewWidth/2) {
                [self.navigationController setViewState:SlideViewStateVisible];
            } else {
                [UIView beginAnimations:nil context:NULL];
                [self setNavigationControllerOffset:0];
                [UIView commitAnimations];
            }
        } else if(self.navigationController.viewState == SlideViewStateVisible) {
            if(finalX < [self xAdjustedForInterfaceOrientation:originalOrigin]) {
                [self.navigationController setViewState:SlideViewStateHidden];
            } else {
                [UIView beginAnimations:nil context:NULL];
                [self setNavigationControllerOffset:[self xAdjustedForInterfaceOrientation:originalOrigin]]; 
                [UIView commitAnimations];
            }
        }
	}
}

- (void) navigationControllerPanned:(id)sender {
    if(self.navigationController.viewState == SlideViewStateHidden) return;
    
    [self handleNavigationBarPan:sender];
}

- (void) navigationBarPanned:(id)sender {
    if(self.navigationController.viewState != SlideViewStateHidden) return;
    
    [self handleNavigationBarPan:sender];
}


#pragma mark - Side Menu Rotation

- (void)flipViewAccordingToStatusBarOrientation:(NSNotification *)notification {
    /*
     This notification is most likely triggered inside an animation block, 
     therefore no animation is needed to perform this nice transition. 
     */
    
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    
    CGFloat angle = 0.0;
    CGRect newFrame = self.slideMenuController.view.window.bounds;
    CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
    
    switch (orientation) { 
        case UIInterfaceOrientationPortraitUpsideDown:
            angle = M_PI; 
            newFrame.size.height -= statusBarSize.height;
            break;
        case UIInterfaceOrientationLandscapeLeft:
            angle = - M_PI / 2.0f;
            newFrame.origin.x += statusBarSize.width;
            newFrame.size.width -= statusBarSize.width; 
            break;
        case UIInterfaceOrientationLandscapeRight:
            angle = M_PI / 2.0f;
            newFrame.size.width -= statusBarSize.width;
            break;
        default: // as UIInterfaceOrientationPortrait
            angle = 0.0;
            newFrame.origin.y += statusBarSize.height;
            newFrame.size.height -= statusBarSize.height;
            break;
    } 
    
    self.slideMenuController.view.transform = CGAffineTransformMakeRotation(angle);
    self.slideMenuController.view.frame = newFrame;
    
    if(self.navigationController.viewState == SlideViewStateVisible) {
        [self.navigationController setViewState:SlideViewStateHidden];
    }
    
    self.navigationController.view.layer.shadowOpacity = 0.75f;
    self.navigationController.view.layer.shadowRadius = 10.0f;
    self.navigationController.view.layer.shadowColor = [UIColor blackColor].CGColor;
}



@end
