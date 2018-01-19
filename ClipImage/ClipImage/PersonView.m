//
//  PersonView.m
//  RichCoffee
//
//  Created by guojianfeng on 2017/12/21.
//  Copyright © 2017年 guojianfeng. All rights reserved.
//

#import "PersonView.h"
#import "PersonCollectionViewCell.h"
#import <Masonry/Masonry.h>

NSString *const kCellId = @"personCollectionViewCell";
@interface PersonView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation PersonView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self makeConstraints];
    }
    return self;
}
- (void)makeConstraints{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)layoutSubviews{
    
}

- (void)updateUIWithArrary:(NSMutableArray *)array{
    self.dataSource = [NSMutableArray arrayWithArray:array];
    [self.collectionView reloadData];
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (PersonCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PersonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCellId forIndexPath:indexPath];
    [cell updateCellWithImage:self.dataSource[indexPath.row]];
    return cell;
}



#pragma mark - get
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 2;
        layout.itemSize = CGSizeMake(130, 130);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor greenColor];
        [_collectionView registerClass:[PersonCollectionViewCell class] forCellWithReuseIdentifier:kCellId];
        
        [self addSubview:_collectionView];
    }
    return _collectionView;
}

@end
