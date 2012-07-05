//
//  NewViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LocationViewController.h"
#import "AboutViewController.h"

#import "LMAnnotation.h"

@implementation LocationViewController

@synthesize segmentedControl;
@synthesize locationManager;
@synthesize currentLocation;
@synthesize mapView;


-(IBAction)xx:(id) sender{
    
    AboutViewController *aboutViewController = [[AboutViewController alloc] initWithNibName:@"AboutView_iPhone" bundle:nil];
    [self.navigationController pushViewController:aboutViewController animated:TRUE];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{    
    [super viewDidLoad];
    
    // Change the bar in first page.
    self.navigationController.navigationBar.hidden = FALSE;
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    
    [self addSegmentedControlOnNavigation];
    [self addDoneButtonOnNavigation];
    [self initLocationAndMapInfo];
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

- (IBAction) apple:(id) sender {
    CLLocationCoordinate2D coords;
    coords.latitude = 37.33188;
    coords.longitude = -122.029497;
    MKCoordinateSpan span = MKCoordinateSpanMake(0.002389, 0.005681);
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, span);
    [mapView setRegion:region animated:YES];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{  
    self.currentLocation = newLocation;  
    //do something else  
}  

// Add a button on navigation to close the current view.
- (void)addDoneButtonOnNavigation
{
    // Add a done button at left of navigation.
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"done", @"")
                                                                 style:UIBarButtonItemStyleBordered 
                                                                target:self
                                                                action:@selector(doneActionPressed:)];
    self.navigationItem.leftBarButtonItem = itemDone;
    self.navigationItem.title = NSLocalizedString(@"about", @"");
}

// Close the map view.
- (void)doneActionPressed: (id)sender
{
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

- (void)initLocationAndMapInfo
{
    // init the location manager.
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
    
    // Init a annotation with title.
    CLLocationCoordinate2D theCoordinate;
	theCoordinate.latitude = 37.810000;
    theCoordinate.longitude = -122.477989;
    
    LMAnnotation *annotation = [[LMAnnotation alloc] initWithCoordinate:theCoordinate addressDictionary:nil];
	annotation.title = @"Drag to Move Pin";
	annotation.subtitle = [NSString	stringWithFormat:@"%f %f", annotation.coordinate.latitude, annotation.coordinate.longitude];
    
    
    // Init the map
    MKCoordinateRegion coordinateRegion;
    coordinateRegion.center = [[locationManager location] coordinate];
    
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = .02;
    coordinateSpan.longitudeDelta = .02;
    
    coordinateRegion.span = coordinateSpan;
    
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    
    [self.mapView addAnnotation:annotation];
    
    [self.mapView setRegion:coordinateRegion animated:YES]; 
}

// Add segmented control in navigation bar.
- (void)addSegmentedControlOnNavigation
{
    self.segmentedControl = [[UISegmentedControl alloc] 
                             initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"standard", @""),                                                  NSLocalizedString(@"satellite", @""), nil]];
    
    [segmentedControl setSelectedSegmentIndex:0];
    [segmentedControl setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    segmentedControl.frame = CGRectMake(0, 0, 120, 30);
    [segmentedControl addTarget:self
                         action:@selector(segmentedChanged:)
               forControlEvents:UIControlEventValueChanged];
    [segmentedControl addTarget:self action:@selector(segmentedChanged:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = segmentedControl;
}

- (IBAction)segmentedChanged:(id)sender
{
    if (self.segmentedControl.selectedSegmentIndex == 0) 
    {
        //write here your action when first item selected
        NSLog(@"1");
    } 
    else
    {
        NSLog(@"2");
    }
}

@end
