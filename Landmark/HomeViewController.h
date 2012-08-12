//
//  MainViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LandViewController;
@class CreateSpaceViewController;
@class LocationViewController;
@class CreateSharingViewController;

@interface HomeViewController : UIViewController<UITextFieldDelegate>
{ 
    IBOutlet UITextField *codeTextFiled;
    NSDictionary *tableContents;
    NSArray *sortedKeys;
}

@property (nonatomic, strong) UITextField *codeTextFiled;
@property (nonatomic, strong) NSDictionary *tableContents;
@property (nonatomic, strong) NSArray *sortedKeys;

@property (nonatomic, strong) IBOutlet UIBarButtonItem *shareButton;
@property (nonatomic, strong) CreateSharingViewController *csViewController;

@end
