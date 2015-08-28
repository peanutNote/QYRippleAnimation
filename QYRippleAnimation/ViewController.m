//
//  ViewController.m
//  QYRippleAnimation
//
//  Created by qianye on 15/8/26.
//  Copyright (c) 2015年 qianye. All rights reserved.
//

#import "ViewController.h"
#import "QYRippleView.h"
#import "QYSimpleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    QYRippleView *qyRippleView = [[QYRippleView alloc] initWithFrame:CGRectMake(50, 50, 140, 140)];
    qyRippleView.backgroundColor = [UIColor clearColor];
//    qyRippleView.layer.borderWidth = 1.0;
//    qyRippleView.layer.borderColor = [UIColor grayColor].CGColor;
//    qyRippleView.layer.cornerRadius = 5;
    [_testImag addSubview:qyRippleView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
