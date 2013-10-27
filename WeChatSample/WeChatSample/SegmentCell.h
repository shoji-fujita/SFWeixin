//
//  SegmentCell.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentCellDelegate;

@interface SegmentCell : UITableViewCell

@property (nonatomic, retain) UILabel*              label;
@property (nonatomic, retain) UISegmentedControl*   segment;
@property (nonatomic, assign) id<SegmentCellDelegate> delegate;

@end

@protocol SegmentCellDelegate <NSObject>

- (void)segmentValueChange:(SegmentCell*)segmentCell;

@end
