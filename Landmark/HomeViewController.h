//
//  MainViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/23/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
{ 
    NSDictionary *tableContents;
    NSArray *sortedKeys;
}

@property (nonatomic,retain) NSDictionary *tableContents;
@property (nonatomic,retain) NSArray *sortedKeys;

@end
