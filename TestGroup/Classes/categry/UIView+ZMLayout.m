//
//  UIView+ZMLayout.m
//  zhumengLifeBase
//
//  Created by Cass on 2017/5/10.
//  Copyright © 2017年 cass. All rights reserved.
//

#import "UIView+ZMLayout.h"

@implementation UIView (ZMLayout)


-(void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(void)setCenterY:(CGFloat)centerY {
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

-(CGFloat)centerY {
    return self.center.y;
}


-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setX:(CGFloat)x {
    CGRect temp = self.frame;
    temp.origin.x = x;
    self.frame = temp;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(void)setY:(CGFloat)y {
    CGRect temp = self.frame;
    temp.origin.y = y;
    self.frame = temp;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(void)setWidth:(CGFloat)width {
    CGRect temp = self.frame;
    temp.size.width = width;
    self.frame = temp;
}


-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setHeight:(CGFloat)height {
    CGRect temp = self.frame;
    temp.size.height = height;
    self.frame = temp;
}


@end
