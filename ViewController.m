//
//  ViewController.m
//  Calendar
//
//  Created by ys on 2017/12/15.
//  Copyright © 2017年 luhh. All rights reserved.
//

#import "ViewController.h"
#import "MyCalendarView.h"
#import "Masonry.h"

@interface ViewController ()<CalendarViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MyCalendarView *view = [[MyCalendarView alloc] init];
    view.delegate = self;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(375, 270));
        make.leading.equalTo(self.view);
        make.top.equalTo(self.view).with.offset(100);
    }];
}


- (NSInteger)calendarView:(MyCalendarView *)calendarView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (NSInteger)numberOfSectionsInCalendarView:(MyCalendarView *)calendarView
{
    return 5;
}

- (void)calendarView:(UICollectionViewCell *)calendarViewCell cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    calendarViewCell.backgroundColor = [UIColor purpleColor];
}

- (void)calendarView:(MyCalendarView *)calendarView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld=========%ld",indexPath.section,indexPath.row);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
