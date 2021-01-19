//
//  KKChatExpressionView.m
//  KKChat
//
//  Created by KK on 2021/1/19.
//

#import "KKChatExpressionView.h"
NSString * const KKChatExpressionCellID = @"KKChatExpressionCellID";
@interface KKChatExpressionView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *expressionCollectionView;
@property (nonatomic, strong) NSMutableArray < NSMutableArray<KKChatExpressionModel *> *> *dataArray;

@end
@implementation KKChatExpressionView



- (void)layoutIfNeeded {
    [self.expressionCollectionView reloadData];
}


#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource -
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataArray.count;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKChatExpressionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KKChatExpressionCellID forIndexPath:indexPath];
    cell.expressionModel = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}
#pragma mark - Getter -
- (UICollectionView *)expressionCollectionView {
    if (!_expressionCollectionView ) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenWidth/8, kScreenWidth/8);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _expressionCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _expressionCollectionView.dataSource = self;
        _expressionCollectionView.delegate = self;
        _expressionCollectionView.backgroundColor = UIColor.whiteColor;
        [_expressionCollectionView registerClass:[KKChatExpressionCell class] forCellWithReuseIdentifier:KKChatExpressionCellID];
        [self addSubview:_expressionCollectionView];
        [_expressionCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(self);
        }];
    }
    return _expressionCollectionView;
}
- (NSMutableArray<NSMutableArray <KKChatExpressionModel *> *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        NSString *Path =[[NSBundle mainBundle] pathForResource:@"emoji.plist" ofType:nil];
        NSArray * array = [NSArray arrayWithContentsOfFile:Path];
        NSMutableArray *sections = [KKChatExpressionModel mj_objectArrayWithKeyValuesArray:array];
        [_dataArray addObject:sections];
    }
    return _dataArray;
}
@end


@implementation KKChatExpressionCell

- (void)setExpressionModel:(KKChatExpressionModel *)expressionModel {
    self.picImageView.image = [UIImage imageNamed:expressionModel.face_name];
}

- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_picImageView];
        [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.mas_equalTo(30);
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
        }];
    }
    return _picImageView;
}


@end

@implementation KKChatExpressionModel



@end
