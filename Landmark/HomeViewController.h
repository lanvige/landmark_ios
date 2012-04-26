//
//  MainViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LandViewController;

@interface HomeViewController : UIViewController<UITextFieldDelegate>
{ 
    IBOutlet UITextField *txt;
    NSDictionary *tableContents;
    NSArray *sortedKeys;
    
    //NewViewController *newViewController;
}

@property (nonatomic, retain) UITextField *txt;
@property (nonatomic, retain) NSDictionary *tableContents;
@property (nonatomic, retain) NSArray *sortedKeys;

@property (nonatomic, retain) LandViewController *landViewController;

@end
