//
//  SegmentCell.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "SegmentCell.h"

@implementation SegmentCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        CGFloat width = self.contentView.frame.size.width;
        CGFloat height = self.contentView.frame.size.height;
        
        NSArray *array = [NSArray arrayWithObjects:@"会话", @"朋友圈", nil];
        _segment = [[UISegmentedControl alloc] initWithItems:array];
        _segment.center = CGPointMake(width/2, height/2);
        _segment.segmentedControlStyle = UISegmentedControlStylePlain;
        _segment.selectedSegmentIndex = 0;
        _segment.backgroundColor = [UIColor clearColor];
        _segment.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin |
                                    UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleBottomMargin;
        [_segment addTarget:self action:@selector(segmentValueChange:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_segment];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)segmentValueChange:(id)sender
{
    [_delegate segmentValueChange:self];
}

@end
