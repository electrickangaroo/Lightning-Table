//
//  EKTableItem.m
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKTableRow.h"
#import "EKTableViewCell.h"

@implementation EKTableRow

+ (instancetype)rowWithTitle:(NSString *)title
{
    return [EKTableRow rowWithTitle:title subtitle:nil image:nil];
}

+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image
{
    EKTableRow *item = [EKTableRow new];
    item.title = title;
    item.subtitle = subtitle;
    item.image = image;
    
    return item;
}

#pragma mark - EKTableRowProtocol

- (NSString *)rowTitle
{
    return self.title;
}

- (NSString *)rowSubtitle
{
    return self.subtitle;
}

- (UIImage *)rowImage
{
    return self.image;
}

- (Class)rowCellClass
{
    return [EKTableViewCell class];
}

- (EKTableSelectionHandler)rowSelectionHandler
{
    return self.selectionHandler;
}

@end
