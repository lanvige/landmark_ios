//
//  LMAnnotation.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/4/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <MapKit/MapKit.h>

#import "LMModelBase.h"

@interface LMAnnotation : MKPlacemark {
	CLLocationCoordinate2D coordinate;
	NSString *title;
	NSString *subtitle;
}

// Re-declare MKAnnotation's readonly property 'coordinate' to readwrite. 
@property (nonatomic, readwrite, assign) CLLocationCoordinate2D coordinate;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *subtitle;

@end
