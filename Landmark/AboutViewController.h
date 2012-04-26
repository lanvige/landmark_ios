//
//  AboutViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/25/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalViewControllerDelegate.h"

@interface AboutViewController : UIViewController 
{
    id<ModalViewControllerDelegate> delegate;
}

@property (nonatomic, assign) id<ModalViewControllerDelegate> delegate;

@end
