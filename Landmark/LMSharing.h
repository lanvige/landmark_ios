//
//  Location.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LMModelBase.h"

@class LMUser;

@interface LMSharing : LMModelBase

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSData * updateAt;

// Relationships
@property (nonatomic, strong) LMUser *user;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
