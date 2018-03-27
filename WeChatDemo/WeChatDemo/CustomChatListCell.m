//
// Created by 侯凌霄 on 2018/3/27.
// Copyright (c) 2018 hou.ssdut. All rights reserved.
//

#import "CustomChatListCell.h"


@implementation CustomChatListCell {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self) {
        CGFloat cellHeight = 80;

        CGFloat imageViewWidth = 64;
        CGFloat imageViewHeight = 64;

        self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(4, (cellHeight - imageViewHeight) / 2, imageViewWidth, imageViewHeight)];

        [self addSubview:self.imageView1];


        CGFloat nameWidth = 120;
        CGFloat nameHeight = 21;
        CGFloat nameLeftView = 4 + imageViewWidth;
        self.name = [[UILabel alloc] initWithFrame:CGRectMake(nameLeftView, (cellHeight - nameHeight) / 4, nameWidth, nameHeight)];
        self.name.font = [UIFont systemFontOfSize:20];

        [self addSubview:self.name];

        CGFloat contentWidth = 120;
        CGFloat contentHeight = 16;
        CGFloat contentLeftView = 4 + imageViewWidth;
        self.content = [[UILabel alloc] initWithFrame:CGRectMake(contentLeftView, (cellHeight - nameHeight) / 4 * 3, contentWidth, contentHeight)];
        self.content.textColor = [UIColor grayColor];
        self.content.font = [UIFont systemFontOfSize:16];

        [self addSubview:self.content];
    }
    return self;
}

@end