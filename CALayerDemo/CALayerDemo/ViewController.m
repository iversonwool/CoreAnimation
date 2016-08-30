//
//  ViewController.m
//  CALayerDemo
//
//  Created by 李浩 on 16/8/29.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TransformFrame.h"

@interface ViewController ()
@property (nonatomic, weak) UIView *demoView;

@end




@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    UIView *view = [[UIView alloc] init];
    view.lh_left = 60;
    view.lh_top = 100;
    view.lh_size = CGSizeMake(100, 100);
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    self.demoView = view;
    
    
    
    
}

- (IBAction)animation:(id)sender {
    // animation
    [UIView animateWithDuration:1 animations:^{
        // 1.二维动画
        //self.demoView.transform = CGAffineTransformMakeRotation(M_PI_4);
        
        // 2.三维动画(绕z轴旋转)
        //self.demoView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
        
        // 利用KVC实现三维动画
        // 比较官方的写法
        
        NSValue *rotationValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
        [self.demoView.layer setValue:rotationValue forKeyPath:@"transform"];
         
        // 这种写法虽然可以实现功能，但可能会有意想不到的bug（带续）
        //[self.demoView.layer setValue:@100 forKeyPath:@"transform.translation.y"];
    }];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
