//
//  Weixin.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/06/08.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "Weixin.h"

#define APPID @"" // TODO:こことURLスキームに、登録したAppIDを書き込む


@implementation Weixin


+ (void)initialize
{
    [WXApi registerApp:APPID];
}

// to Weixin with Text
+ (void)sendText:(NSString *)text toWXScene:(enum WXScene)scene
{
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = YES;
    req.text = text;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

// to Weixin with Image
+ (void)sendImageData:(NSData *)imageData thumbImage:(UIImage *)thumbImage toWXScene:(enum WXScene)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:thumbImage]; // thumbnail
    
    WXImageObject *ext = [WXImageObject object];
    ext.imageData = imageData; // image
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

+ (void)sendImage:(UIImage *)image toWXScene:(enum WXScene)scene
{
    WXImageObject *ext = [WXImageObject object];
    NSData* imageData = [[NSData alloc] initWithData:UIImagePNGRepresentation( image )];
    ext.imageData = imageData; // image
    
    UIImage *thumbImage = image;
    
    if ([imageData length] > (32*1024)) { // 32KB以上ならthumbnail用に丸める
        CGFloat rate = 1 / sqrt([imageData length]/(32*1024)*(2/3));
        NSLog(@"rate - %f", rate);
        CGSize smallSize = CGSizeMake(image.size.width * rate, image.size.height * rate);
        
        UIGraphicsBeginImageContext(smallSize);
        [image drawInRect:CGRectMake(0, 0, smallSize.width, smallSize.height)];
        thumbImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:thumbImage]; // thumbnail
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

// to Weixin with Stamp
+ (void)sendStampData:(NSData *)stampData thumbImage:(UIImage *)thumbImage
{
    WXMediaMessage *message = [WXMediaMessage message];
    [message setThumbImage:thumbImage]; // thumbnail
    
    WXEmoticonObject *ext = [WXEmoticonObject object];
    ext.emoticonData = stampData; // stamp
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneSession; // 朋友圈へは送信できない
    
    [WXApi sendReq:req];
}

// to Weixin with News
+ (void)sendNewsTitle:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)thumbImage
                  url:(NSString *)url toWXScene:(enum WXScene)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXWebpageObject *ext = [WXWebpageObject object];
    ext.webpageUrl = url;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

// to Weixin with Video
+ (void)sendVideoTitle:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)thumbImage
                  url:(NSString *)url toWXScene:(enum WXScene)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl = url;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

// to Weixin with Music
+ (void)sendMusicTitle:(NSString *)title description:(NSString *)description thumbImage:(UIImage *)thumbImage
              musicUrl:(NSString *)musicUrl musicDataUrl:(NSString *)musicDataUrl toWXScene:(enum WXScene)scene
{
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = title;
    message.description = description;
    [message setThumbImage:thumbImage];
    
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = musicUrl;
    ext.musicDataUrl = musicDataUrl;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = scene;
    
    [WXApi sendReq:req];
}


@end

