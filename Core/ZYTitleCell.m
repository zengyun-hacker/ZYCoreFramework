//
//  ZYTitleCell.m
//  Pods
//
//  Created by dreamer on 15/10/5.
//
//

#import <Masonry/View+MASAdditions.h>
#import "ZYTitleCell.h"

@interface ZYTitleCell ()

@property (nonatomic) UILabel *titleLabel;

@end

@implementation ZYTitleCell

- (void)setupUI {
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    self.titleLabel.text = [self.data valueForKey:@"title"];
    self.titleLabel.font = [UIFont systemFontOfSize:14.];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(@15);
        make.centerY.equalTo(self.contentView);
    }];
}

+ (CGFloat)cellHeight {
    return 50;
}

- (void)updateUI {
    [super updateUI];
    //获取名为title的值
    if ([self.data valueForKey:@"title"]) {
        self.titleLabel.text = [self.data valueForKey:@"title"];
    }
}


@end
