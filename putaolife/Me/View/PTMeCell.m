//
//  PTMeCell.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/8.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTMeCell.h"

@implementation PTMeCell

+(instancetype)cell:(UITableView *)tableView{
    static NSString *reuseId = @"catLeftCell";
    PTMeCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[PTMeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
}

@end
