//
//  SharingMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseMappingProvider.h"

@class LMSharing;

@interface SharingMappingProvider : BaseMappingProvider

+ (void)getSharingsWithBlock:(void (^)(NSArray *sharings))block;

+ (void)getSharingWithId:(NSString *)sharingID withBlock:(void (^)(LMSharing *sharing))block;

//+ (void)saveSharingWith:(LMSharing *)sharing withBlock:(BOOL *)block;
//
//+ (void)updateSharingWith:(LMSharing *)sharing withBlock:(BOOL *)block;
//
//+ (void)deleteSharingWith:(LMSharing *)sharing withBlock:(BOOL *)block;

@end
