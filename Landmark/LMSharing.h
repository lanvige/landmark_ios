//
//  Location.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/26/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"

@class LMUser;

@interface LMSharing : NSManagedObject

@property (nonatomic, retain) NSString *id;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *description;

//@property (nonatomic, strong) NSDate *createdAt;

// Relationships
@property (nonatomic, strong) LMUser *user;

@end
