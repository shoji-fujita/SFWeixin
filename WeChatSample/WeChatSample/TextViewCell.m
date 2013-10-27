//
//  TextViewCell.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "TextViewCell.h"

@implementation TextViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        const CGFloat labelWidth = 90;
        
        CGFloat width = self.contentView.frame.size.width;
        CGFloat height = self.contentView.frame.size.height;
        
        _label = [[UILabel alloc] init];
        _label.frame = CGRectMake(0, 0, labelWidth, height);
        _label.textAlignment = NSTextAlignmentLeft;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor blackColor];
        _label.highlightedTextColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        _label.autoresizingMask =   UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleTopMargin |
                                    UIViewAutoresizingFlexibleBottomMargin;
        _label.lineBreakMode = NSLineBreakByCharWrapping;
        _label.numberOfLines = 0;
        [self.contentView addSubview:_label];
        _label.text = @"";
        
        _textView = [[UITextView alloc] init];
        _textView.frame = CGRectMake(labelWidth, 0, width - labelWidth, height);
        _textView.textAlignment = NSTextAlignmentLeft;
        _textView.backgroundColor = [UIColor clearColor];
        _textView.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        _textView.autoresizingMask =    UIViewAutoresizingFlexibleLeftMargin |
                                        UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleHeight;
        _textView.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:_textView];
        _textView.delegate = self;
        _textView.text = @"";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    _label.highlighted = selected;
    [_textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"])
    {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    [_delegate textViewDidEndEditing:self];
}

@end
