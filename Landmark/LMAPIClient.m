//
//  LMAPIClient.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/17/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMAPIClient.h"

#import "AFJSONRequestOperation.h"

static NSString * const kLMAPIBaseURLString = @"http://api.landmark.dev/v1/";

@implementation LMAPIClient

+ (LMAPIClient *)sharedClient {
    static LMAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LMAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kLMAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

@end


