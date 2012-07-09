//
//  RKRequestExamples.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/9/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMRequestDemo.h" 

@implementation LMRequestDemo

- (id)init {
    return self;
}

- (void)sendRequest {
    // Send an HTTP GET request to 'http://landmark.dev/api/v1'
    [[RKClient sharedClient] get:@"/coordinates/4ffab38d35ef0f44d7000002" delegate:self];
}

- (void)request:(RKRequest*)request didFailLoadWithError:(NSError *)error {
    RKLogInfo(@"Oh no! We encountered an error: %@", [error localizedDescription]);
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
    
    RKLogInfo(@"Yay! We Got a response");
    
    //    //RKLogInfo(@"Request Headers: %@", [response allHeaderFields]);
    //    RKLogInfo(@"Cookies: %@", [response cookies]);
    //    
    //    if ([response isSuccessful]) {
    //        // Response status was 200..299
    //        if ([response isCreated] && [response isJSON]) {
    //            // Looks like we have a 201 response of type 'application/json'
    //            RKLogInfo(@"The JSON is %@", [response bodyAsJSON]);
    //        }
    //    } else if ([response isError]) {
    //       // Response status was either 400..499 or 500..599
    //       RKLogInfo(@"Ouch! We have an HTTP error. Status Code description: %@",
    //                          [response localizedStatusCodeString]);
    //      }
}

@end
