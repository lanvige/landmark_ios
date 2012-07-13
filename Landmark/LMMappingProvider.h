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
 A reference to the RKManagedObjectStore for the Landmark application
 */
@property (nonatomic, strong) RKManagedObjectStore *objectStore;

+ (id)mappingProviderWithObjectStore:(RKManagedObjectStore *)objectStore;

- (id)initWithObjectStore:(RKManagedObjectStore *)objectStore;

- (RKManagedObjectMapping *)userObjectMapping;

- (RKManagedObjectMapping *)sharingObjectMapping;


@end
