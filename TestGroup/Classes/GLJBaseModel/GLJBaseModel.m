//
//  GLJBaseModel.m
//  GLJNoteWork
//
//  Created by JunLiang Gan on 2017/5/2.
//  Copyright © 2017年 JunLiang Gan. All rights reserved.
//

#import "GLJBaseModel.h"

@implementation GLJBaseModel

+(instancetype)parseModelWithDic:(NSDictionary*) modelDic{
    return [[self alloc] initWithDic:modelDic];
}

-(instancetype)initWithDic:(NSDictionary*) modelDic{
    
    if (self = [super init]) {
        [self valueWithModelDic:modelDic];
    }
    return self;
}

-(void)valueWithModelDic:(NSDictionary*) dic{
    
    NSArray *keys = [dic allKeys];
    for (id obj in keys) {
//        if ([dic[obj] isKindOfClass:[NSString class]]) {
//            //是字符串
//            [self setValue:dic[obj] forKey:obj];
//        }else if ([dic[obj] isKindOfClass:[NSArray class]]) {
//            //是数组
//            [self setValue:dic[obj] forKey:obj];
//        }else
//        if ([dic[obj] isKindOfClass:[NSDictionary class]]) {
//            //是字典
//            [self valueWithModelDic:(NSDictionary*)dic[obj]];
//        }else if ([dic[obj] isKindOfClass:[NSNumber class]]) {
//            //是数字
//            [self setValue:dic[obj] forKey:obj];
//        }else if ([dic[obj] isKindOfClass:[NSNull class]]) {
//        }else
//            //是空字符串
//            [self setValue:dic[obj] forKey:obj];
//        }
        if ([dic[obj] isKindOfClass:[NSDictionary class]]) {
            //是字典
            [self valueWithModelDic:(NSDictionary*)dic[obj]];
        }else{
            //是空字符串
            [self setValue:dic[obj] forKey:obj];
        }
    }
}


@end
