//
//  StampViewController.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewCell.h"

@class ItemStamp;

@interface StampViewController : UITableViewController <ImageViewCellDelegate>
{
    ItemStamp*  _itemStamp;
}

@end
