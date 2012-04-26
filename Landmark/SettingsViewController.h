//
//  SettingsViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/25/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "BaseViewController.h"

@class AboutViewController;

@interface SettingsViewController : BaseViewController

@property (nonatomic, retain) AboutViewController *aboutViewController;
@property (nonatomic, retain) IBOutlet UINavigationController *aboutNavigationController;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *aboutButton;

@end
