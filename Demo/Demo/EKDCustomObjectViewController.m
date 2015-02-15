//
//  EKDCustomObjectViewController.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDCustomObjectViewController.h"
#import "EKDNote.h"

@implementation EKDCustomObjectViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Notes";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(handleAddNote:)];
    
    // Setup an example default note
    EKDNote *defaultNote = [EKDNote noteWithText:@"I am a custom EKDNote object; but because I conform the row protocol I can be passed directly into a table-view. Neat."];
    self.notes = @[defaultNote];
    
    [self reload];
}

- (void)reload
{
    // The notes array contains EKDNote objects. This is a custom object completly seperate from Lightning Tables; but because it conforms to EKTableRowProtocol it can be displayed directly in the table-view. Think of it like the MKAnnotation protocol.
    EKTableSection *section = [EKTableSection sectionWithRows:self.notes];
    
    // As we've modified the sections, we'll need to reload the table view.
    [self setSections:@[section] reload:YES animated:YES];
}

- (void)addNote:(EKDNote *)note
{
    self.notes = [self.notes arrayByAddingObject:note];
    [self reload];
}

#pragma mark - Actions

- (void)handleAddNote:(id)sender
{
    // Display UI to take a note
    UIAlertView *noteView = [[UIAlertView alloc] initWithTitle:@"New Note" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    noteView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [noteView show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        
        UITextField *textField = [alertView textFieldAtIndex:0];
        EKDNote *note = [EKDNote noteWithText:textField.text];
        [self addNote:note];
    }
}

@end
