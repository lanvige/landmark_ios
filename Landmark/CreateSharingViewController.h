//
//  CreateSharingViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LMSharing.h"
#import "SharingMappingProvider.h"

@interface CreateSharingViewController : UIViewController

@property (nonatomic, strong) LMSharing *sharing;
@property (nonatomic, strong) SharingMappingProvider *sharingMappingProvier;

@property (nonatomic, strong) IBOutlet UITextField *titleTextFiled;
@property (nonatomic, strong) IBOutlet UITextField *descriptonTextFiled;

@end
