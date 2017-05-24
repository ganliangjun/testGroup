//
//  UIImage+ZMImage.m
//  zhumengLifeBase
//
//  Created by Cass on 2017/5/10.
//  Copyright © 2017年 cass. All rights reserved.
//

#import "UIImage+ZMImage.h"

@implementation UIImage (ZMImage)

+ (UIImage *)originImageWithName: (NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)circleImage {
    CGSize size = self.size;
    CGFloat drawWH = size.width < size.height ? size.width : size.height;
    
    //开启上下文
    UIGraphicsBeginImageContext(CGSizeMake(drawWH, drawWH));
    //绘制一个圆形区域，裁剪
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect clipRect = CGRectMake(0, 0, drawWH, drawWH);
    CGContextAddEllipseInRect(context, clipRect);
    CGContextClip(context);
    
    //绘制大图片
    CGRect drawRect = CGRectMake(0, 0, size.width, size.height);
    [self drawInRect:drawRect];
    
    //取出图片
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return resultImage;
    
}

@end
