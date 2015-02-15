//
//  EKTableViewController.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EKTableView.h"
#import "EKTableViewCell.h"
#import "EKTableSectionProtocol.h"
#import "EKTableRowProtocol.h"

/**
 The EKTableViewController class creates a controller object that manages a table view.
 
 You create a custom subclass of EKTableViewController for each table view that you want to manage. When you initialize the controller in initWithStyle:, you must specify the style of the table view (plain or grouped) that the controller is to manage. You may override loadView or any other superclass method, but if you do be sure to invoke the superclass implementation of the method, usually as the first method call.
 */
@interface EKTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

/**
 Returns the table view managed by the controller object.
 */
@property (nonatomic, strong) EKTableView *tableView;

/**
 A collection of section objects conforming to EKTableSection protocol.
 */
@property (nonatomic, strong) NSArray *sections;

/**
 A Boolean value indicating if the controller clears the selection when the table appears.
 */
@property (nonatomic, assign) BOOL clearsSelectionOnViewWillAppear;

/**
 Initializes a table-view controller to manage a table view of a given style.
 @param style A constant that specifies the style of table view that the controller object is to manage.
 */
- (instancetype)initWithStyle:(EKTableViewStyle)style;

/**
 Adds an object conforming to the EKTableSection protocol as a section to the table-view.
 @param section Section to add.
 @discussion For changes to be reflected visually in your table-view you must call reloadSectionsAnimated:
 */
- (void)addSection:(id <EKTableSectionProtocol>)section;

/**
 Sets the table-view sections and performs a reload of the table-view's datasource with optional animation.
 @param sections The sections to set
 @param reload A flag to indicate whether to reload the datasource.
 @param animated Whether to animate the reload of the datasource.
 */
- (void)setSections:(NSArray *)sections reload:(BOOL)reload animated:(BOOL)animated;

/**
 Reloads the table-view's datasource with optional animation.
 @param animated Whether to animate the reload of the datasource.
 */
- (void)reloadSectionsAnimated:(BOOL)animated;

/**
 Returns the section at the specified index.
 @param index The index of the section to return.
 */
- (id <EKTableSectionProtocol>)sectionAtIndex:(NSInteger)index;

/**
 Returns the row at the specified indexPath.
 @param indexPath The indexPath of the row to return.
 */
- (id <EKTableRowProtocol>)rowAtIndexPath:(NSIndexPath *)indexPath;

/**
 Clears the selection of the currently selected cell in the table-view.
 @param animated Flag whether to animate the deselection.
 */
- (void)clearSelectionAnimated:(BOOL)animated;

@end