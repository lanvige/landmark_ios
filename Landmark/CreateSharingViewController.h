//
//  CreateSharingViewController.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "LMSharing.h"
#import "SharingMappingProvider.h"

@interface CreateSharingViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate> {
    CLLocation *currentLocation;
    IBOutlet MKMapView *mapView;
}

@property (nonatomic, strong) LMSharing *sharing;
@property (nonatomic, strong) SharingMappingProvider *sharingMappingProvier;
@property (nonatomic, strong) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) IBOutlet UITextField *titleTextFiled;
@property (nonatomic, strong) IBOutlet UITextField *descriptonTextFiled;

@end
