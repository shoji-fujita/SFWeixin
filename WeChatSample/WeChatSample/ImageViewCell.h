//
//  ImageViewCell.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ImageViewCellDelegate;

enum {
    kImageOrigin,
	kImageStamp,
    kThumbRect,
	kThumbSquare
};

@interface ImageViewCell : UITableViewCell <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, retain) UILabel*      label;
@property (nonatomic, retain) UIImageView*  photo;
@property (nonatomic, retain) NSData*       data;
@property (nonatomic, assign) NSInteger     type;
@property (nonatomic, assign) id<ImageViewCellDelegate> delegate;

@end

@protocol ImageViewCellDelegate <NSObject>

- (void)imageSet:(ImageViewCell*)imageViewCell;

@end
