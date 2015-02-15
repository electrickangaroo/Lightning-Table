//
//  EKDNote.h
//  Demo
//
//  Created by Phillip Caudell on 16/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKDNote : NSObject <EKTableRowProtocol>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *date;

+ (instancetype)noteWithText:(NSString *)text;

@end
