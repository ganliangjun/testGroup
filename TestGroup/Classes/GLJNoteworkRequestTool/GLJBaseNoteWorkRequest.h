//
//  GLJBaseNoteWorkRequest.h
//  GLJNoteWork
//
//  Created by JunLiang Gan on 2017/4/26.
//  Copyright © 2017年 JunLiang Gan. All rights reserved.
//


#import <Foundation/Foundation.h>

typedef void(^BackDataBlack)(NSURLSessionDataTask *task, id dateModel, BOOL isSuccess);

@interface GLJBaseNoteWorkRequest : NSObject

@property (nonatomic, copy) BackDataBlack backDataBlack;
@property (nonatomic, strong) NSString *ApiString;

-(void)postRequestWithBackDataBlack:(BackDataBlack) backDataBlack;
-(void)getRequestWithBackDataBlack:(BackDataBlack) backDataBlack;
//imageName  imageName为空时  使用的imageDic中的key为上传图片的字段
//imageName  imageName不为空时  使用的imageName为上传图片的字段
-(void)upDateImageRequestWithImageArray:(NSDictionary*) imageDic imageName:(NSString *) imageName BackDataBlack:(BackDataBlack) backDataBlack;

//子类重新
-(void)success;
-(void)noNetWork;
-(void)failure;


@end
