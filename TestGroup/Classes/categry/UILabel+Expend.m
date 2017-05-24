//
//  UILabel+Expend.m
//  HaoMaMa
//
//  Created by John on 15/11/6.
//  Copyright (c) 2015年 taoqi. All rights reserved.
//

#import "UILabel+Expend.h"

@implementation UILabel (Expend)

-(CGFloat)heightLabel{
    
    CGRect frame =  [self textRectForBounds:CGRectMake(0, 0, self.frame.size.width, 9999) limitedToNumberOfLines:self.numberOfLines];
    
    return frame.size.height;
}


@end
