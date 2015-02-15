//
//  EKDDemoViewController.m
//  Demo
//
//  Created by Phillip Caudell on 15/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDRootViewController.h"
#import "EKDBasicDemoViewController.h"
#import "EKDCustomObjectViewController.h"
#import "EKDCustomCellViewController.h"

@implementation EKDRootViewController

- (id)initWithStyle:(EKTableViewStyle)style
{
    if (self = [super initWithStyle:EKTableViewStylePlain]) {
        
        self.title = @"⚡️TABLE";
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
        BASICS
        Get started modeling simple table-view layouts.
     */
    
    EKTableRow *basicRow = [EKTableRow rowWithTitle:@"Basics" subtitle:@"Get started modeling simple table-view layouts." image:[UIImage imageNamed:@"TableItem-Basic"]];
    [basicRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        EKDBasicDemoViewController *viewController = [EKDBasicDemoViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    
    /*
        CUSTOM OBJECTS
        See how to incorporate your own custom models into a tableview.
     */
    
    EKTableRow *customObjectRow = [EKTableRow rowWithTitle:@"Custom Objects" subtitle:@"See how to incorporate your own custom models into a tableview." image:[UIImage imageNamed:@"TableItem-Notes"]];
    [customObjectRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        EKDCustomObjectViewController *viewController = [EKDCustomObjectViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    
    /*
        CUSTOM CELLS
        See how to display your own custom cells with your model.
     */
    
    EKTableRow *customCellRow = [EKTableRow rowWithTitle:@"Custom Cells" subtitle:@"See how to display your own custom cells with your model." image:[UIImage imageNamed:@"TableItem-Slider"]];
    [customCellRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        EKDCustomCellViewController *viewController = [EKDCustomCellViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    
    EKTableSection *demoSection = [EKTableSection sectionWithHeaderTitle:@"Demos" rows:@[basicRow, customObjectRow, customCellRow] footerTitle:nil selection:nil];
    
    /*
        PROJECT
     */
    
    EKTableRow *projectRow = [EKTableRow rowWithTitle:@"Project Page"];
    [projectRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://electrickangaroo.github.com/Lightning-Table"]];
        [self clearSelectionAnimated:YES];
    }];
    
    /*
        ELECTRIC KANGAROO
     */
    
    EKTableRow *electricKangarooRow = [EKTableRow rowWithTitle:@"Electric Kangaroo"];
    [electricKangarooRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://electrickangaroo.com"]];
        [self clearSelectionAnimated:YES];
    }];
    
    EKTableSection *helpSection = [EKTableSection sectionWithHeaderTitle:@"More" rows:@[projectRow, electricKangarooRow] footerTitle:nil selection:nil];
    
    self.sections = @[demoSection, helpSection];
}

@end
