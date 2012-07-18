//
//  BaseMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "BaseMappingProvider.h"
#import "LMCommon.h"
#import "LMAPIClient.h"

@implementation BaseMappingProvider

- (void)getObjectsWithPath:(NSString *)path 
                     block:(void (^)(id jsonData))block {
    [[LMAPIClient sharedClient] getPath:path
                             parameters:nil
                                success:^(AFHTTPRequestOperation *operation, id response) {
                                    // Mapping JSON data to Data Module Objects
                                    DLog(@"SUCCESS - %s ", __PRETTY_FUNCTION__);
                                    
                                    if (block) {
                                        block(response);
                                    }
                                    
                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    DLog(@"ERROR - %@", error);
                                }];    
}

- (void)saveObjectWithPath:(NSString *)path 
                parameters:(NSDictionary *)params 
                     block:(void (^)(BOOL))block {
    [[LMAPIClient sharedClient] postPath:path 
                              parameters:params 
                                 success:^(AFHTTPRequestOperation *operation, id response) {
                                     DLog(@"SUCCESS - %s ", __PRETTY_FUNCTION__);
                                     if (block) {
                                         block(TRUE);
                                     }
                                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     DLog(@"ERROR - %@", error);
                                     if (block) {
                                         block(FALSE);
                                     }
                                 }];
}

@end