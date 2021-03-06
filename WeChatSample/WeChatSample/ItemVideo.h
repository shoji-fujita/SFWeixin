//
//  ItemVideo.h
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemVideo : NSObject

@property (nonatomic, retain) NSString*     title;
@property (nonatomic, retain) NSString*     description;
@property (nonatomic, retain) UIImage*      thumbImage;
@property (nonatomic, retain) NSString*     url;
@property (nonatomic)         NSInteger     scene;

@end
