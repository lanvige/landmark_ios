//
//  UIView+Resize.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/24/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "UILabel+Resize.h"

@implementation UILabel(Resize)

- (CGFloat) resizeLabel {
	CGRect frame = [self frame];
    
	CGSize size = [self.text sizeWithFont:self.font
                            constrainedToSize:CGSizeMake(frame.size.width, 9999)
                                lineBreakMode:UILineBreakModeWordWrap];
    
	CGFloat delta = size.height - frame.size.height;
	frame.size.height = size.height;
	[self setFrame:frame];
	
	return delta;
}

@end

