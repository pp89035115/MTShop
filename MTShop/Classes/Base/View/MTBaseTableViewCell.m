//
//  MTBaseTableViewCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTBaseTableViewCell.h"

@implementation MTBaseTableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellID = @"MTBaseTableViewCell";
    MTBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[MTBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }return cell;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupSubViews];
        self.detailTextLabel.textColor = [UIColor grayColor];
        self.detailTextLabel.textAlignment = NSTextAlignmentRight;
        self.detailTextLabel.numberOfLines = 0;
        
    }return self;
}

- (void)setupSubViews
{
    [self.contentView addSubview:self.childLabel];
}

+ (CGFloat)getCellHeight
{
    return gScreenHeight / 10;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat detail_w = (gScreenWidth - 20) / 2;
    self.detailTextLabel.frame = CGRectMake(gScreenWidth - detail_w - 30, 0, detail_w, self.height);
    self.textLabel.centerY = self.height / 2;
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
