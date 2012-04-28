//
//  NewViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LocationViewController.h"
#import "AboutViewController.h"

@implementation LocationViewController

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
    // Change the bar in first page.
    self.navigationController.navigationBar.hidden = FALSE;
    
    [super viewDidLoad];
    
    // init the location manager.
    self.locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    // Set a movement threshold for new events.
    locationManager.distanceFilter = 500;
    [locationManager startUpdatingLocation];
    
    
    // Init the map
    MKCoordinateRegion coordinateRegion;
    coordinateRegion.center = [[locationManager location] coordinate];
    
    MKCoordinateSpan coordinateSpan;
    coordinateSpan.latitudeDelta = .05;
    coordinateSpan.longitudeDelta = .02;
    
    coordinateRegion.span = coordinateSpan;
    
    self.mapView.showsUserLocation = YES;
    [self.mapView setMapType:MKMapTypeStandard];
    [self.mapView setZoomEnabled:YES];
    [self.mapView setScrollEnabled:YES];
    

    [self.mapView setRegion:coordinateRegion animated:YES]; 
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

@end
