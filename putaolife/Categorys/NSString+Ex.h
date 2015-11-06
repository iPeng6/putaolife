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
