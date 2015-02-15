//
//  EKTableViewCell.m
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKTableViewCell.h"

@implementation EKTableViewCell

- (id)initWithStyle:(EKTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:(UITableViewCellStyle)EKTableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {

        self.textLabel.numberOfLines = 0;
        self.detailTextLabel.numberOfLines = 0;
    }
    
    return self;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.textLabel.text = nil;
    self.detailTextLabel.text = nil;
    self.imageView.image = nil;
    self.accessoryType = kNilOptions;
}

@end
