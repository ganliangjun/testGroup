//
//  UIColor+Util.h
//  MyLimitFree
//
//  Created by 罗展 on 16/2/15.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//  

#import <UIKit/UIKit.h>

/**UIColor扩展*/
@interface UIColor (Util)

/**用16进制数指定颜色*/
+ (instancetype) colorWithHexValue:(NSUInteger) hexValue;
/**用16进制数和alpha通道指定颜色*/
+ (instancetype) colorWithHexValue:(NSUInteger) hexValue alpha:(CGFloat) alpha;
/**UI通用颜色值*/
+ (UIColor *) defaultColor;
/**分割线通用颜色*/
+ (UIColor *) lineColor;

@end
