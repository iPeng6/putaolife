//
//  NetworkTool.h
//  02.封装网络框架OC
//
//  Created by 玉良彭 on 15/10/16.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFHTTPSessionManager.h>

typedef enum : NSUInteger {
    NetworkToolMethodGet,
    NetworkToolMethodPost,
} NetworkToolMethod;

@protocol NetworkToolProtocol <NSObject>

@optional
- (NSURLSessionDataTask *)dataTaskWithHTTPMethod:(NSString *)method
                                       URLString:(NSString *)URLString
                                      parameters:(id)parameters
                                         success:(void (^)(NSURLSessionDataTask *, id))success
                                         failure:(void (^)(NSURLSessionDataTask *, NSError *))failure;

@end
@interface NetworkTool : AFHTTPSessionManager
+(instancetype) sharedTool;
-(void) request:(NetworkToolMethod)method url:(NSString *)urlStr parameters:(NSDictionary *)dict finished:(void(^)(id data, NSError *error))finished;
@end
