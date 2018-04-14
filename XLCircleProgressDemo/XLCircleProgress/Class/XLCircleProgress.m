//
//  CircleView.m
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "XLCircleProgress.h"
#import "XLCircle.h"
#import <Masonry.h>

@implementation XLCircleProgress
{
    XLCircle* _circle;
    UILabel *_percentLabel;
    UILabel *_timeLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}


-(void)initUI
{
    //MARK:可调整的参数
    //>-----------------------------------------------//
    //弧形进度条宽度
    float lineWidth = 35;
    // 字体
    UIFont *percentFont = [UIFont boldSystemFontOfSize:55];
    UIFont *timeFont = [UIFont systemFontOfSize:40];
    // 竖直位置
    CGFloat percentBottomToCenter = 30;
    CGFloat timeTopToCenter = 35;
    //-------------------------------------------------<//
    
    // 百分比
    _percentLabel = [[UILabel alloc] initWithFrame:/*self.bounds*/CGRectZero];
    _percentLabel.textColor = [UIColor whiteColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = percentFont;
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    
    [_percentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-percentBottomToCenter);
    }];
    
    // 时间
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _timeLabel.textColor = [UIColor whiteColor];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.font = timeFont;
    _timeLabel.text = @"00:05";
    [self addSubview:_timeLabel];
    
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX).mas_offset(0);
        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(timeTopToCenter);
    }];
    
    
    _circle = [[XLCircle alloc] initWithFrame:self.bounds lineWidth:lineWidth];
    [self addSubview:_circle];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;
    _circle.progress = progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",progress*100];
}

@end
