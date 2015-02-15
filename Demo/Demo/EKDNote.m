//
//  EKDNote.m
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import "EKDNote.h"

@implementation EKDNote

+ (instancetype)noteWithText:(NSString *)text
{
    EKDNote *note = [EKDNote new];
    note.text = text;
    note.date = [NSDate date];
    
    return note;
}

#pragma mark - Row protocol 

- (NSString *)rowTitle
{
    return self.text;
}

- (NSString *)rowSubtitle
{
    return self.date.description;
}

@end
