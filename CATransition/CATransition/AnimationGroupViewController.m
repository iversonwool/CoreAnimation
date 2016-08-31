//
//  AnimationGroupViewController.m
//  CATransition
//
//  Created by 李浩 on 16/8/31.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "AnimationGroupViewController.h"

@interface AnimationGroupViewController ()
@property (nonatomic, weak) CALayer *layer;
@end

@implementation AnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    CALayer *layer = [CALayer layer];
    
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    self.layer = layer;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    // 添加动画
    // 旋转动画
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @M_PI;
    // 位置动画
    CABasicAnimation *position = [CABasicAnimation animation];
    position.keyPath = @"position";
    position.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    // 缩放动画
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @1.2;
    CAAnimationGroup *aniGroup = [CAAnimationGroup animation];
    // 动画时间
    aniGroup.duration = 2;
    // 取消动画的回复（反弹）
    aniGroup.removedOnCompletion = NO;
    aniGroup.fillMode = kCAFillModeForwards;
    // 添加进去的动画是同时执行的
    aniGroup.animations = @[rotation, scale, position];
    [self.layer addAnimation:aniGroup forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
