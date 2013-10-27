//
//  ItemImage.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemImage : NSObject

@property (nonatomic, retain) NSData*       imageData;
@property (nonatomic, retain) UIImage*      thumbImage;
@property (nonatomic)         NSInteger     scene;

@end
