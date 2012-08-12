//
//  Configurations.h
//  Landmark
//
//  Created by Lanvige Jiang on 8/11/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

// Generated from script by Git tag.
#import "LMVersion-generated.h"

@interface Configurations : NSObject

+ (Configurations *)current;

@property (nonatomic, copy) NSString *defaultAPIURL;

@end
