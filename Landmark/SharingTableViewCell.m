//
//  SharingTableViewCell.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/18/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "SharingTableViewCell.h"

#import "LMSharing.h"

@implementation SharingTableViewCell {
    
@private
    __strong LMSharing *_sharing;    
}

@synthesize sharing = _sharing;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (!self) {
        return nil;
    }
    
    self.textLabel.adjustsFontSizeToFitWidth = YES;
    self.textLabel.textColor = [UIColor darkGrayColor];
    self.detailTextLabel.font = [UIFont systemFontOfSize:12.0f];
    self.detailTextLabel.numberOfLines = 0;
    self.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return self;
}

- (void)setSharing:(LMSharing *)sharing {
    _sharing = sharing;
    
    self.textLabel.text = _sharing.title;
    self.detailTextLabel.text = _sharing.description;
    
    [self setNeedsLayout];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    self.detailTextLabel.frame = CGRectMake(70.0f, 30.0f, 240.0f, 20.0f);
}

@end
