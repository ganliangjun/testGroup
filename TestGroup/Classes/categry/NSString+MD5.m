//
//  NSString+MD5.m
//  锦医卫（患）
//
//  Created by Daniel on 15/8/21.
//  Copyright (c) 2015年 0331 1031. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)

-(NSString *) md5HexDigest
{
    
    const char *original_str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(original_str, (unsigned int)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        
        [hash appendFormat:@"%02X", result[i]];
    
    return [hash lowercaseString];
    
}


+(BOOL)judgeLegalContentWithStr:(NSString *)string
{
    int i = 0;
    while (i<string.length) {
        NSString *substring = [string substringWithRange:NSMakeRange(i,1)];
        NSLog(@"%@",substring);
        if (![substring isEqualToString:@" "]) {
            return YES;
        }
        i++;
    }
    return NO;
    
}



@end
