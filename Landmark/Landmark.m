//
//  Landmark.m
//  Landmark
//
//  Created by Lanvige Jiang on 8/12/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "Landmark.h"

#ifdef DEBUG
NSString *const gCONFIG_API_URL = @"api.url.debug";
#else
NSString *const gCONFIG_API_URL = @"api.url.live";
#endif

@interface Landmark ()

- (void)readDefaultConfigurations;

@end

static Landmark *_context = nil;

@implementation Landmark


#pragma mark -
#pragma mark Properties

@synthesize defaultAPIURL;


#pragma mark -
#pragma mark Implementation

+ (Landmark *)context
{
	@synchronized (_context)
	{
		if (_context == nil)
		{
			_context = [[Landmark alloc] init];
		}
		
		return _context;
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
	
    self.defaultAPIURL = [configuration objectForKey:gCONFIG_API_URL];
}


@end
