//
//  PTServiceCollectionCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTServiceCollectionCell.h"
#import "PTService.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

@interface PTServiceCollectionCell()
@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) UILabel *lbName;
@end

@implementation PTServiceCollectionCell

-(UIImageView *)imgView{
    if (_imgView==nil) {
        _imgView=[[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        _lbName=[[UILabel alloc] init];
        [self.contentView addSubview:_lbName];
        _lbName.textAlignment=NSTextAlignmentCenter;
        _lbName.font=[UIFont systemFontOfSize:13];
        _lbName.textColor=RGB(51, 51, 51);
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@10);
            make.centerX.equalTo(self.contentView);
            make.width.height.equalTo(@48);
        }];
        
        [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_imgView.mas_bottom).offset(5);
            make.centerX.equalTo(self.contentView);
            
        }];
    }
    return _imgView;
}

-(void)setService:(PTService *)service{
    _service=service;
    //http:\/\/img.putao.so\/putao_icon_quick_wmdc.png
    //putao_icon_quick_hcp

    if ([service.icon_url containsString:@"http://"]) {
        [self.imgView sd_setImageWithURL:[NSURL URLWithString:service.icon_url]];
    }else{
        self.imgView.image=[UIImage imageNamed:service.icon_url];
    }
    self.lbName.text=service.name;
}

@end
