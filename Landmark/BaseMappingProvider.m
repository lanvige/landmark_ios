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

+ (void)getObjectsWithQueryPath:(NSString *)path WithBlock:(void (^)(id jsonData))block {

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

@end