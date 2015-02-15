//
//  EKTableRowSelection.m
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKTableRowSelection.h"

@implementation EKTableRowSelection

+ (instancetype)selectionWithIndexPath:(NSIndexPath *)indexPath object:(id)object
{
    EKTableRowSelection *selection = [EKTableRowSelection new];
    selection.indexPath = indexPath;
    selection.object = object;
    
    return selection;
}

@end
