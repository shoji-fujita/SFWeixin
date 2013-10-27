//
//  TextFieldCell.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldCellDelegate;

@interface TextFieldCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, retain) UILabel*      label;
@property (nonatomic, retain) UITextField*  textField;
@property (nonatomic, assign) id<TextFieldCellDelegate> delegate;

@end

@protocol TextFieldCellDelegate <NSObject>

- (void)textFieldDidEndEditing:(TextFieldCell*)textFieldCell;

@end
