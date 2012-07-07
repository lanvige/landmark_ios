//
//  NewViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface LocationViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>
{
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    IBOutlet MKMapView *mapView;
    UISegmentedControl *segmentedControl;
}

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) IBOutlet UIBarButtonItem *currentLocationButton;

- (IBAction)segmentedChanged:(id)sender;
- (IBAction)xx:(id)sender;

@end
