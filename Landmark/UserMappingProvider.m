//
//  UserMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/17/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "UserMappingProvider.h"

#import "LMUser.h"
#import "LMAPIClient.h"

@implementation UserMappingProvider

+ (void)getUsersWithBlock:(void (^)(NSArray *tweets))block {
    [[LMAPIClient sharedClient] getPath:@"users" 
                             parameters:[NSDictionary dictionaryWithObject:@"false" 
                                                                    forKey:@"include_entities"] 
                                success:^(AFHTTPRequestOperation *operation, id JSON) {
        NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:[JSON count]];
        for (NSDictionary *attributes in JSON) {
            LMUser *user = [[LMUser alloc] initWithAttributes:attributes];
            [mutableUsers addObject:user];
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
