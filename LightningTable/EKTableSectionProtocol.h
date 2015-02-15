//
//  EKTableSection.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EKTableRowSelection.h"

/**
 The EKTableSection protocol is used to provide section information to a table view. To use this protocol, you adopt it in any custom objects that store or represent section data.
 */
@protocol EKTableSectionProtocol <NSObject>

/**
 The rows to be displayed in the section.
 @discussion Objects conforming to the EKTableRow protocol.
 */
@property (nonatomic, strong) NSArray *sectionRows;

/**
 The title to be displayed in the section header.
 */
@property (nonatomic, strong) NSString *sectionHeaderTitle;

/**
 The title to be displayed in the section footer.
 */
@property (nonatomic, strong) NSString *sectionFooterTitle;

@optional

/**
 The block to be fired if a selection is made.
 */
@property (nonatomic, copy) EKTableSelectionHandler sectionSelectionHandler;

@end
