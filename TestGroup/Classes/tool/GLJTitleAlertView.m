//
//  GLJTitleAlertView.m
//  GLJHelpClass
//
//  Created by Daniel on 15/9/28.
//  Copyright (c) 2015年 taoqi. All rights reserved.
//

#import "GLJTitleAlertView.h"
//#import "AppDelegate.h"

//屏幕高度
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
//屏幕宽度
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
//根据屏幕计算高度
#define GLJCalculateWithHeight(height) ((ScreenHeight) > 568 ? ScreenWidth*(height)/720.0 : (height)/2.0)
//计算字体大小
#define GLJFontWithSize(size) [UIFont systemFontOfSize:GLJCalculateWithHeight(size)]

@interface GLJTitleAlertView ()

@property (nonatomic, weak) UIView *superView;

@end

@implementation GLJTitleAlertView

-(instancetype)initWithAlerTitle:(NSString*)alerTitle
                    andSuperView:(UIView*)superView{
    
    if (self = [super init]) {
        _alerTitle = alerTitle;
        self.text = alerTitle;
        _superView = superView;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = [UIColor whiteColor];
        self.font = GLJFontWithSize(26);
        self.backgroundColor = [[UIColor alloc] initWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    }
    return self;
}

-(void)show{
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
    self.alpha = 1;
    [_superView addSubview:self];
    NSLayoutConstraint *selfBottomConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeBottom multiplier:1 constant:-55];
    NSLayoutConstraint *selfHeightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:40];
    NSLayoutConstraint *selfCenterXContraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:_superView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    CGRect bounds = [_alerTitle boundingRectWithSize:CGSizeMake(ScreenWidth - GLJCalculateWithHeight(120), 9999) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:GLJCalculateWithHeight(26)]} context:nil];
    NSLayoutConstraint *selfWidthContraint;
    if (bounds.size.width > GLJCalculateWithHeight(300)) {
        selfWidthContraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:bounds.size.width + GLJCalculateWithHeight(60)];
    }else{
        
        CGFloat width = GLJCalculateWithHeight(300);
        if (GLJCalculateWithHeight(300) - bounds.size.width < GLJCalculateWithHeight(60)) {
            width = bounds.size.width + GLJCalculateWithHeight(60);
        }
        selfWidthContraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:width];
    }
    [_superView addConstraints:@[selfBottomConstraint, selfCenterXContraint, selfHeightConstraint, selfWidthContraint]];

    [UIView animateWithDuration:0.25 delay:1.75 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

+(void)showAlertTitleViewWith:(NSString*)alerTitle WithSuperView:(UIView *)view{
    
    GLJTitleAlertView *alertView = [[GLJTitleAlertView alloc] initWithAlerTitle:alerTitle andSuperView:view];
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[self class]]) {
            if ([alerTitle isEqualToString:[(GLJTitleAlertView*)v alerTitle]] ) {
                return;
            }
        }
    }
    [alertView show];
    
}

+(void)showAlertTitleViewWith:(NSString *)alerTitle{
    
    [self showAlertTitleViewWith:alerTitle WithSuperView:[UIApplication sharedApplication].keyWindow];
    
}


@end



