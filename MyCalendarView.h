//
//  MyCalendarView.h
//  Calendar
//
//  Created by ys on 2017/12/15.
//  Copyright © 2017年 luhh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyCalendarView;
@protocol CalendarViewDelegate <NSObject>
@required
- (NSInteger)calendarView:(MyCalendarView *)calendarView numberOfItemsInSection:(NSInteger)section;

- (NSInteger)numberOfSectionsInCalendarView:(MyCalendarView *)calendarView;

/**
 根据自己需求 设置cell的样式

 @param calendarViewCell <#calendarViewCell description#>
 @param indexPath <#indexPath description#>
 */
- (void)calendarView:(UICollectionViewCell *)calendarViewCell cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@optional

/**
 点击cell 处理相应的事件

 @param calendarView <#calendarView description#>
 @param indexPath <#indexPath description#>
 */
- (void)calendarView:(MyCalendarView *)calendarView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface MyCalendarView : UIView

@property (nonatomic, weak) id<CalendarViewDelegate>delegate;


/**
 刷新数据
 */
- (void)reloadCalendarViewData;

@end
