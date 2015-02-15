//
//  EKDCustomSliderRow.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDCustomSliderRow.h"
#import "EKDCustomSliderTableViewCell.h"

@implementation EKDCustomSliderRow

- (Class)rowCellClass
{
    return [EKDCustomSliderTableViewCell class];
}

- (void)configureRowCell:(EKDCustomSliderTableViewCell *)cell
{
    cell.slider.value = 127;
}

@end
