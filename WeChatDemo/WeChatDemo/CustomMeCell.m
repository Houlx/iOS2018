//
// Created by 侯凌霄 on 2018/3/27.
// Copyright (c) 2018 hou.ssdut. All rights reserved.
//

#import "CustomMeCell.h"


@implementation CustomMeCell {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        CGFloat cellHeight = 90;

        CGFloat iconWidth = 64;
        CGFloat iconHeight = 64;
        self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(6, (cellHeight - iconHeight) / 2, iconWidth, iconHeight)];
        [self addSubview:self.icon];

        CGFloat nameWidth = 300;
        CGFloat nameHeight = 21;
        CGFloat nameLeftView = 6 + iconWidth;
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(nameLeftView, (cellHeight - nameHeight) / 4, nameWidth, nameHeight)];
        self.name.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.name];

        CGFloat weChatIdWidth = 300;
        CGFloat weChatIdHeight = 16;
        CGFloat weChatIdLeftView = 6 + iconWidth;
        self.weChatId = [[UILabel alloc] initWithFrame:CGRectMake(weChatIdLeftView, (cellHeight - weChatIdHeight) / 4 * 3, weChatIdWidth, weChatIdHeight)];
        self.weChatId.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.weChatId];
    }
    return self;
}
@end