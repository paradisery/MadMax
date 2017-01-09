//
//  videoVC.m
//  MadMax+
//
//  Created by ruany on 2016/12/19.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "videoVC.h"
#import "KTDropdownMenuView.h"
#import <Masonry/Masonry.h>
@interface videoVC ()
@property (weak, nonatomic) IBOutlet UIButton *lBtn;
@property (weak, nonatomic) IBOutlet UIButton *rBtn;
@property(nonatomic,strong)UIView * animationView;
@property(nonatomic,strong)KTDropdownMenuView *menuView;
@end

@implementation videoVC
{
    int i;
    UIView * v;
    UIButton *btn;
}
#pragma mark -- life cycle --
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITapGestureRecognizer * ges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(respondsToGesture:)];
    [self.view addGestureRecognizer:ges];
    
    i=0;
//
    
    [self.view addSubview:self.animationView];
    
    [self.animationView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(100);
        
        make.height.mas_equalTo(5);
        make.width.mas_equalTo(100);
//        make.bottom.offset(-105);
//        make.right.offset(-105);
//
    }];
    
    
    
    
}

//- (void)didMoveToWindow{
//    [super didMoveToWindow];
//    if (self.window) {
//        
//    }
//}
-(void)respondsToGesture:(UITapGestureRecognizer *)gesture {
    
    CGPoint touchPoint = [gesture locationInView:self.view];
    NSLog(@"!!!%f,%f",touchPoint.x,touchPoint.y);
    
    if ([_animationView.layer.presentationLayer hitTest:touchPoint]) {
        _animationView.backgroundColor = [UIColor orangeColor];
        //可以在这里写你想要做的事情
        return;
    }else if ([v.layer.presentationLayer hitTest:touchPoint]){
        v.backgroundColor=[UIColor blackColor];
        return;
    }
}

#pragma mark -- Delegate --
#pragma mark -- handle actions --
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    
//}
- (IBAction)lBtnAction:(id)sender {
    [self move];
}
- (IBAction)rBtnAction:(id)sender {
    [self back];
}
- (IBAction)btn3:(id)sender {
//    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(240, 160) radius:100 startAngle:(0/180.0)*M_PI endAngle:((0-1)/(180.0))*M_PI clockwise:YES];
//    
//    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animationWithKeyPath:@"position"];
//    orbit.path = path.CGPath;
//    orbit.duration = 16;
//    orbit.repeatCount = HUGE_VALF;
//    
//    orbit.removedOnCompletion = NO;
//    orbit.fillMode= kCAFillModeForwards;
//    [v.layer addAnimation:orbit forKey:@"orbit"];
    
//    [self.animationView layoutIfNeeded];
//    [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
////        make.left.offset(105);
////        make.top.offset(105);
//        
//        make.height.mas_equalTo(100);
//        make.width.mas_equalTo(100);
//       
//    }];


    [UIView animateWithDuration:3.0
                          delay:0
         usingSpringWithDamping:0.2
          initialSpringVelocity:0.7
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
            
//                         [self.animationView layoutIfNeeded];
                         _animationView.frame=CGRectMake(0,300, 200, 200);
                         
                     } completion:^(BOOL finished) {
                        
                     }];
}
#pragma mark -- helper methods --
-(void)move{
    [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(120);
//        make.top.offset(120);
//        make.top.equalTo(self.view.mas_top).offset(200);
//        make.bottom.equalTo(_animationView.mas_bottom).offset(200);
        make.height.mas_equalTo(100);
//        make.width.mas_equalTo(50);
    }];
    
//    [self.animationView mas_remakeConstraints:^(MASConstraintMaker *make) {
//                                 make.height.mas_equalTo(20);
//                             }];
//    CGPoint originalPoint = _animationView.center;
//    CGPoint point = CGPointMake(_animationView.center.x, _animationView.center.y+270);
    
[UIView animateWithDuration:5.0
                      delay:0
     usingSpringWithDamping:0.2
      initialSpringVelocity:5
                    options:UIViewAnimationOptionCurveLinear
                 animations:^{
//            UIViewKeyframeAnimationOptionAllowUserInteraction=UIViewAnimationOptionAllowUserInteraction;
//                     _animationView.center = point;
                     
         [self.view layoutIfNeeded];
    
} completion:^(BOOL finished) {
//    _animationView.center = originalPoint;
}];


}
-(void)back{
    [self.animationView mas_updateConstraints:^(MASConstraintMaker *make) {
        
//        make.left.offset(30);
//        make.top.offset(300);
        make.height.mas_equalTo(5);
//        make.width.mas_equalTo(150);
    }];
    [UIView animateWithDuration:5.0
                          delay:0
         usingSpringWithDamping:0.2
          initialSpringVelocity:2
                        options:UIViewAnimationOptionBeginFromCurrentState |UIViewAnimationOptionCurveLinear
                     animations:^{
                         //                     [self.animationView mas_remakeConstraints:^(MASConstraintMaker *make) {
                         //                         make.left.mas_equalTo(200);
                         //                     }];
//                         _animationView.frame = CGRectMake(105, 105, 100,100);
                         
                         [self.view layoutIfNeeded];
                         
                     } completion:nil];
}
#pragma mark -- getter and setter --
- (UIView *)animationView
{
    if (!_animationView)
    {
        _animationView = [[UIView alloc] init];
        _animationView.backgroundColor = [UIColor redColor];
        _animationView.alpha = 0.5;
        UITapGestureRecognizer * ges=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapDef)];
        _animationView.userInteractionEnabled=YES;
        [_animationView addGestureRecognizer:ges];
    }
    
    return _animationView;
}
-(void)tapDef{
    i++;
    NSLog(@"%d点",i);
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
