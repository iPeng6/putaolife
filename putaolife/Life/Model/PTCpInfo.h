//
//  PTCp_info.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/20.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTCpInfo : NSObject
/*
 {\"provider\":\"来自 初炼\",\"entry_url\":\"http:\/\/m.ledong100.com\/m\/coach\/getList?showwxpaytitle=1\"}
 */
@property(nonatomic,copy) NSString *provider;
@property(nonatomic,copy) NSString *entry_url;

+(instancetype) cpinfoWithDict:(NSDictionary *)dict;
@end
