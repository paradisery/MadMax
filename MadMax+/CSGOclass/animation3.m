//
//  animation3.m
//  MadMax+
//
//  Created by ruany on 2016/12/26.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "animation3.h"
#import <GPUImage/GPUImage.h>
#import <Masonry/Masonry.h>
#import <QuartzCore/QuartzCore.h>
#import "KYCuteView.h"

extern const NSString *str=@"全局变量";
static const NSString *str1=@"静态变量";

@interface animation3 ()
@property(nonatomic,strong)CADisplayLink * displayLink;
//需要隐藏气泡时候可以使用这个属性：self.frontView.hidden = YES;
@property(nonatomic, strong) UIView *frontView;
//父视图
@property(nonatomic, strong) UIView *containerView;
//气泡粘性系数，越大可以拉得越长
@property(nonatomic, assign) CGFloat viscosity;
//气泡上显示数字的label
// the label on the bubble
@property(nonatomic, strong) UILabel *bubbleLabel;
//气泡颜色
// bubble's color
@property(nonatomic, strong) UIColor *bubbleColor;
//气泡的直径
// bubble's diameter
@property(nonatomic, assign) CGFloat bubbleWidth;


@property(nonatomic,strong)UIDynamicAnimator *animator;
@property(nonatomic,strong)UIView * orangeBall;
@end

@implementation animation3
{
    UIBezierPath *cutePath;
    UIColor *fillColorForCute;
    UIDynamicAnimator *animator;
    UISnapBehavior *snap;
    UIView *backView;
    
    
    
    CGFloat r1; // backView
    CGFloat r2; // frontView
    CGFloat x1;
    CGFloat y1;
    CGFloat x2;
    CGFloat y2;
    CGFloat centerDistance;
    CGFloat cosDigree;
    CGFloat sinDigree;
    
    CGPoint pointA; //A
    CGPoint pointB; //B
    CGPoint pointD; //D
    CGPoint pointC; //C
    CGPoint pointO; //O
    CGPoint pointP; //P
    
    CGRect oldBackViewFrame;
    CGPoint initialPoint;
    CGPoint oldBackViewCenter;
    CAShapeLayer *shapeLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self xiaodian];
    [self initoOrangeBall];
}
-(void)xiaodian{
    KYCuteView *cuteView = [[KYCuteView alloc]initWithPoint:CGPointMake(self.tabBarController.tabBar.subviews[5].frame.size.height*5/6,self.tabBarController.tabBar.subviews[5].frame.size.width/100) superView: self.tabBarController.tabBar.subviews[5]];
    cuteView.viscosity  = 20;
    cuteView.bubbleWidth = 30;
    cuteView.bubbleColor = [UIColor colorWithRed:0 green:0.722 blue:1 alpha:1];
    [cuteView setUp];
    [cuteView addGesture];
    //注意：设置 'bubbleLabel.text' 一定要放在 '-setUp' 方法之后
    //Tips:When you set the 'bubbleLabel.text',you must set it after '-setUp'
    cuteView.bubbleLabel.text = @"13";
    
    NSLog(@"%@,%@",self.tabBarController.tabBar.items[0],self.tabBarController.tabBar.subviews[0]) ;
}
-(void)initoOrangeBall{

    self.orangeBall=[[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    self.orangeBall.backgroundColor=[UIColor orangeColor];
    self.orangeBall.layer.cornerRadius=25;
    self.orangeBall.layer.borderColor=[UIColor blackColor].CGColor;
    self.orangeBall.layer.borderWidth=0;
    [self.view addSubview:self.orangeBall];
    
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.orangeBall];
    
}
-(void)gravity{
    UIGravityBehavior * gb=[[UIGravityBehavior alloc]initWithItems:@[self.orangeBall]];
    [self.animator addBehavior:gb];
}
-(void)gravity1{
    UICollisionBehavior * cb=[[UICollisionBehavior alloc]initWithItems:@[self.orangeBall]];
    cb.translatesReferenceBoundsIntoBoundary=YES;
    [self.animator addBehavior:cb];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self gravity];
//    [self gravity1];
}






+(void)animationWithView:(UIView *)view duration:(CFTimeInterval)duration{
    
    CAKeyframeAnimation * animation;
    animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = duration;
    animation.removedOnCompletion = NO;
    
    animation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *values = [NSMutableArray array];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: @"easeInEaseOut"];
    
    [view.layer addAnimation:animation forKey:nil];
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
