//
//  SideMenuViewController.h
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import <UIKit/UIKit.h>


@interface SlideMenuViewController : UITableViewController {
    NSDictionary *tableContents;
    NSArray *sortedKeys;
}

@property (nonatomic, strong) NSDictionary *tableContents;
@property (nonatomic, strong) NSArray *sortedKeys;

@end