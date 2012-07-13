//
//  LMUserCell.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/10/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "LMUserCell.h"

@implementation LMUserCell

@synthesize nameLabel;
@synthesize emailLabel;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
