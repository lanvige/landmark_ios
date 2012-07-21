//
//  SlideViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/21/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>  // Don't forget to add the QuartzCore Framework to your project

#define kSlideSpeed 0.3f
#define kSlideOverlapWidth 52.0f;

@interface SlideViewController : UIViewController

@property (nonatomic, retain) UIViewController * leftViewController;
@property (nonatomic, retain) UIViewController * rightViewController;
@property (nonatomic, retain) UIViewController * rootViewController;

@property (nonatomic, retain) UIBarButtonItem * menuBarButtonItem;

- (id)initWithRootViewController:(UIViewController *)rootViewController;
- (void)setLeftViewController:(UIViewController *)leftViewController rightViewController:(UIViewController *)rightViewController;

- (IBAction)showLeftViewController:(id)sender;
//- (IBAction)showRightViewController:(id)sender;
- (IBAction)showMainViewController:(id)sender;

@end

@protocol MKDSlideViewControllerDelegate <NSObject>

- (void)slideViewController:(SlideViewController *)svc willSlideToViewController:(UIViewController *)vc;
- (void)slideViewController:(SlideViewController *)svc didSlideToViewController:(UIViewController *)vc;

@end
