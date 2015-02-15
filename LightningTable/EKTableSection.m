//
//  EKTableGroup.m
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKTableSection.h"

@implementation EKTableSection

@synthesize sectionRows, sectionHeaderTitle, sectionFooterTitle;

#pragma mark - Initialisers

+ (instancetype)sectionWithRows:(NSArray *)rows
{
    return [EKTableSection sectionWithHeaderTitle:nil rows:rows footerTitle:nil selection:nil];
}

+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle rows:(NSArray *)rows footerTitle:(NSString *)footerTitle selection:(EKTableSelectionHandler)selection
{
    EKTableSection *group = [EKTableSection new];
    group.headerTitle = headerTitle;
    group.rows = rows;
    group.footerTitle = footerTitle;
    group.selectionHandler = selection;
    
    return group;
}

#pragma mark - Actions

- (void)addRow:(id)item
{
    self.rows = [self.rows arrayByAddingObject:item];
}

#pragma mark - Section protocol

- (NSArray *)sectionRows
{
    return self.rows;
}

- (NSString *)sectionHeaderTitle
{
    return self.headerTitle;
}

- (NSString *)sectionFooterTitle
{
    return self.footerTitle;
}

- (EKTableSelectionHandler)sectionSelectionHandler
{
    return self.selectionHandler;
}

@end
