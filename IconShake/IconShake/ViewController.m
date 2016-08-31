//
//  ViewController.m
//  IconShake
//
//  Created by 李浩 on 16/8/31.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#define RadianFromAngle(angle) ((angle)/180.*M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imgView.layer.cornerRadius = 5;
    self.imgView.layer.masksToBounds = YES;
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    [self.imgView addGestureRecognizer:longPress];
}

- (void)longPressed:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state==UIGestureRecognizerStateBegan) {
        CAKeyframeAnimation *keyframeAni = [CAKeyframeAnimation animation];
        keyframeAni.keyPath = @"transform.rotation";
        
        keyframeAni.values = @[@(RadianFromAngle(-5)), @(RadianFromAngle(5)), @(RadianFromAngle(-5))];// 如果不加最后这个角度 图标的抖动不是很流畅 
        
        keyframeAni.repeatCount = MAXFLOAT;
        [self.imgView.layer addAnimation:keyframeAni forKey:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
