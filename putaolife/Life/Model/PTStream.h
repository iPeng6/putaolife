//
//  PTStream.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/20.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTCpInfo.h"

@interface PTStream : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *img_url;
@property(nonatomic,assign)NSInteger sort;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,assign) CGFloat price;

@property(nonatomic,strong) PTCpInfo *cpinfo;

+(instancetype) streamWithDict:(NSDictionary *)dict;
@end
