//
//  KKChatMoreView.m
//  KKChat
//
//  Created by q.zhang on 2021/1/8.
//

#import "KKChatMoreView.h"
@class KKChatMoreViewCell;
static NSString * const KKChatMoreViewCellID = @"KKChatMoreViewCellID";
@interface KKChatMoreView ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSMutableArray<KKChatMoreViewCellModel *> *dataArray;
@property (nonatomic, assign) KKMessageType msgType;

@end
@implementation KKChatMoreView

- (instancetype)initWithFrame:(CGRect)frame msgType:(KKMessageType)msgType{
    self = [super initWithFrame:frame];
    if (self) {
        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, 0, kScreenWidth, 0.5);
        layer.backgroundColor = kColor(0xdddddd).CGColor;
        [self.layer addSublayer:layer];
        
        [self.collectionView reloadData];
        self.msgType = msgType;
        self.pageControl.numberOfPages = (self.dataArray.count%8 > 0) ? (self.dataArray.count/8+1) : self.dataArray.count/8;
    }
    return self;
}


#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    KKChatMoreViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:KKChatMoreViewCellID forIndexPath:indexPath];
    cell.cellModel = self.dataArray[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KKChatMoreViewCellModel *model = self.dataArray[indexPath.row];
    NSLog(@"%@", model.title);
}



#pragma mark - Getter -
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenWidth/4, kScreenWidth/4);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = kColor(0xf7f7f7);
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[KKChatMoreViewCell class] forCellWithReuseIdentifier:KKChatMoreViewCellID];
        [self addSubview:_collectionView];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self).offset(0.5);
            make.left.right.mas_equalTo(self).offset(0);
            make.height.mas_equalTo(kScreenWidth/4*2);
        }];
    }
    return _collectionView;
}

- (UIPageControl *)pageControl {
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] init];
//        _pageControl.backgroundColor = [UIColor greenColor];
        _pageControl.currentPageIndicatorTintColor = kColor(0x7d7d7d);
        _pageControl.pageIndicatorTintColor = kColor(0xdbdbdb);
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self).offset(0);
            make.height.mas_equalTo(10);
            make.top.mas_equalTo(self.collectionView.mas_bottom).offset(0);
        }];
    }
    return _pageControl;
}
- (NSMutableArray<KKChatMoreViewCellModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        KKChatMoreViewCellModel *photoModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"照片" pic:@""];
        KKChatMoreViewCellModel *cameraModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"拍照" pic:@""];
        KKChatMoreViewCellModel *callModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"视频通话" pic:@""];
        KKChatMoreViewCellModel *locationModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"位置" pic:@""];
        KKChatMoreViewCellModel *redBagModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"红包" pic:@""];
        KKChatMoreViewCellModel *voiceModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"语音输入" pic:@""];
        KKChatMoreViewCellModel *collectModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"收藏" pic:@""];
        KKChatMoreViewCellModel *toolModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"群工具" pic:@""];
        KKChatMoreViewCellModel *zzModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"转账" pic:@""];
        KKChatMoreViewCellModel *cardModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"个人名片" pic:@""];
        KKChatMoreViewCellModel *fileModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"文件" pic:@""];
        KKChatMoreViewCellModel *cheapCardModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"卡券" pic:@""];
        KKChatMoreViewCellModel *liveModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"群直播" pic:@""];
        KKChatMoreViewCellModel *longModel = [[KKChatMoreViewCellModel alloc] initWithTitle:@"接龙" pic:@"icon_outlined_solitaire.svg"];
        if (self.msgType == KKMessageTypeRoomChat) {
            NSArray *qunArr = @[photoModel, cameraModel, callModel, locationModel, redBagModel, voiceModel, collectModel, toolModel, longModel, liveModel, cardModel, fileModel, cheapCardModel];
            [_dataArray addObjectsFromArray:qunArr];
        } else if (self.msgType == KKMessageTypePersonalChat) {
            NSArray *qunArr = @[photoModel, cameraModel, callModel, locationModel, redBagModel, zzModel, voiceModel, collectModel, cardModel, fileModel, cheapCardModel];
            [_dataArray addObjectsFromArray:qunArr];
        } else {
            NSArray *qunArr = @[photoModel, cameraModel, callModel, locationModel, voiceModel, collectModel, cardModel, fileModel];
            [_dataArray addObjectsFromArray:qunArr];
        }
    }
    return _dataArray;
}

@end


@implementation KKChatMoreViewCellModel
- (instancetype)initWithTitle:(NSString *)title pic:(NSString *)pic {
    if (self = [super init]) {
        self.title = title;
        self.pic = pic;
    }
    return self;
}
@end


@interface KKChatMoreViewCell ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@end
@implementation KKChatMoreViewCell

- (void)setCellModel:(KKChatMoreViewCellModel *)cellModel {
    self.imageView.image = [UIImage svgImageName:cellModel.pic];
    self.titleLabel.text = cellModel.title;
}


#pragma mark - Getter -
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = kColor(0xfefefe);
        [self.contentView addSubview:_imageView];
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_centerX);
            make.top.mas_equalTo(self.contentView.mas_top).offset(10);
            make.height.width.mas_equalTo(50);
        }];
        _imageView.layer.cornerRadius = 10;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = kColor(0x898989);
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageView.mas_bottom).offset(4);
            make.centerX.mas_equalTo(self.imageView.mas_centerX);
        }];
    }
    return _titleLabel;
}


@end

