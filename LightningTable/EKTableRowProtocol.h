//
//  EKTableRow.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKTableRowSelection.h"

@class EKTableViewCell;

/**
 The EKTableRow protocol is used to provide row information to a table view. To use this protocol, you adopt it in any custom objects that store or represent row data.
 */
@protocol EKTableRowProtocol <NSObject>

@optional

/**
 Primary title to be displayed in the cell
 @discussion This will set the textLabel.text property of a cell.
 */
@property (nonatomic, strong) NSString *rowTitle;

/**
 Secondary title to be displayed in the cell.
 @discussion This will set the detailTextLabel.text property of a cell.
 */
@property (nonatomic, strong) NSString *rowSubtitle;

/**
 Image to be displayed in the cell.
 */
@property (nonatomic, strong) UIImage *rowImage;

/**
 The class used to initialise a cell.
 */
@property (nonatomic, assign) Class rowCellClass;

/**
 The edge insets to use on the cell.
 */
@property (nonatomic, assign) UIEdgeInsets rowEdgeInsets;

/**
 The block to be fired if a selection is made.
 */
@property (nonatomic, strong) EKTableSelectionHandler rowSelectionHandler;

/**
 The accessory type to be displayed on the row's cell.
 */
@property (nonatomic, assign) UITableViewCellAccessoryType rowAccessoryType;

/**
 The height to use for the cell representing the row.
 */
- (CGFloat)rowHeightForConstraintSize:(CGSize)contraintSize;

/**
 Gives the row the opertunity to configure an instnace of its cell. Useful to set additional properties on custom cells.
 */
- (void)configureRowCell:(EKTableViewCell *)cell;

@end
