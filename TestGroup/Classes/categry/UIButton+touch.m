//
//  UIButton+touch.m
//  xianshan
//
//  Created by 罗展 on 2016/11/25.
//  Copyright © 2016年 cass. All rights reserved.
//

#import "UIButton+touch.h"
#import <objc/runtime.h>

@interface UIButton ()
//yes 不允许点击  no 允许点击
@property (nonatomic, assign) BOOL isIgnoreEvent;

@end

@implementation UIButton (touch)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selA = @selector(sendAction:to:forEvent:);
        SEL selB = @selector(mySendAction:to:forEvent:);
        
        Method methodA = class_getInstanceMethod(self, selA);
        Method methodB = class_getInstanceMethod(self, selB);
        
        
        //将methodB的实现 添加到系统方法中 将methodA方法指针添加成methodB的
        BOOL isAdd = class_addMethod(self, selA, method_getImplementation(methodB), method_getTypeEncoding(methodB));
        //添加成功了,说明本类中不存在methodB所以必须将方法B的实现指针换成A
        if (isAdd) {
            class_replaceMethod(self, selB, method_getImplementation(methodA), method_getTypeEncoding(methodA));
        } else {
            method_exchangeImplementations(methodA, methodB);
        }
    });
}

- (NSTimeInterval)timeInterval {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setTimeInterval:(NSTimeInterval)timeInterval {
    //添加属性
    objc_setAssociatedObject(self, @selector(timeInterval), @(timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)mySendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.timeInterval = self.timeInterval == 0 ? defaultInterval: self.timeInterval;
        
        if (self.isIgnoreEvent) {
            return;
        } else if (self.timeInterval > 0) {
            self.isIgnoreEvent = YES;
            [self performSelector:@selector(resetState) withObject:nil afterDelay:self.timeInterval];
        }
    }
    [self mySendAction:action to:target forEvent:event];
}

//动态绑定属性
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent {
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent {
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)resetState {
    [self setIsIgnoreEvent:NO];
}

/**设置button的背景图*/
- (void)YstSetImageWithUrl:(NSString *)urlStr{
    if (urlStr == nil) {
        [self setImage:[[UIImage imageNamed:@"touxiang_hj"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    }else{
        NSURL * url = [NSURL URLWithString:urlStr];
        // 根据图片的url下载图片数据
        dispatch_queue_t stQueue = dispatch_queue_create("loadImage", NULL); // 创建GCD线程队列
        dispatch_async(stQueue, ^{
            // 异步下载图片
            UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
            // 主线程刷新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setImage:img forState:UIControlStateNormal];
            });
        });
    }
}

@end
