//
//  NSColor+Hex.h
//  Landmark
//
//  Created by Lanvige Jiang on 8/4/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *) colorWithHex:(NSString *)hexColor;

//+ (UIColor *) colorWithHex:(NSString *)hexColor Alpha:(CGFloat *);
@end