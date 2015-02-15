//
//  EKDBasicDemoViewController.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDBasicDemoViewController.h"

@implementation EKDBasicDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Basics";
    
    /*
     SIMPLE ROWS
     */
    
    // EKTableRow is a basic object that conforms to the EKTableRowProtocol. By default it comes with all the standard properties of a UITableViewCell.
    
    EKTableRow *row = [EKTableRow rowWithTitle:@"I am a simple row."];
    EKTableRow *row2 = [EKTableRow rowWithTitle:@"I am another row." subtitle:@"I have a subtitle. My text can span multiple lines as Lighting Table will automatically calculate the cell heights. Neat!" image:nil];
    EKTableRow *row3 = [EKTableRow rowWithTitle:@"I am the best row with a title, subtitle and image!" subtitle:@"Not only do I have a title and subtitle that spans multiple lines, but I also have an image. Check. Mate." image:[UIImage imageNamed:@"TableItem-Heart"]];
    
    // This is a section. It contains rows. Again EKTableSection is a basic object that conforms to the EKTableSection protocol.
    
    EKTableSection *basicSection = [EKTableSection sectionWithHeaderTitle:@"Basic Rows" rows:@[row, row2, row3] footerTitle:nil selection:nil];
    
    /*
     ROWS WITH SELECTION
     */
    
    // Rows have selection handlers. These are blocks that get executed when a user makes a selection in the table-view.
    // Rows with selection handlers automatically have the detail disclosure indicator added to them; though you can disable this if you want.
    
    EKTableRow *pushyRow = [EKTableRow rowWithTitle:@"I'm a pushy row"];
    [pushyRow setSelectionHandler:^(EKTableRowSelection *selection) {
        
        [self presentMessage:@"This message is from the row!"];
    }];
    
    // Sections can also have selection handlers. These will apply selection handlers to all rows in the section; unless the row has its own selection handler.
    
    EKTableRow *sectionPushyRow = [EKTableRow rowWithTitle:@"My parent is pushy"];
    EKTableRow *sectionPushyRow2 = [EKTableRow rowWithTitle:@"No way, mine too!"];
    
    EKTableSection *selectionSection = [EKTableSection sectionWithHeaderTitle:@"Selection" rows:@[pushyRow, sectionPushyRow, sectionPushyRow2] footerTitle:nil selection:^(EKTableRowSelection *selection) {
        
        [self presentMessage:@"This message is from the section!"];
    }];
    
    // Finally we set the sections of the table-view.
    self.sections = @[basicSection, selectionSection];
}

- (void)presentMessage:(NSString *)message
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"Wow!" otherButtonTitles:nil];
    [alertView show];
    [self clearSelectionAnimated:YES];
}

@end
