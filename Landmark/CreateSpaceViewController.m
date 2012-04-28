//
//  NewSpaceViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "CreateSpaceViewController.h"
#import "LocationViewController.h"

@implementation CreateSpaceViewController

@synthesize nameTextFiled;
@synthesize locationTextFiled;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Hidden the tab bar.
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
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


#pragma mark -
#pragma mark textbox keyboard hidden

-(IBAction)textFiledReturnEditing:(id)sender 
{
    [sender resignFirstResponder];
}

// When touch the backgroud to close keyboard.
- (IBAction)backgroundTap:(id)sender
{
    [nameTextFiled resignFirstResponder];
    [locationTextFiled resignFirstResponder];
}

- (IBAction)takePicture:(id)sender
{
    //Show a items let use upload pic from pic/take from camera.
}

// Open a float layer for map, then translate the location to current page.
-(IBAction)openMap:(id)sender
{
    LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationView_iPhone" bundle:nil];
    UINavigationController *mapNavigationController = [[UINavigationController alloc] initWithRootViewController:locationViewController];
    
    [self presentModalViewController:mapNavigationController animated:YES];
}

-(IBAction)xx:(id)sender
{
    LocationViewController *locationViewController = [[LocationViewController alloc] initWithNibName:@"LocationView_iPhone" bundle:nil];
    [self.navigationController pushViewController:locationViewController animated:TRUE];
}

- (IBAction)finishButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
