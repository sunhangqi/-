//
//  HQTableViewCell.m
//  自定义等高cell
//
//  Created by Macbook on 2017/4/30.
//  Copyright © 2017年 Macbook. All rights reserved.
//

#import "HQTableViewCell.h"
#import "HQDeal.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface HQTableViewCell ()
@property (weak, nonatomic)  UIImageView *iconView;
@property (weak, nonatomic)  UILabel *titleLabel;
@property (weak, nonatomic)  UILabel *priceLabel;
@property (weak, nonatomic)  UILabel *buyCountLabel;

@end

@implementation HQTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cell";
    HQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HQTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

//1.在initWithFrame：方法中添加子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat margin = 10;
        UIImageView *iconView = [[UIImageView alloc ] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        [iconView makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(100);
            make.left.top.equalTo(self.contentView).offset(margin);
            make.bottom.offset(-margin);
        }];
        
        UILabel *titleLabel = [[UILabel alloc ] init];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
//
//        UILabel *priceLabel = [[UILabel alloc ] init];
//        [self.contentView addSubview:priceLabel];
//        self.priceLabel = priceLabel;
//        
//        UILabel *buyCountLabel = [[UILabel alloc ] init];
//        buyCountLabel.textAlignment = NSTextAlignmentRight;
//        buyCountLabel.font = [UIFont systemFontOfSize:14];
//        [self.contentView addSubview:buyCountLabel];
//        self.buyCountLabel = buyCountLabel;
    }
    return self;
}
//2.在layoutSubviews方法中设置控件的frame

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat contentH = self.contentView.frame.size.height;
    CGFloat contentW = self.contentView.frame.size.width;
    CGFloat margin = 10;
    
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconW = 100;
    CGFloat iconH = self.contentView.frame.size.height - 2 * iconY;
    self.iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    //titlabel
    CGFloat titleX = CGRectGetMaxX(self.iconView.frame)  + 10;
    CGFloat titleY = iconY;
    CGFloat titleW = contentW - titleX - 10;
    CGFloat titleH = 21;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleW, titleH);
    
    CGFloat priceX = titleX;
    CGFloat priceH = 21;
    CGFloat priceY = contentH - 10 - priceH;
    CGFloat priceW = 70;
    
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceW, priceH);
    
    CGFloat buyCountH = priceH;
    CGFloat buyCountY = priceY;
    CGFloat buyCountX = CGRectGetMaxX(self.priceLabel.frame) + margin;
    CGFloat buyCountW = contentW - buyCountX - margin;
    
    self.buyCountLabel.frame = CGRectMake(buyCountX, buyCountY, buyCountW, buyCountH);
    
    
    
    
}
//3.重写模型的set方法

- (void)setDeal:(HQDeal *)deal {
    _deal = deal;
    
    //设置数据
    self.iconView.image = [UIImage imageNamed:deal.icon];
    self.titleLabel.text = deal.title;
    self.priceLabel.text = deal.price;
    self.buyCountLabel.text = deal.buyCount;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
