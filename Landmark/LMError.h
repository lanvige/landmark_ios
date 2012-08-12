//
//  LMError.h
//  Landmark
//
//  Created by Lanvige Jiang on 8/12/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum LMErrorCode {
    /*!
     Like nil for FBErrorCode values, represents an error code that
     has not been initialized yet.
     */
    LMErrorInvalid = 0,
    
    /// The operation failed because it was cancelled.
    LMErrorOperationCancelled,
    
    /// A login attempt failed
    LMErrorLoginFailedOrCancelled,
    
    /*!
     The operation failed because the server returned an unexpected
     response.  You can get this error if you are not using the most
     recent SDK, or if you set your application's migration settings
     incorrectly for the version of the SDK you are using.
     
     If this occurs on the current SDK with proper app migration
     settings, you may need to try changing to one request per batch.
     */
    LMErrorProtocolMismatch,
    
    /// Non-success HTTP status code was returned from the operation.
    LMErrorHTTPError,

    
} LMErrorCode;

/*!
 The key in the userInfo NSDictionary of NSError where you can find
 the inner NSError (if any).
 */
extern NSString *const LMErrorInnerErrorKey;
