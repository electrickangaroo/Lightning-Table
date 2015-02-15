//
//  EKDCustomCellViewController.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDCustomCellViewController.h"
#import "EKDCustomSliderRow.h"

@implementation EKDCustomCellViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    EKTableRow *infoRow = [EKTableRow rowWithTitle:@"Below this cell, is a custom cell." subtitle:@"Custom cells have a row class (so it can be declared in the table-view model), and a cell class (what's rendered on screen)." image:nil];
 
    // This is a custom row. Inside this class it implements the EKTableRowProtocol which implements the rowCellClass method. This tells the table-view what cell class to initialise and render in the view.
    // In this demo we've made a specific EKDCustomSliderRow object - but this could be any object; most likely a model in your application. For example the EKDNote object could have a custom cell to display a tacky note background.
    EKDCustomSliderRow *sliderRow = [EKDCustomSliderRow new];
    EKTableSection *section = [EKTableSection sectionWithRows:@[infoRow, sliderRow]];
    
    self.sections = @[section];
}

@end
