//
//  BaseMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "BaseMappingProvider.h"

#import "LMAPIClient.h"

@implementation BaseMappingProvider

// Get object with json.
- (void)getObjectsWithPath:(NSString *)path 
                     block:(void (^)(id jsonData))block {
    [[LMAPIClient sharedClient] getPath:path
                             parameters:nil
                                success:^(AFHTTPRequestOperation *operation, id response) {
                                    // Mapping JSON data to Data Module Objects
                                    DDLogInfo(@"GET SUCCESS - %s ", __PRETTY_FUNCTION__);
                                    
                                    if (block) {
                                        block(response);
                                    }
                                    
                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    DDLogInfo(@"GET ERROR - %@", error);
                                }];    
}

- (void)saveObjectWithPath:(NSString *)path 
                parameters:(NSDictionary *)params 
                     block:(void (^)(BOOL))block {
    [[LMAPIClient sharedClient] postPath:path 
                              parameters:params 
                                 success:^(AFHTTPRequestOperation *operation, id response) {
                                     DDLogInfo(@"SAVE SUCCESS - %s ", __PRETTY_FUNCTION__);
                                     DDLogInfo(@"========%@", params);
                                     if (block) {
                                         block(TRUE);
                                     }
                                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                     DDLogInfo(@"SAVE ERROR - %@", error);
                                     if (block) {
                                         block(FALSE);
                                     }
                                 }];
}

- (void)updateObjectWithPath:(NSString *)path 
                  parameters:(NSDictionary *)params
                       block:(void (^)(BOOL))block {
    [[LMAPIClient sharedClient] putPath:path
                             parameters:params 
                                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                    DDLogInfo(@"UPDATE SUCCESS - %s", __PRETTY_FUNCTION__);
                                    if (block) {
                                        block(TRUE);
                                    }
                                } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                    DDLogInfo(@"UPDATE ERROR -%@", error);
                                    if (block) {
                                        block(FALSE);
                                    }
                                }];
}

- (void)deleteObjectWithPath:(NSString *)path 
                       block:(void (^)(BOOL))block {
    [[LMAPIClient sharedClient] deletePath:path 
                                parameters:nil 
                                   success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                       DDLogInfo(@"DELETE SUCCESS - %s", __PRETTY_FUNCTION__);
                                   } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                       DDLogInfo(@"DELETE ERROR - %@", error);
                                   }];
}
@end