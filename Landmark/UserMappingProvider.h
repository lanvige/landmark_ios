//
//  UserMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/17/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LMUser;

@interface UserMappingProvider : NSObject

+ (void)getUsersWithBlock:(void (^)(NSArray *users))block;

@end
