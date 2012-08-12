//
//  LMPlace.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LMModelBase.h"

@interface LMUser : LMModelBase

@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *email;

- (id)initWithAttributes:(NSDictionary *)attributes;

@end
