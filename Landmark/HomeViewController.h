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


@interface HomeViewController : UIViewController<UITextFieldDelegate>
{ 
    IBOutlet UITextField *codeTextFiled;
    NSDictionary *tableContents;
    NSArray *sortedKeys;
}

@property (nonatomic, strong) UITextField *codeTextFiled;
@property (nonatomic, strong) NSDictionary *tableContents;
@property (nonatomic, strong) NSArray *sortedKeys;

@end
