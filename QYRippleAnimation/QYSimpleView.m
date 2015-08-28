//
//  QYSimpleView.m
//  QYRippleAnimation
//
//  Created by qianye on 15/8/27.
//  Copyright (c) 2015年 qianye. All rights reserved.
//

#import "QYSimpleView.h"

@implementation QYSimpleView
{
    CGRect _firstRect;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:0.4];
        self.layer.borderColor = [UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:1].CGColor;
        self.layer.borderWidth = 1;
        self.layer.cornerRadius = self.frame.size.width / 2.0;
        _firstRect = frame;
        [self startAnimation];
    }
    return self;
}

// 执行动画
- (void)startAnimation
{
    [UIView animateWithDuration:1 animations:^{
//        self.transform = CGAffineTransformMakeScale(70 / 6.0, 70/6.0);
        self.frame = CGRectMake(_firstRect.origin.x - 100, _firstRect.origin.y - 100, 201, 201);
//        self.layer.borderColor = [UIColor colorWithRed:96/255 green:99/255 blue:102/255 alpha:1].CGColor;
//        self.layer.borderWidth = 1;
        self.layer.cornerRadius = self.frame.size.width / 2.0;
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
        [self startAnimation];
    }];
}



@end
