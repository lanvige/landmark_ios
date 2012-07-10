//
//  LMPlace.h
//  Landmark
//
//  Created by Lanvige Jiang on 4/27/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface LMUser : NSManagedObject

@property (nonatomic, strong) NSNumber *id;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *email;

@end
