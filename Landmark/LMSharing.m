//
//  Location.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMSharing.h"

@implementation LMSharing

@synthesize mID = _sharingID;
@synthesize title = _title;
@synthesize description = _description;
@synthesize createdAt = _createdAt;
@synthesize updateAt = _updateAt;

@synthesize user;

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _sharingID = [attributes valueForKeyPath:@"_id"];
    _title = [attributes valueForKeyPath:@"title"];
    _description = [attributes valueForKeyPath:@"description"];
    _createdAt = [attributes valueForKey:@"createAt"];
    _updateAt = [attributes valueForKey:@"updateAt"];
    
    return self;
}

- (NSDictionary *)getParameters {
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"title", _title,
                            @"description", _description,
                            nil];
    
    return params;
}

@end
