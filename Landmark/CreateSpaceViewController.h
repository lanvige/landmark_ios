//
//  NewSpaceViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"

@interface CreateSpaceViewController : UIViewController
{
    IBOutlet UITextField *nameTextFiled;
    IBOutlet UITextField *locationTextFiled;

    NSDictionary *tableContents;
    NSArray *sortedKeys;

}

@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;

@property (nonatomic, strong) UITextField *nameTextFiled;
@property (nonatomic, strong) UITextField *locationTextFiled;

- (IBAction)textFiledReturnEditing:(id)sender;
- (IBAction)backgroundTap:(id)sender;

- (IBAction)xx:(id)sender;
- (IBAction)openMap :(id)sender;
- (IBAction)finishButton:(id)sender;

@end
