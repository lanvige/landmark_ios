//
//  NSString+IDNum.m
//  Efekta12NavigationTest
//
//  Created by Lin Shi on 7/9/12.
//  Copyright (c) 2012 EF Englishtown. All rights reserved.
//

#import "NSString+IDNum.h"

@implementation NSString (IDNum)

- (NSString*)numberStringOfID{
    NSArray *elements = [self componentsSeparatedByString:@"!"];
    NSString *numStr = [elements objectAtIndex:1];
    return numStr;
}

@end
