//
//  HQTableViewCell.h
//  自定义等高cell
//
//  Created by Macbook on 2017/4/30.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  HQDeal;

@interface HQTableViewCell : UITableViewCell

//建立团购模型
@property (nonatomic, strong) HQDeal *deal;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
