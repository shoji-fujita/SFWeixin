//
//  ImageViewCell.m
//  test2
//
//  Created by SHOJI FUJITA on 2013/07/10.
//  Copyright (c) 2013年 藤田 勝司. All rights reserved.
//

#import "ImageViewCell.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UIImage+GIF.h"

@implementation ImageViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        const CGFloat labelWidth = 50;
        
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
        
        _photo = [[UIImageView alloc] init];
        _photo.frame = CGRectMake(labelWidth, 0, width - labelWidth, height);
        _photo.backgroundColor = [UIColor clearColor];
        _photo.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        _photo.contentMode = UIViewContentModeScaleAspectFit;
        _photo.autoresizingMask =   UIViewAutoresizingFlexibleLeftMargin |
                                    UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleHeight;        
        [self.contentView addSubview:_photo];
        
        _data = [[NSData alloc] init];
        _type = kImageOrigin;
        
        UITapGestureRecognizer *tapGesture =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_viewTapped:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    _label.highlighted = selected;
}

- (void)_viewTapped:(UITapGestureRecognizer *)sender
{
    self.selected = YES;
    
    UIImagePickerController *ipc = [[[UIImagePickerController alloc] init] autorelease];
    ipc.delegate = self;

    switch (_type) {
        case kImageOrigin:
        case kImageStamp:
        case kThumbRect:
            ipc.allowsEditing = NO;
            break;
        case kThumbSquare:
            ipc.allowsEditing = YES;
            break;
    }
    
    [(UIViewController*)_delegate presentViewController:ipc animated:YES completion:nil];
}

#pragma mark - UIImagePickerDelegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [(UIViewController*)_delegate dismissViewControllerAnimated:YES completion:nil];
    [self setSelected:NO animated:YES];
    
    switch (_type) {
        case kImageOrigin:
        {
            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
            _photo.image = image;
            _data = [NSData dataWithData:UIImagePNGRepresentation(image)];
            
            NSLog(@"%@", NSStringFromCGSize(_photo.image.size));
            [_delegate imageSet:self];
        }
            break;
        case kImageStamp:
        {
            NSURL *assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
            [self stampURL:assetURL];
        }
            break;
        case kThumbRect:
        {
            UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
            
            // 高さを 120 にリサイズ
            UIImage *resizedImage;
            CGFloat height = 120;
            CGFloat ratio = height / image.size.height;
            CGFloat width = image.size.width * ratio;
            
            UIGraphicsBeginImageContext(CGSizeMake(width, height));
            [image drawInRect:CGRectMake(0, 0, width, height)];
            resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            _photo.image = resizedImage;
            _data = [NSData dataWithData:UIImagePNGRepresentation(image)];
            
            NSLog(@"%@", NSStringFromCGSize(_photo.image.size));
            [_delegate imageSet:self];
        }
            break;
        case kThumbSquare:
        {
            UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
            
            // 120 * 120 にリサイズ
            UIImage *resizedImage;
            CGFloat width = 120;
            CGFloat height = 120;
            
            UIGraphicsBeginImageContext(CGSizeMake(width, height));
            [image drawInRect:CGRectMake(0, 0, width, height)];
            resizedImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            _photo.image = resizedImage;
            _data = nil;
            
            NSLog(@"%@", NSStringFromCGSize(_photo.image.size));
            [_delegate imageSet:self];
        }
            break;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [(UIViewController*)_delegate dismissViewControllerAnimated:YES completion:nil];
    [self setSelected:NO animated:YES];
}

#pragma mark - Asset -

- (void)stampURL:(NSURL*)assetURL
{
    ALAssetsLibrary *lib = [ALAssetsLibrary new];
    [lib assetForURL:assetURL
         resultBlock:^(ALAsset *asset){
             
             ALAssetRepresentation *representation = [asset defaultRepresentation];
             
             NSUInteger size = [representation size];
             uint8_t *buff = (uint8_t *)malloc(sizeof(uint8_t)*size);
             if(buff != nil){
                 NSError *error = nil;
                 NSUInteger bytesRead = [representation getBytes:buff fromOffset:0 length:size error:&error];
                 
                 if (bytesRead && !error) {
                     
                     // Exif情報つきのNSDataを生成する
                     _data = [NSData dataWithBytesNoCopy:buff length:bytesRead freeWhenDone:YES];
                     
                     // gifアニメを表示する
                     _photo.image = [UIImage animatedGIFWithData:_data];
                     
                     // dataをセットする
                     NSLog(@"%@", NSStringFromCGSize(_photo.image.size));
                     [_delegate imageSet:self];
                 }
                 if (error) {
                     NSLog(@"error:%@", error);
                     free(buff);
                 }
             }
         }
        failureBlock:^(NSError *error){
            NSLog(@"error:%@", error);
        }];
}

@end


