//
//  ViewController.m
//  CATransition
//
//  Created by 李浩 on 16/8/31.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
#import "AnimationGroupViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (assign, nonatomic) NSUInteger count;
@end

@implementation ViewController
- (IBAction)animationGroup:(id)sender {
    
    AnimationGroupViewController *aniGroupVC = [[AnimationGroupViewController alloc] init];
    [self presentViewController:aniGroupVC animated:YES completion:nil];
    
}

// 这个方法不会掉用
- (instancetype)init {// storyboard创建
    self = [super init];
    if (self) {
        self.count = 1;
        NSLog(@"%s, %lu", __func__, _count);
    }
    return self;
}


- (void)awakeFromNib {
    self.count = 1;
    NSLog(@"%s, %lu", __func__, _count);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.count = 1;
    
//    NSLog(@"%s, %lu", __func__, _count);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.count++;

    if (_count==4) {
        self.count = 1;
    }

    self.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%lu", _count]];

    CATransition *transiton = [CATransition animation];
    // 动画方式
    transiton.type = @"cube";
    // 动画方式变化的方向
    transiton.subtype = kCATransitionReveal;
    // 动画时间
//    transiton.duration = 2;
//    transiton.endProgress
    [self.imgView.layer addAnimation:transiton forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
