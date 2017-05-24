//
//  UIButton+touch.h
//  xianshan
//
//  Created by 罗展 on 2016/11/25.
//  Copyright © 2016年 cass. All rights reserved.
//  防止按钮连点

#import <UIKit/UIKit.h>

//默认时间间隔
#define defaultInterval 1

@interface UIButton (touch)

@property (nonatomic, assign) NSTimeInterval timeInterval;

- (void) YstSetImageWithUrl:(NSString *) url;

@end


