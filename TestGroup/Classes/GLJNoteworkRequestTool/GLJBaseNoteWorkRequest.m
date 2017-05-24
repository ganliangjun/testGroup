//
//  GLJBaseNoteWorkRequest.m
//  GLJNoteWork
//
//  Created by JunLiang Gan on 2017/4/26.
//  Copyright © 2017年 JunLiang Gan. All rights reserved.
//

#import "GLJBaseNoteWorkRequest.h"
#import <objc/runtime.h>
#import "AFNetworking.h"

@interface GLJBaseNoteWorkRequest ()

@property (strong, nonatomic) NSDictionary *parms;
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

@implementation GLJBaseNoteWorkRequest

-(NSDictionary*)parms{
    
    NSMutableDictionary *tempParms = [NSMutableDictionary dictionary];
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        if ([propertyName isEqualToString:@"ApiString"]) {
            continue;
        }
        if ([self valueForKey:propertyName]) {
            tempParms[propertyName] = [self valueForKey:propertyName];

        }
    }
    return [tempParms copy];
    
}

-(AFURLSessionManager*)manager{
    if (!_manager) {
       _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

-(void)postRequestWithBackDataBlack:(BackDataBlack) backDataBlack{
    
    self.backDataBlack = backDataBlack;
    __weak typeof(self) weakSelf = self;
    
    [self.manager POST:self.ApiString parameters:self.parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([(NSHTTPURLResponse*)task.response statusCode] == 200) {
            weakSelf.backDataBlack(task, responseObject, YES);
            [self success];
        }else{
            weakSelf.backDataBlack(task, task.error, NO);
            [self failure];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        weakSelf.backDataBlack(task, error, NO);
        [self noNetWork];
        
    }];
    
}


-(void)getRequestWithBackDataBlack:(BackDataBlack) backDataBlack{
    
    self.backDataBlack = backDataBlack;
    __weak typeof(self) weakSelf = self;
    [self.manager GET:self.ApiString parameters:self.parms progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([(NSHTTPURLResponse*)task.response statusCode] == 200) {
            weakSelf.backDataBlack(task, responseObject, YES);
            [self success];
        }else{
            weakSelf.backDataBlack(task, task.error, NO);
            [self failure];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        weakSelf.backDataBlack(task, error, NO);
        [self noNetWork];
        
    }];

}

-(void)upDateImageRequestWithImageArray:(NSDictionary*) imageDic imageName:(NSString *) imageName BackDataBlack:(BackDataBlack) backDataBlack{
    
    self.backDataBlack = backDataBlack;
    __weak typeof(self) weakSelf = self;
    [self.manager POST:self.ApiString parameters:self.parms constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSArray *allKey = [imageDic allKeys];
        for (id obj in allKey) {
            NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyyMMddHHmmssSSS";
            NSString *fileName = [NSString stringWithFormat:@"%@.jpg", [dateFormatter stringFromDate:[NSDate date]]];
            //UIImage
            NSData *idCardImagedata1 = UIImageJPEGRepresentation(imageDic[obj], 1.0);
            NSData *idCardImagedata;
            if (idCardImagedata1.length/1024.0 > 800) {
                idCardImagedata = UIImageJPEGRepresentation(imageDic[obj], 0.1);
            }else{
                idCardImagedata = UIImageJPEGRepresentation(imageDic[obj], 1.0);
            }
            [formData appendPartWithFileData:idCardImagedata name:imageName?imageName : obj fileName:fileName mimeType:@"image/png"];
        }
        
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([(NSHTTPURLResponse*)task.response statusCode] == 200) {
            weakSelf.backDataBlack(task, responseObject, YES);
            [self success];
        }else{
            weakSelf.backDataBlack(task, task.error, NO);
            [self failure];
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        weakSelf.backDataBlack(task, error, NO);
        [self noNetWork];
        
    }];
    
}

-(void)success{}
-(void)noNetWork{}
-(void)failure{}

@end
