//
//  UIColor+Util.m
//  MyLimitFree
//
//  Created by 罗展 on 16/2/15.
//  Copyright (c) 2016年 mobiletrain. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (instancetype) colorWithHexValue:(NSUInteger) hexValue {
    return [self colorWithHexValue:hexValue alpha:1];
}

+ (instancetype) colorWithHexValue:(NSUInteger) hexValue alpha:(CGFloat) alpha {
    //NSString *str = [NSString stringWithFormat:@"%lu",hexValue];
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16) / 255.0 green:((hexValue & 0xFF00) >> 8) / 255.0 blue:(hexValue & 0xFF) / 255.0 alpha:alpha];
}
+(UIColor *)defaultColor{
    return [UIColor colorWithHexValue:0xf23023];
}
+ (UIColor *)lineColor{
    return [UIColor colorWithHexValue:0xEBEBED];
}
@end
