//
//  MusicViewController.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextFieldCell.h"
#import "TextViewCell.h"
#import "ImageViewCell.h"
#import "SegmentCell.h"

@class ItemMusic;

@interface MusicViewController : UITableViewController <TextFieldCellDelegate, TextViewCellDelegate, ImageViewCellDelegate, SegmentCellDelegate>
{
    ItemMusic*  _itemMusic;
}

@end
