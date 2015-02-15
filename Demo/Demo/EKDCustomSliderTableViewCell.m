//
//  EKDCustomSliderTableViewCell.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDCustomSliderTableViewCell.h"

@implementation EKDCustomSliderTableViewCell

- (id)initWithStyle:(EKTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.slider = [UISlider new];
        self.slider.minimumValue = 0;
        self.slider.maximumValue = 255;
        [self.slider addTarget:self action:@selector(handleValueChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.slider];
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.slider.frame = CGRectMake(10, 20, self.contentView.frame.size.width - 20, 15);
}

#pragma mark - Actions

- (void)handleValueChange:(UISlider *)sender
{
    CGFloat value = sender.value / 100;
    
    self.contentView.backgroundColor = [UIColor colorWithRed:value green:value / 2 blue:value / 3 alpha:1.0];
}

@end
