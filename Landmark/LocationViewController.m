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
@synthesize currentLocationButton;
@synthesize mapView;


- (IBAction)xx:(id) sender {
    AboutViewController *aboutViewController = [[AboutViewController alloc] initWithNibName:@"AboutView_iPhone" bundle:nil];
    [self.navigationController pushViewController:aboutViewController animated:TRUE];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    [self addCurrentLocationButton];
    [self initLocationAndMapInfo];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// Add a button on navigation to close the current view.
- (void)addDoneButtonOnNavigation {
    // Add a done button at left of navigation.
    UIBarButtonItem *itemDone = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"done", @"")
                                                                 style:UIBarButtonItemStyleBordered 
                                                                target:self
                                                                action:@selector(doneActionPressed:)];
    self.navigationItem.leftBarButtonItem = itemDone;
    self.navigationItem.title = NSLocalizedString(@"about", @"");
}

// Add a button to back to current location on map.
- (void)addCurrentLocationButton {
    // Add a about button on the right of bar.
    self.currentLocationButton = [[UIBarButtonItem alloc]initWithTitle:NSLocalizedString(@"CL", @"")
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(showCurrentLocation:)];
    
    // What's the different between navigationBar.topItem with navigationItem.
    self.navigationItem.rightBarButtonItem = self.currentLocationButton;
}

// Close the map view.
- (void)doneActionPressed: (id)sender {
    [self.navigationController dismissModalViewControllerAnimated:YES];
}

// Show the about page.
- (IBAction) showCurrentLocation: (id)sender
{
    [self moveMapToLocation:currentLocation];
}

- (void)initLocationAndMapInfo {
    // init the location manager.
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    // 得到想要的精度。
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Set a movement threshold for new events.
    // To get the user current location.
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
    
    // Init the map size.
    MKCoordinateRegion coordinateRegion;
    coordinateRegion.center = [[locationManager location] coordinate];
    
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = .02;
    coordinateSpan.longitudeDelta = .02;
    
    coordinateRegion.span = coordinateSpan;
    
    // Show user's current location.
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];

    [self.mapView setRegion:coordinateRegion animated:YES]; 
}

// If the system get the user's location, this method will be invoked.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {  
    //[locationManager stopUpdatingLocation];
    self.currentLocation = newLocation;
    
    NSString *strLat = [NSString stringWithFormat:@"%.4f", newLocation.coordinate.latitude];
    NSString *strLng = [NSString stringWithFormat:@"%.4f", newLocation.coordinate.longitude];
    NSLog(@"Lat: %@  Lng: %@", strLat, strLng);
    
    [self moveMapToLocation:currentLocation];
    
//    LMAnnotation *annotation = [[LMAnnotation alloc] initWithCoordinate:coords addressDictionary:nil];
//	annotation.title = @"Drag to Move Pin";
//	annotation.subtitle = [NSString	stringWithFormat:@"%f %f", 
//                           annotation.coordinate.latitude, 
//                           annotation.coordinate.longitude];
//    
//    [self.mapView addAnnotation:annotation];
}

- (void)moveMapToLocation:(CLLocation *)location {
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude);
	float zoomLevel = 0.02;
	MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
	[self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"locError:%@", error);    
}

// Add segmented control in navigation bar.
- (void)addSegmentedControlOnNavigation {
    self.segmentedControl = [[UISegmentedControl alloc] 
                             initWithItems:[NSArray arrayWithObjects:NSLocalizedString(@"standard", @""),
                                            NSLocalizedString(@"satellite", @""),
                                            nil]];
    
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

- (IBAction)segmentedChanged:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        //write here your action when first item selected
        NSLog(@"1");
    } 
    else {
        NSLog(@"2");
    }
}

@end
