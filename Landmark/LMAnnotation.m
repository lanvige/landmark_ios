//
//  LMAnnotation.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/4/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMAnnotation.h"

@implementation LMAnnotation

@synthesize coordinate = coordinate;
@synthesize title = title;
@synthesize subtitle = subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate addressDictionary:(NSDictionary *)addressDictionary {
	
	if ((self = [super initWithCoordinate:coordinate addressDictionary:addressDictionary])) {
		self.coordinate = coordinate;
	}
	return self;
}

@end
