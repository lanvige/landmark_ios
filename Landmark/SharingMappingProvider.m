//
//  SharingMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SharingMappingProvider.h"

#import "LMSharing.h"
#import "LMAPIClient.h"

@implementation SharingMappingProvider

+ (void)getShaingsWithBlock:(void (^)(NSArray *))block {
    [[LMAPIClient sharedClient] getPath:@"sharings" 
                             parameters:[NSDictionary dictionaryWithObject:@"false" 
                                                                    forKey:@"include_entities"] 
                                success:^(AFHTTPRequestOperation *operation, id JSON) {
                                    NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:[JSON count]];
                                    for (NSDictionary *attributes in JSON) {
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

@end
