//
//  EKTableRowSelection.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EKTableRowSelection;

typedef void (^EKTableSelectionHandler)(EKTableRowSelection *selection);

/**
 The EKTableRowSelection class represents a selection in an EKTableView.
 */
@interface EKTableRowSelection : NSObject

/**
 The object or row that was selected in the table view.
 */
@property (nonatomic, strong) id object;

/**
 The index path of the row that was selected in the table view.
 */
@property (nonatomic, strong) NSIndexPath *indexPath;

/**
 Creates a new instance with the supplied indexPath and object.
 @param indexPath The index path of the selection.
 @param object The object of the selection. Typically the row.
 */
+ (instancetype)selectionWithIndexPath:(NSIndexPath *)indexPath object:(id)object;

@end
