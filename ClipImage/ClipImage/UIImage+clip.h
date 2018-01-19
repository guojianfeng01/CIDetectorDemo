//
//  UIImage+clip.h
//  FFmpeg
//
//  Created by guojianfeng on 2017/12/20.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (clip)
-(UIImage*)getSubImage:(CGRect)rect;
- (UIImage *)getGrayImage;
- (UIImage *)covertToGrayScale;
- (UIImage*)imageCompressWithscaledToSize:(CGSize)size;
@end
