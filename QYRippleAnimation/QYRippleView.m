//
//  QYRippleView.m
//  QYRippleAnimation
//
//  Created by qianye on 15/8/26.
//  Copyright © 2015年 qianye. All rights reserved.
//

#import "QYRippleView.h"

@implementation QYRippleView
{
    int _step;
    CGFloat _speed;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _step = 0;
//        [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(rippleAnimation:) userInfo:nil repeats:YES];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            while (1) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self setNeedsDisplay];
                });
                _step++;
                if (_step == 61) {
                    _step = 0;
//                    [NSThread sleepForTimeInterval:0.26];
                }
                [NSThread sleepForTimeInterval:0.03];
            }
        });
    }
    return self;
}

//- (void)rippleAnimation:(NSTimer *)timer
//{
//    [self setNeedsDisplay];
//    _step++;
//    if (_step == 21) {
//        _step = 0;
//    }
//}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    // 创建颜色空间
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    // 创建渐变配置
    CGFloat locations[2] = {1.0,1.0};
    CGGradientRef gradientRef;
    if (_step > 30) {
        // 渐变和截屏
        CGFloat components[8] = {12/255.0,175/255.0,199/255.0,0.2 - (_step - 30) * (0.2 / 30) ,1.0,1.0,1.0,0.2 - (_step - 30) * (0.2 / 30)}; // 逐渐消失需要设置
        gradientRef = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 6 + 30 * (64 / 30.0), 0, 2 * M_PI, 0);
        CGContextClip(contextRef);
        
        // 画线框
        CGContextSetLineWidth(contextRef, 1.5);
        // 64表示该视图边缘到内边缘的距离  也就是self.fram.size.width / 2.0 - 6
        CGContextSetStrokeColorWithColor(contextRef, [UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:0.2- (_step - 30) * (0.2 / 30)].CGColor); // 逐渐消失需要设置
        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 6 + (64 / 30.0) * 30, 0, 2 * M_PI, 0);
        CGContextDrawPath(contextRef, kCGPathStroke);
    }else {
        // 渐变和截屏
        CGFloat components[8] = {12/255.0,175/255.0,199/255.0,0.2, 1.0,1.0,1.0,0.2};
        gradientRef = CGGradientCreateWithColorComponents(colorSpace, components, locations, 2);
        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 6 + _step * (64 / 30.0), 0, 2 * M_PI, 0);
        CGContextClip(contextRef);
        
        // 画线框
        CGContextSetLineWidth(contextRef, 1.5);
        CGContextSetStrokeColorWithColor(contextRef, [UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:1].CGColor);
        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 6 + (64 / 30.0) * _step, 0, 2 * M_PI, 0);
        CGContextDrawPath(contextRef, kCGPathStroke);
    }
    
    // 绘制渐变   6表示中间圆的大小
    CGContextDrawRadialGradient(contextRef, gradientRef, CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0), 6, CGPointMake(self.frame.size.width / 2.0, self.frame.size.height / 2.0), self.frame.size.width / 2.0, kCGGradientDrawsAfterEndLocation);
    
    // 释放对象
    CGGradientRelease(gradientRef);
    CGColorSpaceRelease(colorSpace);
    
    
    
//    if (_step != 0) {
//        CGContextSetStrokeColorWithColor(contextRef, [UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:1].CGColor);
//        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 12 + (58 / 30.0) * _step, 0, 2 * M_PI, 0);
//        CGContextDrawPath(contextRef, kCGPathStroke);
//    }
    
    [[UIColor colorWithRed:12/255.0 green:175/255.0 blue:199/255.0 alpha:1] set];
    CGRect rect1 = CGRectMake(self.frame.size.width / 2 - 6, self.frame.size.height / 2 - 6, 12, 12);
    CGContextAddEllipseInRect(contextRef, rect1);
    CGContextDrawPath(contextRef, kCGPathFill);
    
    
//    for (int i = 0; i < 11; i++) {
//        CGContextSetLineWidth(contextRef, 1);
//        
//        CGContextSetStrokeColorWithColor(contextRef, [UIColor colorWithRed:0 green:0 blue:255 alpha:1 - 0.1 * i].CGColor);
//        CGContextAddArc(contextRef, self.frame.size.width / 2, self.frame.size.height / 2, 30 + 6 * i, 0, 2 * M_PI, 0);
//        
//        CGContextDrawPath(contextRef, kCGPathStroke);
//    }
}


@end
