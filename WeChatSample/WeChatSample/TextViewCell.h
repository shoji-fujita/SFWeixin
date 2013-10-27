//
//  TextViewCell.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextViewCellDelegate;

@interface TextViewCell : UITableViewCell <UITextViewDelegate>

@property (nonatomic, retain) UILabel*      label;
@property (nonatomic, retain) UITextView*   textView;
@property (nonatomic, assign) id<TextViewCellDelegate> delegate;

@end

@protocol TextViewCellDelegate <NSObject>

- (void)textViewDidEndEditing:(TextViewCell*)textViewCell;

@end
