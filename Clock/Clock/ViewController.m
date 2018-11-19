//
//  ViewController.m
//  Clock
//
//  Created by 李浩 on 16/8/30.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "ViewController.h"
// 角度转弧度
#define RadianFromAngle(angle) ((angle)/180.*M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *clockImgView;
@property (nonatomic, weak) CALayer *secondHand;
@property (nonatomic, weak) CALayer *minuteHand;
@property (nonatomic, weak) CALayer *hourHand;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configSecondHand];
    [self configMinuteHand];
    [self configHourHand];
    
    // 先让它获取一次
    [self updateClock];
    
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateClock) userInfo:nil repeats:YES];
    
}

- (void)configHourHand {
    CGSize clockSize = self.clockImgView.frame.size;
    CALayer *hourHand = [CALayer layer];
    hourHand.bounds = CGRectMake(0, 0, 4, clockSize.height/2-60);
    hourHand.position = CGPointMake(clockSize.width/2, clockSize.height/2);
    hourHand.anchorPoint = CGPointMake(0.5, 1);
    hourHand.backgroundColor = [UIColor blackColor].CGColor;
    hourHand.cornerRadius = 4;
    [self.clockImgView.layer addSublayer:hourHand];
    self.hourHand = hourHand;
}
- (void)configMinuteHand {
    CGSize clockSize = self.clockImgView.frame.size;
    CALayer *minuteHand = [CALayer layer];
    minuteHand.bounds = CGRectMake(0, 0, 3, clockSize.height/2-40);
    minuteHand.position = CGPointMake(clockSize.width/2, clockSize.height/2);
    minuteHand.anchorPoint = CGPointMake(0.5, 1);
    minuteHand.backgroundColor = [UIColor blueColor].CGColor;
    [self.clockImgView.layer addSublayer:minuteHand];
    self.minuteHand = minuteHand;
}

- (void)configSecondHand {
    CGSize clockSize = self.clockImgView.frame.size;
    // 1.秒针
    CALayer *secondHand = [CALayer layer];
    secondHand.bounds = CGRectMake(0, 0, 1, clockSize.height/2-30);
    // center 是以父视图为参照，所以不能像下面这样写
    //    secondHand.position = self.clockImgView.center;
    secondHand.position = CGPointMake(clockSize.width/2, clockSize.height/2);
    secondHand.anchorPoint = CGPointMake(0.5, 1);
    secondHand.backgroundColor = [UIColor redColor].CGColor;
    [self.clockImgView.layer addSublayer:secondHand];
    self.secondHand = secondHand;
}

- (void)updateClock {
    // 获取当前时间
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond|NSCalendarUnitMinute|NSCalendarUnitHour fromDate:[NSDate date]];
    // 当前秒
    NSInteger currentSecond = components.second;
    NSInteger currentMinute = components.minute;
    NSInteger currentHour = components.hour;
    if (currentHour>=12) {
        currentHour -= 12;
    }
    NSLog(@"%ld, %ld, %ld", currentSecond, currentMinute, currentHour);
    // 当前秒针正确的显示位置
    // 当前分针正确的显示位置
    // 秒针每秒转6度
    // 分针每秒转0.1度
    // 时针每秒转M_PI/6/3600.
    
    self.secondHand.transform = CATransform3DMakeRotation(RadianFromAngle(6*currentSecond), 0, 0, 1);
    self.minuteHand.transform = CATransform3DMakeRotation(RadianFromAngle(0.1*(currentMinute*60+currentSecond)), 0, 0, 1);
    
    self.hourHand.transform = CATransform3DMakeRotation(M_PI/6/3600*(3600*currentHour+currentMinute*60+currentSecond), 0, 0, 1);
 
#warning bug惊现，原因有待发掘
//    KVC实现,bug惊现，原因有待发掘，
//    [self.secondHand setValue:@(RadianFromAngle(6*currentSecond)) forKeyPath:@"transform.rotation"];
}

- (void)privateMethod {
    NSLog(@"hello world!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
