//
//  SharingMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LMSharing;

@interface SharingMappingProvider : NSObject

+ (void)getShaingsWithBlock:(void (^)(NSArray *sharings))block;

@end
