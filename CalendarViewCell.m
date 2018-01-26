//
//  CalendarViewCell.m
//  Calendar
//
//  Created by ys on 2017/12/15.
//  Copyright © 2017年 luhh. All rights reserved.
//

#import "CalendarViewCell.h"

@interface CalendarViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *calendarLabel;
@property (weak, nonatomic) IBOutlet UIView *clickTipView;

@end

@implementation CalendarViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.clickTipView.layer.masksToBounds = YES;
    self.clickTipView.layer.cornerRadius = 5;
}

- (void)showTipView
{
    self.clickTipView.hidden = !self.clickTipView.hidden;
}

@end
