//
//  navVC.m
//  MadMax+
//
//  Created by ruany on 2016/12/2.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "navVC.h"
#import "tbbVC.h"
#import "tbbVC2.h"
#import "tbbVC3.h"
#import "LeftViewController.h"

@interface navVC ()
@property(nonatomic,strong)tbbVC * tb1;
@property(nonatomic,strong)tbbVC2 * tb2;
@property(nonatomic,strong)tbbVC3 * tb3;
@end

@implementation navVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbb1) name:@"tbbb1" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbb2) name:@"tbbb2" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bbb3) name:@"tbbb3" object:nil];
    
     UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    _tb1=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb1"];
    _tb2=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb2"];
    _tb3=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb3"];
    [self initWithRootViewController:_tb1];
    
    
}
-(void)bbb1{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    _tb1=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb1"];
    [self initWithRootViewController:_tb1];
}
-(void)bbb2{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    _tb2=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb2"];
    [self initWithRootViewController:_tb2];
}
-(void)bbb3{
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    _tb3=[mainStoryboard instantiateViewControllerWithIdentifier:@"tb3"];
    [self initWithRootViewController:_tb3];
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
