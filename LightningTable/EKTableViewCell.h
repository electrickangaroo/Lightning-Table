//
//  EKTableViewCell.h
//  ⚡ Lightning Table
//
//  Created by Phillip Caudell on 14/08/2014.
//  Copyright (c) 2014 Electric Kangaroo. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 An enumeration for the various styles of cells.
 */
typedef NS_ENUM(NSInteger, EKTableViewCellStyle) {
    EKTableViewCellStyleDefault,
    EKTableViewCellStyleSettings,
    EKTableViewCellStyleContacts,
    EKTableViewCellStyleSubtitle
};

@interface EKTableViewCell : UITableViewCell

- (id)initWithStyle:(EKTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
