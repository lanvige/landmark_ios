//
//  ContactMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "ContactMappingProvider.h"
#import "LMUser.h"

@implementation ContactMappingProvider

NSString * const kContactsPath = @"users";

- (void)getContactsWithBlock:(void (^)(NSArray *contacts))block {
    [super getObjectsWithQueryPath:kContactsPath WithBlock:^(id jsonData) {
        if (jsonData) {
            NSMutableArray *mutableUsers = [NSMutableArray arrayWithCapacity:[jsonData count]];
            for (NSDictionary *attributes in jsonData) {
                LMUser *user = [[LMUser alloc] initWithAttributes:attributes];
                [mutableUsers addObject:user];
            }
            
            if (block) {
                block([NSArray arrayWithArray:mutableUsers]);
            }
        }
    }];
}

// Get a sharing with id
- (void)getContactWithId:(NSString *)contactID withBlock:(void (^)(LMUser *))block {
    NSString *path = [NSString stringWithFormat:@"%@/%@", kContactsPath, contactID];
    
    [super getObjectsWithQueryPath:path WithBlock:^(id jsonData) {
        if (jsonData) {
            LMUser *user = [[LMUser alloc] initWithAttributes:jsonData];
            
            if (block) {
                block(user);
            }
        }
    }];
}

@end
