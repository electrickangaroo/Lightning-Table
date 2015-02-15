//
//  EKTableItem.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKTableRowProtocol.h"

/**
 The EKTableItem class allows you to a model a table view row by implementing the EKTableRow protocol.
 */
@interface EKTableRow : NSObject <EKTableRowProtocol>

/**
 The title of the row.
 @discussion This will set the textLabel.text property of a cell.
 */
@property (nonatomic, strong) NSString *title;

/**
 The subtitle of the row.
 @discussion This will set the detailTextLabel.text property of a cell.
 */
@property (nonatomic, strong) NSString *subtitle;

/**
 The image of the row.
 @discussion This will set the imageView.image property of a cell.
 */
@property (nonatomic, strong) UIImage *image;

/**
 The selection handler of the row.
 @discussion This block will be executed if the cell belonging to the row is selected in the table-view.
 */
@property (nonatomic, strong) EKTableSelectionHandler selectionHandler;
- (void)setSelectionHandler:(EKTableSelectionHandler)selectionHandler;

/**
 Initializes and returns an instance with the supplied title.
 @param The title for the row.
 */
+ (instancetype)rowWithTitle:(NSString *)title;

/**
 Initializes and returns an instance with the supplied items.
 @param The title for the row.
 @param The subtitle for the row.
 @param The image for the row.
 */
+ (instancetype)rowWithTitle:(NSString *)title subtitle:(NSString *)subtitle image:(UIImage *)image;

@end
