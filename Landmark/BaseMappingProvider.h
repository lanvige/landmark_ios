//
//  BaseMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseMappingProvider : NSObject

// Get the all objects / Object json data from API.
- (void)getObjectsWithPath:(NSString *)path 
                     block:(void (^)(id jsonData))block;

- (void)saveObjectWithPath:(NSString *)path 
            parameters:(NSDictionary *) params 
                 block:(void (^)(BOOL))block;

- (void)updateObjectWithPath:(NSString *)path 
                  parameters:(NSDictionary *) params 
                       block:(void (^)(BOOL))block;

- (void)deleteObjectWithPath:(NSString *)path
                       block:(void (^)(BOOL))block;
@end
