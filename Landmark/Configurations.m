//
//  Configurations.m
//  Landmark
//
//  Created by Lanvige Jiang on 8/11/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "Configurations.h"

@interface Configurations ()

- (void)readDefaultConfigurations;

@end

static Configurations *_current = nil;

@implementation Configurations


#pragma mark -
#pragma mark Properties

@synthesize defaultAPIURL;


#pragma mark -
#pragma mark Implementation

+ (Configurations *)current
{
	@synchronized (_current)
	{
		if (_current == nil)
		{
			_current = [[Configurations alloc] init];
		}
		
		return _current;
	}
}


#pragma mark -
#pragma mark * Overrides

- (id)init
{
	self = [super init];
	
	if (self)
	{
		[self readDefaultConfigurations];
	}
	
	return self;
}


#pragma mark -
#pragma mark Private Methods

- (void)readDefaultConfigurations
{
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Configurations" ofType:@"plist"];
	NSDictionary *configuration = [[NSDictionary alloc] initWithContentsOfFile:path];
	
    self.defaultAPIURL = [configuration objectForKey:@"api.url.default"];
}

@end

