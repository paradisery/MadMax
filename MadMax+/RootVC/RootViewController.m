//
//  RootViewController.m
//  MadMax+
//
//  Created by ruany on 2016/12/1.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor blackColor];
}


- (instancetype)initWithLeftViewController:(UIViewController *)leftVC
                  withCenterViewController:(UIViewController *)centerVC {
    self = [super init];
    
    if (self != nil) {
        
        [self addChildViewController:centerVC];
        [self.view addSubview:centerVC.view];
        
        //添加子视图和子控制器
        [self addChildViewController:leftVC];
        leftVC.view.frame = CGRectMake(-200, 0, 200, self.view.bounds.size.height);
        [self.view addSubview:leftVC.view];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [self.view addGestureRecognizer:pan];
        
    }
    
    return self;
}
#pragma  mark - 手势
- (void)panAction:(UIPanGestureRecognizer *)pan {
    
    /*
     * 1.让抽屉视图的平移量跟随着手指的x轴偏移量相同
     * 2.判断条件：
     *  ①是否在滑动的过程中大于等于(>=)某个临界值，这里我的临界值是200(左边抽屉视图的宽度)
     *   1>条件成立这个临界值就让当前的偏移量 = 这个临界值
     *  ②再次判断手势的状态是否结束,并且手指的偏移量是否小于这个临界值200
     *   1>条件成立就让当前手指的x轴偏移量为0
     *
     *  整个过程就是滑动量到达200时才显示抽屉视图没达到200就不显示
     */
    CGPoint p =  [pan translationInView:pan.view];
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
//        for (UIView *subView in self.view.subviews) {
        
            CGPoint p1 = p;
            
            if (p1.x >= 100) {
                
                p1.x = 200;
                
            }else if (pan.state == UIGestureRecognizerStateEnded && p1.x < 100){
                
                p1.x = 0;
                
            }

//            subView.transform = CGAffineTransformMakeTranslation(p1.x, 0);
            self.view.subviews[1].transform=CGAffineTransformMakeTranslation(p1.x, 0);
//            NSLog(@"+++++++++++++++%@",self.view.subviews[1]);
//        }
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        for (UIView *subView in self.view.subviews) {
            
            subView.transform = CGAffineTransformIdentity;
            
        }
    }];
    
}
#pragma  mark - 关闭左边的抽屉

- (void)closeLeftViewController:(UIViewController *)parentViewController {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        
        for (UIView *subView in parentViewController.view.subviews) {
            
            subView.transform = CGAffineTransformIdentity;
            
        }
    }];
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
