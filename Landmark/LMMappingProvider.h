//
//  LMMappingProvider.h
//  Landmark
//
//  Created by Lanvige Jiang on 7/10/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <RestKit/CoreData.h>

@interface LMMappingProvider : RKObjectMappingProvider


/**
 A reference to the RKManagedObjectStore for the RKGithub application
 */
@property (nonatomic, strong) RKManagedObjectStore *objectStore;

///-----------------------------------------------------------------------------
/// @name Initializing a Mapping Provider
///-----------------------------------------------------------------------------

/**
 Create and initialize a mapping provider for the RestKit Github sample applicaion.
 
 @return An initialized RKGHMappingProvider object
 */
+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore;

/**
 Initialize an RKGHMappingProvider with a RestKit managed object store object.
 
 @param objectStore The RKManagedObjectStore with which to initialize the mapping provider.
 @return An initialized RKGHMappingProvider instance.
 */
- (id)initWithObjectStore:(RKManagedObjectStore *)objectStore;


/**
 Create and return a RestKit object mapping suitable for mapping a Github User
 resource.
 
 @return A RKObjectMapping suitable for mapping a Github issue.
 */
- (RKManagedObjectMapping *)userObjectMapping;

- (RKManagedObjectMapping *)sharingObjectMapping;


@end
