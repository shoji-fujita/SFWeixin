//
//  TextFieldCell.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "TextFieldCell.h"

@implementation TextFieldCell

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
        
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(labelWidth, 0, width - labelWidth, height);
        _textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _textField.textAlignment = NSTextAlignmentLeft;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        _textField.autoresizingMask =   UIViewAutoresizingFlexibleLeftMargin |
                                        UIViewAutoresizingFlexibleTopMargin |
                                        UIViewAutoresizingFlexibleBottomMargin;
        _textField.returnKeyType = UIReturnKeyDone;
        [self.contentView addSubview:_textField];
        _textField.delegate = self;
        _textField.text = @"";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    _label.highlighted = selected;
    [_textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_delegate textFieldDidEndEditing:self];
}

@end
