//
//  ViewController.m
//  UIViewTransiton
//
//  Created by 李浩 on 16/8/31.
//  Copyright © 2016年 李浩. All rights reserved.
//

// UIViewPropertyAnimator

#import "ViewController.h"

#include <dlfcn.h>

@interface ViewController ()

@property (nonatomic, strong) UIView *redView;

@property (nonatomic, strong) UIViewPropertyAnimator *propertyAnimator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
//
    self.redView = [[UIView alloc] init];
    [self.view addSubview:self.redView];
    self.redView.frame = CGRectMake(50, 50, 100, 100);
    self.redView.backgroundColor = [UIColor redColor];
    
    
    
    void (^animation)(void) = ^() {
        self.redView.frame = CGRectMake(50, 50, 50, 50);
    };
    
    self.propertyAnimator = [[UIViewPropertyAnimator alloc] initWithDuration:2 curve:UIViewAnimationCurveEaseInOut animations:animation];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"animator" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(10, 500, 100, 20);
    btn.backgroundColor = [UIColor cyanColor];
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClicked:(UIButton *)btn {
    
    NSLog(@"-----%@", self.propertyAnimator);
    [self.propertyAnimator startAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
