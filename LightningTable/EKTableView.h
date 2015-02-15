//
//  EKTableView.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, EKTableViewStyle) {
    EKTableViewStylePlain,
    EKTableViewStyleGrouped,
};

@interface EKTableView : UITableView

- (instancetype)initWithFrame:(CGRect)frame style:(EKTableViewStyle)style;

@end
