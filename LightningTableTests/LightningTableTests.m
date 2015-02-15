//
//  LightningTableTests.m
//  LightningTableTests
//
//  Created by Phillip Caudell on 15/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LightningTable.h"

@interface LightningTableTests : XCTestCase

@end

@implementation LightningTableTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testModelHelpers
{
    EKTableViewController *viewController = [[EKTableViewController alloc] initWithStyle:EKTableViewStylePlain];

    EKTableRow *row1 = [EKTableRow rowWithTitle:@"Row 1"];
    EKTableSection *section1 = [EKTableSection sectionWithRows:@[row1]];

    viewController.sections = @[section1];
    
    XCTAssertEqual(section1, [viewController sectionAtIndex:0], @"Sections do not match.");
    XCTAssertEqual(row1, [viewController rowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]], @"Rows do not match");
}

- (void)testAddSection
{
    EKTableViewController *viewController = [[EKTableViewController alloc] initWithStyle:EKTableViewStylePlain];
    
    EKTableSection *section1 = [EKTableSection sectionWithRows:nil];
    [viewController addSection:section1];
    
    EKTableSection *section2 = [EKTableSection sectionWithRows:nil];
    [viewController addSection:section2];
    
    XCTAssertEqual(viewController.sections.count, 2, @"Section count doesn't match number of sections added.");
}

@end
