//
//  UserTableViewCell.m
//  Landmark
//
//  Created by Lanvige Jiang on 7/17/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "UserTableViewCell.h"

#import "LMUser.h"

@implementation UserTableViewCell {
    
@private
    __strong LMUser *_user;    
}

@synthesize user = _user;


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

- (void)setUser:(LMUser *)user {
    _user = user;
    
    self.textLabel.text = _user.username;
    self.detailTextLabel.text = _user.email;
    
    [self setNeedsLayout];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.textLabel.frame = CGRectMake(70.0f, 10.0f, 240.0f, 20.0f);
    self.textLabel.frame = CGRectMake(70.0f, 30.0f, 240.0f, 20.0f);
}

@end
