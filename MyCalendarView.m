//
//  MyCalendarView.m
//  Calendar
//
//  Created by ys on 2017/12/15.
//  Copyright © 2017年 luhh. All rights reserved.
//

#import "MyCalendarView.h"
#import "CalendarViewCell.h"
#import "Masonry.h"

#define ItemSize 48
#define SCREEN_WITH  [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface MyCalendarView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *calendarCollectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *flowLayout;

@end

@implementation MyCalendarView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        [self creatCalendarView];
    }
    return self;
}

- (void)creatCalendarView
{
    [self addSubview:self.calendarCollectionView];
    [self.calendarCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(10);
        make.trailing.equalTo(self).with.offset(-12);
        make.leading.equalTo(self).with.offset(12);
        make.bottom.equalTo(self).with.offset(-10);
    }];
}

- (void)reloadCalendarViewData
{
    [self.calendarCollectionView reloadData];
}

#pragma mark - UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(numberOfSectionsInCalendarView:)]) {
        return [self.delegate numberOfSectionsInCalendarView:self];
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarView:numberOfItemsInSection:)]) {
        return [self.delegate calendarView:self numberOfItemsInSection:section];
    }
    return 0;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CalendarViewCell" forIndexPath:indexPath];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarView:cellForItemAtIndexPath:)]) {
        [self.delegate calendarView:cell cellForItemAtIndexPath:indexPath];
    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CalendarViewCell *cell = (CalendarViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell showTipView];
    if (self.delegate && [self.delegate respondsToSelector:@selector(calendarView:didSelectItemAtIndexPath:)]) {
        [self.delegate calendarView:self didSelectItemAtIndexPath:indexPath];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(SCREEN_WITH, 2);
}

#pragma mark - lazy
- (UICollectionView *)calendarCollectionView
{
    if (!_calendarCollectionView) {
        _calendarCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _calendarCollectionView.backgroundColor = [UIColor clearColor];
        _calendarCollectionView.showsVerticalScrollIndicator = NO;
        _calendarCollectionView.showsHorizontalScrollIndicator = NO;
        _calendarCollectionView.delegate = self;
        _calendarCollectionView.dataSource = self;
        [_calendarCollectionView registerNib:[UINib nibWithNibName:@"CalendarViewCell" bundle:nil] forCellWithReuseIdentifier:@"CalendarViewCell"];
    }
    
    return _calendarCollectionView;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _flowLayout.itemSize = CGSizeMake(ItemSize, ItemSize);
//        _flowLayout.sectionInset = UIEdgeInsetsMake(0, 2, 0, 0);
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _flowLayout.minimumLineSpacing = 2;
        _flowLayout.minimumInteritemSpacing = 2;
    }
    return _flowLayout;
}

@end
