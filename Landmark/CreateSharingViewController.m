//
//  CreateSharingViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "CreateSharingViewController.h"

#import "LMCommon.h"

#import "LMSharing.h"
#import "SharingMappingProvider.h"

@interface CreateSharingViewController ()

@end

@implementation CreateSharingViewController

@synthesize sharing;
@synthesize sharingMappingProvier;

@synthesize titleTextFiled, descriptonTextFiled;

// Create a sharing object and save it.
- (void)saveSharing:(id)sender {
    self.sharing = [[LMSharing alloc] init];
    self.sharing.title = self.titleTextFiled.text;
    self.sharing.description = self.descriptonTextFiled.text;
    DLog(@"NEW SHARING -- Title:%@, -- Descrption:%@", sharing.title, sharing.description);
    
    sharingMappingProvier = [[SharingMappingProvider alloc] init];
    [sharingMappingProvier saveSharingWithObject:sharing block:^(BOOL result) {
        if (result) {
            DLog(@"==========");
        }
    }];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"NEW Sharing", @"");
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                                                               target:self 
                                                                                               action:@selector(saveSharing:)];
        
        self.wantsFullScreenLayout = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
