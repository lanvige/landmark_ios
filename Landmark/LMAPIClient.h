//
//  LMAPIClient.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/17/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface LMAPIClient : AFHTTPClient

+ (LMAPIClient *)sharedClient;

@end