//
//  ContactMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BaseMappingProvider.h"

@class LMUser;

@interface ContactMappingProvider : BaseMappingProvider

- (void)getContactsWithBlock:(void (^)(NSArray *contacts))block;

- (void)getContactWithId:(NSString *)contactID withBlock:(void (^)(LMUser *contact))block;

@end
