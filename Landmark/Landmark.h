//
//  Landmark.h
//  Landmark
//
//  Created by Lanvige Jiang on 8/12/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const gCONFIG_API_URL;

// Generated from script by Git tag.
#import "LMVersion-generated.h"

@interface Landmark : NSObject

+ (Landmark *)context;

@property (nonatomic, copy) NSString *defaultAPIURL;

@end
