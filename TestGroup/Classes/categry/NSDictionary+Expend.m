//
//  NSDictionary+Expend.m
//  GLJNoteWork
//
//  Created by JunLiang Gan on 2017/5/2.
//  Copyright © 2017年 JunLiang Gan. All rights reserved.
//

#import "NSDictionary+Expend.h"

@implementation NSDictionary (Expend)

//处理数据为空
-(NSDictionary*)solveDictionaryNull{
    
    NSMutableDictionary *tempDictionary = [self mutableCopy];
    NSArray *keys = [tempDictionary allKeys];
    for (id obj in keys) {
        if ([tempDictionary[obj] isKindOfClass:[NSString class]]) {
            //是字符串
            tempDictionary[obj] = tempDictionary[obj];
        }else if ([tempDictionary[obj] isKindOfClass:[NSArray class]]) {
            //是数组
            tempDictionary[obj] = [self solveArrayNullWithSolvingArray:(NSArray*)tempDictionary[obj]];
        }else if ([tempDictionary[obj] isKindOfClass:[NSDictionary class]]) {
            //是字典
            tempDictionary[obj] = [(NSDictionary*)tempDictionary[obj] solveDictionaryNull];
        }else if ([tempDictionary[obj] isKindOfClass:[NSNumber class]]) {
            //是数字
            tempDictionary[obj] = tempDictionary[obj];
        }else if ([tempDictionary[obj] isKindOfClass:[NSNull class]]) {
            //是空
            tempDictionary[obj] = @"";
        }else if (!tempDictionary[obj]) {
            //没有值
            tempDictionary[obj] = @"";
        }
    }
    return [tempDictionary copy];
    
}

-(NSArray*)solveArrayNullWithSolvingArray:(NSArray *) needSolvingArray{
    
    NSMutableArray *tempArray = [needSolvingArray mutableCopy];
    for (int i = 0; i < tempArray.count; i ++ ) {
        id obj = tempArray[i];
        if ([obj isKindOfClass:[NSString class]]) {
            //是字符串
            tempArray[i] = obj;
        }else if ([obj isKindOfClass:[NSArray class]]) {
            //是数组
            tempArray[i] = [self solveArrayNullWithSolvingArray:(NSArray*)obj];
        }else if ([obj isKindOfClass:[NSDictionary class]]) {
            //是字典
            tempArray[i] = [(NSDictionary*)obj solveDictionaryNull];
        }else if ([obj isKindOfClass:[NSNumber class]]) {
            //是数字
            tempArray[i] = obj;
        }else if ([obj isKindOfClass:[NSNull class]]) {
            //是空
            tempArray[i] = @"";
        }else if (!obj[obj]) {
            //没有值
            tempArray[i] = @"";
        }
    }
    return [tempArray copy];

}


@end
