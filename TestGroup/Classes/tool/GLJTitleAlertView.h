//
//  GLJTitleAlertView.h
//  GLJHelpClass
//
//  Created by Daniel on 15/9/28.
//  Copyright (c) 2015年 taoqi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GLJTitleAlertView : UILabel

@property (nonatomic, strong) NSString *alerTitle;

+(void)showAlertTitleViewWith:(NSString*)alerTitle WithSuperView:(UIView *)view;
+(void)showAlertTitleViewWith:(NSString*)alerTitle;

@end
