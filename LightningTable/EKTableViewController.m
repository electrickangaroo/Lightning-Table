//
//  EKTableViewController.m
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKTableViewController.h"

@interface EKTableViewController ()

@property (nonatomic, assign) EKTableViewStyle style;
@property (nonatomic, strong) NSMutableArray *registeredCellClasses;
@property (nonatomic, strong) NSMutableDictionary *proxyCells;

@end

@implementation EKTableViewController

#pragma mark - Initialisers

- (instancetype)init
{
    return [self initWithStyle:EKTableViewStylePlain];
}

- (instancetype)initWithStyle:(EKTableViewStyle)style
{
    if (self = [super init]) {
        
        _style = style;
        _registeredCellClasses = [NSMutableArray array];
        _clearsSelectionOnViewWillAppear = YES;
    }
    
    return self;
}

#pragma mark - View lifecycle 

- (void)loadView
{
    [super loadView];
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    self.tableView = [[EKTableView alloc] initWithFrame:frame style:self.style];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.view = self.tableView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.clearsSelectionOnViewWillAppear) {
        [self clearSelectionAnimated:animated];
    }
}

#pragma mark - Actions

- (void)setSections:(NSArray *)sections reload:(BOOL)reload animated:(BOOL)animated
{
    self.sections = sections;
    
    if (reload) {
        [self reloadSectionsAnimated:animated];
    }
}

- (void)addSection:(id <EKTableSectionProtocol>)section
{
    if (!self.sections) {
        self.sections = @[section];
    } else {
        self.sections = [self.sections arrayByAddingObject:section];
    }
}

- (void)reloadSectionsAnimated:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)clearSelectionAnimated:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:animated];
}

#pragma mark - Table view datasoure

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    id <EKTableSectionProtocol> section = [self sectionAtIndex:sectionIndex];
    
    return section.sectionRows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self cellClassForIndexPath:indexPath];
    
    // Check to see if cell class is registered with table-view; if not, register it.
    if (![self isCellClassRegistered:cellClass]) {
        [self registerCellClass:cellClass];
    }
    
    EKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellClass) forIndexPath:indexPath];
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)sectionIndex
{
    id <EKTableSectionProtocol> section = [self sectionAtIndex:sectionIndex];
    
    return section.sectionHeaderTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)sectionIndex
{
    id <EKTableSectionProtocol> section = [self sectionAtIndex:sectionIndex];
    
    return section.sectionFooterTitle;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    
    if ([row respondsToSelector:@selector(rowHeightForConstraintSize:)]) {
        
        CGSize constaintSize = CGSizeMake(self.view.bounds.size.width, MAXFLOAT);

        return [row rowHeightForConstraintSize:constaintSize];
        
    } else {
        
        return [self automaticCellHeightForIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

#pragma mark - TableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    id <EKTableSectionProtocol> section = [self sectionAtIndex:indexPath.section];
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    
    EKTableSelectionHandler handler = nil;
    
    if ([section respondsToSelector:@selector(sectionSelectionHandler)]) {
        handler = [section sectionSelectionHandler];
    }
    
    if ([row respondsToSelector:@selector(rowSelectionHandler)]) {
        
        // Don't overide the section handler unless row has handler
        if ([row rowSelectionHandler]) {
            handler = [row rowSelectionHandler];
        }
    }
    
    EKTableRowSelection *selection = [EKTableRowSelection selectionWithIndexPath:indexPath object:row];
    
    if (handler) {
        handler(selection);
    } else {
        [self clearSelectionAnimated:YES];
    }
}

#pragma mark - Model Helpers

- (id <EKTableSectionProtocol>)sectionAtIndex:(NSInteger)index
{
    return self.sections[index];
}

- (id <EKTableRowProtocol>)rowAtIndexPath:(NSIndexPath *)indexPath
{
    id <EKTableSectionProtocol> section = [self sectionAtIndex:indexPath.section];
    
    return section.sectionRows[indexPath.row];
}

- (BOOL)isIndexPathSelectable:(NSIndexPath *)indexPath
{
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    id <EKTableSectionProtocol> section = [self sectionAtIndex:indexPath.section];
    
    if ([row respondsToSelector:@selector(rowSelectionHandler)]) {
        
        if (row.rowSelectionHandler) {
            return YES;
        } else {
            return NO;
        }
        
    } else if (section.sectionSelectionHandler) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Cell helpers

- (void)configureCell:(EKTableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    
    if ([row respondsToSelector:@selector(rowTitle)]) {
        cell.textLabel.text = [row rowTitle];
    }
    
    if ([row respondsToSelector:@selector(rowSubtitle)]) {
        cell.detailTextLabel.text = [row rowSubtitle];
    }
    
    if ([row respondsToSelector:@selector(rowImage)]) {
        cell.imageView.image = [row rowImage];
    }
    
    if ([self isIndexPathSelectable:indexPath]) {
        cell.accessoryType = kNilOptions;
    }
    
    if ([row respondsToSelector:@selector(rowAccessoryType)]) {
        cell.accessoryType = [row rowAccessoryType];
    }
    
    // Allow row to configure cell
    if ([row respondsToSelector:@selector(configureRowCell:)]) {
        [row configureRowCell:cell];
    }
}

- (void)registerCellClass:(Class)cellClass
{
    [self.tableView registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
    [self.registeredCellClasses addObject:NSStringFromClass(cellClass)];
}

- (BOOL)isCellClassRegistered:(Class)cellClass
{
    return [self.registeredCellClasses containsObject:NSStringFromClass(cellClass)];
}

- (Class)cellClassForIndexPath:(NSIndexPath *)indexPath
{
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    
    Class cellClass = [EKTableViewCell class];
    
    if ([row respondsToSelector:@selector(rowCellClass)]) {
        cellClass = [row rowCellClass];
    }
    
    return cellClass;
}

- (EKTableViewCell *)dequeueProxyCellForIndexPath:(NSIndexPath *)indexPath
{
    Class cellClass = [self cellClassForIndexPath:indexPath];
    NSString *reuseIdentifier = NSStringFromClass(cellClass);
    
    EKTableViewCell *cell = self.proxyCells[reuseIdentifier];
    
    if (!cell) {
        cell = [[cellClass alloc] initWithStyle:(UITableViewCellStyle)EKTableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    return cell;
}

- (CGFloat)automaticCellHeightForIndexPath:(NSIndexPath *)indexPath
{
    // Configure a proxy instance of the row's cell
    EKTableViewCell *proxyCell = [self dequeueProxyCellForIndexPath:indexPath];
    [self configureCell:proxyCell forIndexPath:indexPath];

    // Force cell to layout
    [proxyCell layoutSubviews];
    
    CGFloat height = self.tableView.rowHeight;
    CGFloat greatestY = 0;
    CGFloat lowestY = 0;
    
    // Go through each subview and find view with greatest and lowest y & height values
    for (UIView *view in proxyCell.contentView.subviews) {
        
        CGFloat maxY = view.frame.size.height + view.frame.origin.y;
        
        if (maxY > greatestY) {
            greatestY = maxY;
        }
        
        if (view.frame.origin.y < lowestY) {
            lowestY = view.frame.origin.y;
        }
    }
    
    height = greatestY + abs(lowestY);
    
    // Default cell edge insets
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 10, 10);
    
    id <EKTableRowProtocol> row = [self rowAtIndexPath:indexPath];
    
    if ([row respondsToSelector:@selector(rowEdgeInsets)]) {
        insets = [row rowEdgeInsets];
    }
    
    height += insets.top + insets.bottom;
    
    return height;
}

@end
