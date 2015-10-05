//
//  ZYCoreTableViewCell.m
//  Pods
//
//  Created by dreamer on 15/9/26.
//
//

#import "ZYCoreTableViewCell.h"

@implementation ZYCoreTableViewCell

- (void)setData:(id)data {
    _data = data;
    [self updateUI];
}

- (void)updateUI {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupUI];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {

}


@end
