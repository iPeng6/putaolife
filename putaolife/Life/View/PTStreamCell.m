//
//  PTStreamCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/20.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTStreamCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "PTStream.h"

#define kMargin 8.0f
@interface PTStreamCell()
@property(nonatomic,strong) UIImageView *imgView;
@property(nonatomic,strong) UILabel *lbTitle;
@property(nonatomic,strong) UILabel *lbDesc;
@property(nonatomic,strong) UILabel *lbPrice;
@property(nonatomic,strong) UILabel *lbProvider;
@end

@implementation PTStreamCell

-(UIImageView *)imgView{
    if (_imgView == nil) {
        _imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(kMargin);
            make.bottom.equalTo(self.contentView).offset(-kMargin);
            make.width.equalTo(@115);
        }];
    }
    return _imgView;
}

-(UILabel *)lbTitle{
    if (_lbTitle == nil) {
        _lbTitle = [UILabel new];
        [self.contentView addSubview:_lbTitle];
        
        [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView);
            make.left.equalTo(self.imgView.mas_right).offset(kMargin);
        }];
    }
    return _lbTitle;
}

-(UILabel *)lbDesc{
    if (_lbDesc == nil) {
        _lbDesc = [UILabel new];
        _lbDesc.font = [UIFont systemFontOfSize:13];
        _lbDesc.textColor = [UIColor darkGrayColor];
        [self.contentView addSubview:_lbDesc];
        
        [_lbDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.top.equalTo(self.lbTitle.mas_bottom).offset(kMargin);
        }];
    }
    return _lbDesc;
}

-(UILabel *)lbPrice{
    if (_lbPrice == nil) {
        _lbPrice = [UILabel new];
        _lbPrice.font = [UIFont systemFontOfSize:13];
        _lbPrice.textColor = [UIColor orangeColor];
        [self.contentView addSubview:_lbPrice];
        
        [_lbPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbDesc);
            make.bottom.equalTo(self.imgView);
        }];
    }
    return _lbPrice;
}

-(UILabel *)lbProvider{
    if (_lbProvider == nil) {
        _lbProvider = [UILabel new];
        [self.contentView addSubview:_lbProvider];
        _lbProvider.font = [UIFont systemFontOfSize:13];
        _lbProvider.textColor = [UIColor darkGrayColor];
        
        [_lbProvider mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbPrice.mas_right).offset(kMargin);
            make.bottom.equalTo(self.lbPrice);
        }];
    }
    return _lbProvider;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化
        
        
    }
    return self;
}

-(void)setStream:(PTStream *)stream{
    _stream = stream;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:stream.img_url]
                    placeholderImage:[UIImage imageNamed:@"putao_home_refresh"]];
    self.lbTitle.text = stream.title;
    self.lbDesc.text = stream.desc;
    self.lbPrice.text = [NSString stringWithFormat:@"￥%.1f",stream.price];
    NSString *prov = [stream.cpinfo.provider stringByReplacingOccurrencesOfString:@"来自 "  withString:@""];
    prov = [prov stringByAppendingString:@"提供"];
    self.lbProvider.text = prov;
}
@end
