//
//  LeftViewController.m
//  MadMax+
//
//  Created by ruany on 2016/12/1.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "LeftViewController.h"

@interface LeftViewController ()

@end

@implementation LeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btn1:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tbbb1" object:nil];
    
}
- (IBAction)btn2:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tbbb2" object:nil];
    
}
- (IBAction)btn3:(id)sender {
    [[NSNotificationCenter defaultCenter]postNotificationName:@"tbbb3" object:nil];
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
