//
//  SharingMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SharingMappingProvider.h"
#import "LMCommon.h"
#import "LMSharing.h"
#import "LMAPIClient.h"

@implementation SharingMappingProvider

// Get all the sharing from current user.
+ (void)getSharingsWithBlock:(void (^)(NSArray *))block {
    [[LMAPIClient sharedClient] getPath:@"sharings" 
                             parameters:[NSDictionary dictionaryWithObject:@"false" 
                                                                    forKey:@"include_entities"] 
                                success:^(AFHTTPRequestOperation *operation, id response) {
                                    NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:[response count]];
                                    for (NSDictionary *attributes in response) {
                                        LMSharing *sharing = [[LMSharing alloc] initWithAttributes:attributes];
                                        [mutableUsers addObject:sharing];
                                    }
                                    
                                    if (block) {
                                        block([NSArray arrayWithArray:mutableUsers]);
                                    }
                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Error", nil) 
                                                                message:[error localizedDescription] 
                                                               delegate:nil 
                                                      cancelButtonTitle:nil 
                                                      otherButtonTitles:NSLocalizedString(@"OK", nil), nil] show];
                                    if (block) {
                                        block(nil);
                                    }
                                }];
}

// Get a sharing with id
+ (void)getSharingWithId:(NSString *)sharingID withBlock:(void (^)(LMSharing *))block {
    NSLog(@"%@", sharingID);
    [[LMAPIClient sharedClient] getPath:[NSString stringWithFormat:@"sharings/%@", sharingID]
                             parameters:nil 
                                success:^(AFHTTPRequestOperation *operation, id response) {
                                    DLog(@"SUCCESS %s ", __PRETTY_FUNCTION__);
                                    
                                    LMSharing *sharing = [[LMSharing alloc] initWithAttributes:response];
                                    
                                    if (block) {
                                        block(sharing);
                                    }
                                }
                                failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    DLog(@"ERROR  %@",error);
                                    
                                    if (block) {
                                        block(nil);
                                    }
                                }];
}


@end
