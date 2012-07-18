//
//  BaseMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseMappingProvider : NSObject

// Get the all objects json data from API.
- (void)getObjectsWithQueryPath:(NSString *)path WithBlock:(void (^)(id jsonData))block;

//+ (void)getObjectWithBlock:(void (^)(id jsonData))block;

@end
