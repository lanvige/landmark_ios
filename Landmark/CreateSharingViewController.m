//
//  CreateSharingViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "CreateSharingViewController.h"

#import "LMSharing.h"
#import "SharingMappingProvider.h"
#import "DDTTYLogger.h"

@interface CreateSharingViewController ()

@end

@implementation CreateSharingViewController

#pragma mark -
#pragma mark Synthesize

@synthesize sharing;
@synthesize mapView, currentLocation, locationManager;
@synthesize sharingMappingProvier;

@synthesize titleTextFiled, descriptonTextFiled;

#pragma mark -
#pragma mark Implementation

// Create a sharing object and save it.
- (void)saveSharing:(id)sender {
    self.sharing = [[LMSharing alloc] init];
    self.sharing.title = self.titleTextFiled.text;
    self.sharing.description = self.descriptonTextFiled.text;
    DDLogError(@"NEW SHARING -- Title:%@, -- Descrption:%@", sharing.title, sharing.description);
    
    sharingMappingProvier = [[SharingMappingProvider alloc] init];
    [sharingMappingProvier saveSharingWithObject:sharing block:^(BOOL result) {
        if (result) {
            DDLogInfo(@"==========");
        }
    }];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.title = NSLocalizedString(@"NEW", @"");
        self.navigationItem.rightBarButtonItem.enabled = YES;
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Save", @"")
                                                                                  style:UIBarButtonItemStyleBordered
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

#pragma mark - 
#pragma mark Map Method

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


#pragma mark -
#pragma mark textbox keyboard hidden

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.text = @"";
    return NO;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [titleTextFiled resignFirstResponder];
    [descriptonTextFiled resignFirstResponder];
}

@end
