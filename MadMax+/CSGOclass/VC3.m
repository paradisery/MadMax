//
//  VC3.m
//  MadMax+
//
//  Created by ruany on 2016/12/19.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "VC3.h"

#import "UIScrollView+UITouch.h"
@interface VC3 ()
@property (weak, nonatomic) IBOutlet UIView *v;
@property (weak, nonatomic) IBOutlet UIView *v2;

@end

@implementation VC3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touche摸");
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
