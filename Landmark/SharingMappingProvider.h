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

- (void)getSharingsWithBlock:(void (^)(NSArray *sharings))block;

- (void)getSharingWithID:(NSString *)sharingID block:(void (^)(LMSharing *sharing))block;

- (void)saveSharingWithObject:(LMSharing *)sharing block:(void (^)(BOOL *))block;
//
//+ (void)updateSharingWith:(LMSharing *)sharing withBlock:(BOOL *)block;
//
//+ (void)deleteSharingWith:(LMSharing *)sharing withBlock:(BOOL *)block;

@end
