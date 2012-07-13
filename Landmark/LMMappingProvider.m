//
//  LMMappingProvider.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/10/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMMappingProvider.h"
#import "LMUser.h"
#import "LMSharing.h"


@implementation LMMappingProvider

@synthesize objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore {
    return [[self alloc] initWithObjectStore:objectStore];    
}


- (id)initWithObjectStore:(RKManagedObjectStore *)theObjectStore {
    self = [super init];
    
    if (self) {
        self.objectStore = theObjectStore;
        
        [self setObjectMapping:[self userObjectMapping] 
        forResourcePathPattern:@"/api/v1/users" 
         withFetchRequestBlock:^NSFetchRequest *(NSString *resourcePath) {
            // NOTE: We could use RKPathMatcher here to easily tokenize the requested resourcePath
            NSFetchRequest *fetchRequest = [LMUser fetchRequest];
             
            return fetchRequest;
        }];

        
        [self setObjectMapping:[self sharingObjectMapping] forResourcePathPattern:@"/sharings"];
    }
    
    return self;
}

- (RKManagedObjectMapping *)userObjectMapping {
    RKManagedObjectMapping *mapping =  [RKManagedObjectMapping mappingForEntityWithName:@"LMUser" inManagedObjectStore:self.objectStore];
    mapping.primaryKeyAttribute = @"id";
    [mapping mapKeyPathsToAttributes:
     @"_id", @"userId",
     @"name", @"name",
     @"email", @"email",
     nil];
    
    return mapping;
}

- (RKManagedObjectMapping *)sharingObjectMapping {
    RKManagedObjectMapping *mapping = [RKManagedObjectMapping mappingForEntityWithName:@"LMSharing" inManagedObjectStore:self.objectStore];
    
    mapping.primaryKeyAttribute = @"id";
    [mapping mapKeyPathsToAttributes:
     @"_id", @"id",
     @"title", @"titile",
     @"description", @"description",
     nil];
    
    // Relationships
    [mapping mapKeyPath:@"user" toRelationship:@"user" withMapping:[self userObjectMapping]];
    
    return mapping;
}

@end
