//
//  LMAnnotation.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/4/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMAnnotation.h"

@implementation LMAnnotation

@synthesize coordinate = _coordinate;
@synthesize title = _title;
@synthesize subtitle = _subtitle;

- (id)initWithCoordinate:(CLLocationCoordinate2D)coordinate1 addressDictionary:(NSDictionary *)addressDictionary {
	
	if ((self = [super initWithCoordinate:coordinate1 addressDictionary:addressDictionary])) {
		_coordinate = coordinate1;
	}
	return self;
}

@end
