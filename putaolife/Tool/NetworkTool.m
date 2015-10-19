//
//  NetworkTool.m
//  02.封装网络框架OC
//
//  Created by 玉良彭 on 15/10/16.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "NetworkTool.h"

@interface NetworkTool()<NetworkToolProtocol>

@end
@implementation NetworkTool

+(instancetype) sharedTool{
    static NetworkTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    });
    return instance;
}

-(void) request:(NetworkToolMethod)method url:(NSString *)urlStr parameters:(NSDictionary *)dict finished:(void(^)(id data, NSError *error))finished{
    
    /* AFN未公开的方法，通过协议将其声明出来调用
     - (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
     URLString:(NSString *)URLString
     parameters:(id)parameters
     success:(void (^)(NSURLSessionDataTask *, id))success
     failure:(void (^)(NSURLSessionDataTask *, NSError *))failure
     */
    NSString *methodType = method==NetworkToolMethodGet?@"GET":@"POST";
    
    [[self dataTaskWithHTTPMethod:methodType URLString:urlStr parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
        finished(responseObject,nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error:%@",error);
        finished(nil,error);
    }] resume];
}
@end
