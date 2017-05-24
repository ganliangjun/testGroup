//
//  NSString+MD5.h
//  锦医卫（患）
//
//  Created by Daniel on 15/8/21.
//  Copyright (c) 2015年 0331 1031. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

-(NSString *) md5HexDigest;

+(BOOL)judgeLegalContentWithStr:(NSString *)string;


@end
