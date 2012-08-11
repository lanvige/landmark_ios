//
//  Prefs.m
//  Landmark
//
//  Created by Lanvige Jiang on 8/11/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//
//  A demo for global virables.

#import "Prefs.h"

#ifdef DEBUG
NSString *const gCONFIG_API_URL = @"api.url.debug";
#else
NSString *const gCONFIG_API_URL = @"api.url.live";
#endif


@implementation Prefs

@end
