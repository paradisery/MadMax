//
//  VC3.m
//  MadMax+
//
//  Created by ruany on 2016/12/19.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "VC3.h"
#import "UIView+Extension.h"
#import "UIScrollView+UITouch.h"
@interface VC3 ()
@property (weak, nonatomic) IBOutlet UIView *v;
@property (weak, nonatomic) IBOutlet UIView *v2;

@end

@implementation VC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self uiTap];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}
- (IBAction)特效1:(id)sender {
    [self uiMaskView];
}
- (IBAction)特效2:(id)sender {
    [self uiCAGradientLayer];
}
- (IBAction)特效3:(id)sender {
    [self uiColor];
}
-(void)uiColor{
    CAGradientLayer *layer = [CAGradientLayer layer];
    [self.view.layer addSublayer:layer];
    layer.frame = CGRectMake(0, 0, self.view.width, 64);
    [layer setStartPoint:CGPointMake(0.0, 0.5)];
    [layer setEndPoint:CGPointMake(1.0, 0.5)];
    layer.colors = @[
                             (__bridge id)[UIColor yellowColor].CGColor,
                             (__bridge id)[UIColor greenColor].CGColor,
                             (__bridge id)[UIColor orangeColor].CGColor,
                             (__bridge id)[UIColor cyanColor].CGColor,
                             (__bridge id)[UIColor redColor].CGColor,
                             (__bridge id)[UIColor yellowColor].CGColor,
                             ];
    layer.locations=@[@0,@0,@0,@0,@0,@0,@0.25];
   

    // 添加部分
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0.0, @0.0, @0.0, @0.0, @0.0, @0.25];
    basicAnimation.toValue = @[@0.65,@0.8, @0.85, @0.9, @0.95, @1.0];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [layer addAnimation:basicAnimation forKey:nil];
    
    // 第二次添加部分
    UILabel *unlock = [[UILabel alloc] initWithFrame:layer.bounds];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    [self.view addSubview:unlock];
    //    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"Slide to reveal >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    layer.mask = unlock.layer;

}


-(void)uiCAGradientLayer{
    self.view.backgroundColor = [UIColor grayColor];
    // 渐变Layer
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    [self.view.layer addSublayer:gradientLayer];
    gradientLayer.frame = CGRectMake(0, 100, self.view.width, 64);
    gradientLayer.colors = @[
                             (__bridge id)[UIColor blackColor].CGColor,
                             (__bridge id)[UIColor whiteColor].CGColor,
                             (__bridge id)[UIColor blackColor].CGColor,
                             ];
    gradientLayer.locations = @[@0.25,@0.5,@0.75];
    
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    
    // 添加部分
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"locations"];
    basicAnimation.fromValue = @[@0, @0, @0.25];
    basicAnimation.toValue = @[@0.75, @1, @1];
    basicAnimation.duration = 2.5;
    basicAnimation.repeatCount = HUGE;
    [gradientLayer addAnimation:basicAnimation forKey:nil];
    
    // 第二次添加部分
    UILabel *unlock = [[UILabel alloc] initWithFrame:gradientLayer.bounds];
    // 必需要强引用保存unlock，此句也可以用[self.view addSubview:unlock]来替代;
    [self.view addSubview:unlock];
//    self.unlock = unlock;
    unlock.alpha = 0.5;
    unlock.text = @"滑动来解锁 >>";
    unlock.textAlignment = NSTextAlignmentCenter;
    unlock.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:30];
    gradientLayer.mask = unlock.layer;
}
-(void)uiMaskView{
    // 上述素材按照顺序分别是‘base’,'background',''mask','mask1';
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *baseGround = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0,200,200)];
    baseGround.image        = [UIImage imageNamed:@"base"];
    baseGround.center       = self.view.center;
    
    [self.view addSubview: baseGround];
    
    
    UIImageView *upGround = [[UIImageView alloc] initWithFrame:baseGround.frame];
    upGround.image        = [UIImage imageNamed:@"base1"];
    [self.view addSubview:upGround];
    
    
    UIView *mask      = [[UIView alloc] initWithFrame:upGround.bounds];
    upGround.maskView = mask;
    
    UIImageView *picOne = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 400)];
    picOne.image        = [UIImage imageNamed:@"mask1"];
//    [mask addSubview:picOne];
    
    UIImageView *picTwo = [[UIImageView alloc] initWithFrame:CGRectMake(0, -200, 200, 400)];
    picTwo.image        = [UIImage imageNamed:@"mask"];
    [mask addSubview:picTwo];
    
    [UIView animateWithDuration:2.1f delay:0.f options:0 animations:^{
//        picOne.y -=400;

        picTwo.y +=400;
    } completion:^(BOOL finished) {
        [baseGround removeFromSuperview];
        [upGround removeFromSuperview];
    }];
}




-(void)uiTap{
    UITapGestureRecognizer * tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tap];
}
-(void)tap:(UITapGestureRecognizer *)gesture{
    CGPoint touchPoint = [gesture locationInView:self.view];
    NSLog(@"!!!%f,%f",touchPoint.x,touchPoint.y);
    
    if ([_v.layer.presentationLayer hitTest:touchPoint]) {
        _v.backgroundColor = [UIColor redColor];
        //可以在这里写你想要做的事情
        NSLog(@"tap摸1");
        return;
    }else if ([_v2.layer.presentationLayer hitTest:touchPoint]){
        _v2.backgroundColor = [UIColor redColor];
        //可以在这里写你想要做的事情
        NSLog(@"tap摸2");
        return;
    }
    
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
