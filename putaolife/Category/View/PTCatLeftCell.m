//
//  PTCatLeftCell.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCatLeftCell.h"
#import <Masonry.h>
#import "PTNav.h"

@interface PTCatLeftCell()

@end

@implementation PTCatLeftCell

-(void)setNav:(PTNav *)nav{
    _nav = nav;
    
    self.textLabel.text = nav.name;
    self.textLabel.textColor = [UIColor darkGrayColor];
}


+ (instancetype)cell:(UITableView *)tableView{
    static NSString *reuseId = @"catLeftCell";
    PTCatLeftCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[PTCatLeftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbg"]];
        imgView.frame = CGRectMake(0, 3, 5, 35);
        [view addSubview:imgView];
        cell.selectedBackgroundView = view;
        
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
    }
    
    return cell;
}

@end
