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

#pragma mark -
#pragma mark Synthesized Properties

@synthesize nameTextFiled;
@synthesize locationTextFiled;

@synthesize mainTableView;
@synthesize contentsList;

#pragma mark -
#pragma mark Dealloc and Memory Methods

#pragma mark -
#pragma mark Initialization and UI Creation Methods

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

#pragma mark -
#pragma mark UIViewController Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"Add Landmark", @"");
    
    [self buildViewTable];
}

- (void)buildViewTable
{
    // Build data for table.
    NSArray *nameArrItem = [[NSArray alloc]initWithObjects:@"Name", nil];
    
    // Build data for table.
    NSArray *locationArrItem = [[NSArray alloc]initWithObjects:@"Location", @"Current", nil];
    
    //NSDictionary *dictItems = [[NSDictionary alloc] initWithObjectsAndKeys:nameArrItem, @"", locationArrItem, @"", nil];
    
    NSMutableArray *sectionsArray = [[NSMutableArray alloc] initWithObjects:nameArrItem, locationArrItem, nil];
    self.contentsList = sectionsArray;
//    self.sortedKeys =[[self.tableContents allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark UITableView Datasource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //return [self.sortedKeys count];
    return self.contentsList.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//	return [self.sortedKeys objectAtIndex:section];
//}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section 
{
//	NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:section]];
//	return [listData count];
    NSArray *sectionContents = [self.contentsList objectAtIndex:section];
    return sectionContents.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    // ?
	static NSString *CellIdentifier = @"CellIdentifier";
	
    // Section content
	NSArray *sectionContents =[self.contentsList objectAtIndex:[indexPath section]];
    
    NSString *contentForThisRow = [sectionContents objectAtIndex:[indexPath row]];
	
	UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if(cell == nil) 
    {	
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        if ([indexPath section] == 0) {
            UITextField *playerTextField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
            playerTextField.adjustsFontSizeToFitWidth = YES;
            playerTextField.textColor = [UIColor blackColor];
            if ([indexPath row] == 0) 
            {
                playerTextField.placeholder = @"example@gmail.com";
                playerTextField.keyboardType = UIKeyboardTypeEmailAddress;
                playerTextField.returnKeyType = UIReturnKeyNext;
            }
            
            else {
                playerTextField.placeholder = @"Required";
                playerTextField.keyboardType = UIKeyboardTypeDefault;
                playerTextField.returnKeyType = UIReturnKeyDone;
                playerTextField.secureTextEntry = YES;
            }       
            playerTextField.backgroundColor = [UIColor whiteColor];
            playerTextField.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
            playerTextField.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
            playerTextField.textAlignment = UITextAlignmentLeft;
            playerTextField.tag = 0;
            //playerTextField.delegate = self;
            
            playerTextField.clearButtonMode = UITextFieldViewModeNever; // no clear 'x' button to the right
            [playerTextField setEnabled: YES];
            
            [cell addSubview:playerTextField];
        }
	}
    

    
    [[cell textLabel] setText:contentForThisRow];
    
    if ([indexPath section] == 0) { // Email & Password Section
        if ([indexPath row] == 0) { // Email
            cell.textLabel.text = @"Email";
        }
        else {
            cell.textLabel.text = @"Password";
        }
    }
    else { // Login button section
        cell.textLabel.text = @"Log in";
    }
    
	return cell;
}

#pragma mark -
#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	//NSArray *listData =[self.tableContents objectForKey:[self.sortedKeys objectAtIndex:[indexPath section]]];
	NSUInteger row = [indexPath row];
	//NSString *rowValue = [listData objectAtIndex:row];
	//NSString *message = [[NSString alloc] initWithFormat:rowValue];
	//[alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    //NSLog([NSString stringWithFormat:@"%d", row]);
    switch (row) 
    {
        case 0:
        {
        }
    }
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
