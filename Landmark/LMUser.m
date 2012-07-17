//
//  LMPlace.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMUser.h"

@implementation LMUser

@synthesize userID = _userID;
@synthesize username = _username;
@synthesize email = _email;


- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _userID = [attributes valueForKeyPath:@"id"];
    _username = [attributes valueForKeyPath:@"username"];
    _email = [attributes valueForKeyPath:@"email"];
    
    return self;
}

@end
