//
//  ViewController.m
//  CABasicAnimation
//
//  Created by 李浩 on 16/8/31.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) CALayer *layer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    //layer.anchorPoint = CGPointZero;
    layer.position = CGPointMake(100, 100);
    layer.contents = (__bridge id)[UIImage imageNamed:@"心"].CGImage;
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

- (IBAction)basicAnimation:(id)sender {
    
//    [self rotation];
    [self scale];
}

// 路径动画
- (IBAction)keyFrameAnimation:(id)sender {
    
    CAKeyframeAnimation *keyframeAni = [CAKeyframeAnimation animation];
    keyframeAni.keyPath = @"position";
    
    // 方式一：点数组
//    NSValue *value0 = [NSValue valueWithCGPoint:CGPointZero];
//    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
//    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(200, 0)];
//    keyframeAni.values = @[value0, value1, value2];
    
    // 方式二：路径
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 200)];
    keyframeAni.path = path.CGPath;
    
    // 重复次数
    keyframeAni.repeatCount = 100.;
    
    // 取消动画移除
    keyframeAni.removedOnCompletion = NO;
    // 保持最新状态
    keyframeAni.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:keyframeAni forKey:nil];
}

- (void)scale {
    CABasicAnimation *basicAni = [CABasicAnimation animation];
    // 仅仅这样设置动画会弹回原来的状态
    // 设置取消反弹，动画执行完之后，不要移除动画
    basicAni.removedOnCompletion = NO;
    // 并且保持最新的动画位置
    basicAni.fillMode = kCAFillModeForwards;
    // 执行时间
    //    basicAni.duration = 1;
    // 执行次数
    basicAni.repeatCount = MAXFLOAT;
    
    basicAni.keyPath = @"transform";
    basicAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1)];
    
    [self.layer addAnimation:basicAni forKey:nil];
}

- (void)rotation {
    CABasicAnimation *basicAni = [CABasicAnimation animation];
    // 仅仅这样设置动画会弹回原来的状态
    // 设置取消反弹，动画执行完之后，不要移除动画
    basicAni.removedOnCompletion = NO;
    // 并且保持最新的动画位置
    basicAni.fillMode = kCAFillModeForwards;
    // 执行时间
    //    basicAni.duration = 1;
    // 执行次数
    basicAni.repeatCount = MAXFLOAT;
    
    basicAni.keyPath = @"transform";
    basicAni.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 0, 1)];
    
    [self.layer addAnimation:basicAni forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
