//
//  oneVC.m
//  MadMax+
//
//  Created by ruany on 2017/1/9.
//  Copyright © 2017年 ruany. All rights reserved.
//

#import "oneVC.h"

@interface oneVC ()
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation oneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _lab.text=@"我是一个lable";
    UILabel * lab=[[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    lab.text=@"aaaaaaaaaaa";
    [self.view addSubview:lab];
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
