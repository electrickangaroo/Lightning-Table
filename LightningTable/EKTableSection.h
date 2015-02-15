//
//  EKTableGroup.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKTableSectionProtocol.h"
#import "EKTableRowProtocol.h"

/**
 The EKTableGroup class allows you to a model a table view section by implementing the EKTableSection protocol.
 */
@interface EKTableSection : NSObject <EKTableSectionProtocol>

/**
 The title to be displayed in the section header.
 */
@property (nonatomic, strong) NSString *headerTitle;

/**
 The title to be displayed in the section footer.
 */
@property (nonatomic, strong) NSString *footerTitle;

/**
 The rows to be displayed in the section.
 @discussion EKTableItem objects or objects conforming to the EKTableRow protocol.
 */
@property (nonatomic, strong) NSArray *rows;

/**
 The block to be executed if a selection of a row inside the section is made.
 */
@property (nonatomic, strong) EKTableSelectionHandler selectionHandler;

// For Xcode autocompletion
- (void)setSelectionHandler:(EKTableSelectionHandler)selectionHandler;

/**
 Initializes and returns an instance with the supplied items.
 @param items The items containing the rows.
 */
+ (instancetype)sectionWithRows:(NSArray *)rows;

/**
 Initializes and returns an instance with the supplied items.
 @param headerTitle The title for the group.
 @param footerTitle The footer for the group.
 @param selection The block fired if a row is selected.
 */
+ (instancetype)sectionWithHeaderTitle:(NSString *)headerTitle rows:(NSArray *)rows footerTitle:(NSString *)footerTitle selection:(EKTableSelectionHandler)selection;

/**
 Adds an item to the group.
 @param item The item to add.
 */
- (void)addRow:(id <EKTableRowProtocol>)item;

@end
