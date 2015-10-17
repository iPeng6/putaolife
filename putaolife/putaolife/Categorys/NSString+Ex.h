//
//  NSString+Ex.h
//  01登陆界面
//
//  Created by 玉良彭 on 15/9/25.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ex)

/**base64编码*/
-(NSString *) encodeBase64;

/**base64解码*/
-(NSString *) decodeBase64;

/**获取缓存目录*/
- (instancetype)cachePath;

@end

@implementation NSString (Ex)

-(instancetype)encodeBase64{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:0];
}

-(instancetype)decodeBase64{
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:0] encoding:NSUTF8StringEncoding];
}

- (instancetype)cachePath
{
    NSString* cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [cachePath stringByAppendingPathComponent:[self lastPathComponent]];
}

@end
