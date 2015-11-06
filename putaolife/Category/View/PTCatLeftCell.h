//
//  PTCatLeftCell.h
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTBaseTableCell.h"
@class PTNav;
@interface PTCatLeftCell : UITableViewCell

@property(nonatomic,strong) PTNav *nav;

+(instancetype)cell:(UITableView *)tableView;

@end
