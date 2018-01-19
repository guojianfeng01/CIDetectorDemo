//
//  PersonCollectionViewCell.m
//  RichCoffee
//
//  Created by guojianfeng on 2017/12/21.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

#import "PersonCollectionViewCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface PersonCollectionViewCell()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation PersonCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeConstraints];
    }
    return self;
}

- (void)updateCellWithImage:(UIImage *)image{
    [self.imageView setImage:image];
}
- (void)makeConstraints{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

#pragma mark - get
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
@end
