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
    
    NSDictionary *tableContents;
    NSArray *sortedKeys;

}

@property (nonatomic, assign) id<ModalViewControllerDelegate> delegate;

@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;

@end
