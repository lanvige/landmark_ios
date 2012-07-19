//
//  SharingMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SharingMappingProvider.h"

#import "LMCommon.h"
#import "LMModelBase.h"
#import "LMSharing.h"

@implementation SharingMappingProvider

NSString * const kSharingsPath = @"sharings";

// Get all the sharing from current user.
- (void)getSharingsWithBlock:(void (^)(NSArray *))block {
    [super getObjectsWithPath:kSharingsPath block:^(id jsonData) {
        if (jsonData) {
            NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:[jsonData count]];
            for (NSDictionary *attributes in jsonData) {
                LMSharing *sharing = [[LMSharing alloc] initWithAttributes:attributes];
                [mutableUsers addObject:sharing];
            }
            
            if (block) {
                block([NSArray arrayWithArray:mutableUsers]);
            }
        }
    }];
}

// Get a sharing with id
- (void)getSharingWithID:(NSString *)sharingID block:(void (^)(LMSharing *))block {
    NSString *path = [NSString stringWithFormat:@"%@/%@", kSharingsPath, sharingID];
    
    [super getObjectsWithPath:path block:^(id jsonData) {
        if (jsonData) {
            LMSharing *sharing = [[LMSharing alloc] initWithAttributes:jsonData];
            
            if (block) {
                block(sharing);
            }
        }
    }];
}

- (void)saveSharingWithObject:(LMSharing *)sharing block:(void (^)(BOOL *))block {
    [super saveObjectWithPath:kSharingsPath parameters:sharing.getParameters block:^(BOOL result) {
        if(result) {
        }
    }];
}

@end
