//
//  tbbVC.m
//  MadMax+
//
//  Created by ruany on 2016/12/2.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "tbbVC.h"
#import "MMDrawerBarButtonItem.h"
#import "UIViewController+MMDrawerController.h"
#import "KTDropdownMenuView.h"
@interface tbbVC ()

@end

@implementation tbbVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupLeftMenuButton];
    [self initUI];
}
-(void)setupLeftMenuButton{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    
    [self.navigationItem setTitle:@"CSGO"];
}
-(void)initUI{
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0.244 green:0.476 blue:1.000 alpha:0.200]];
    
    NSArray *titles = @[@"首页", @"朋友圈", @"我的关注", @"明星", @"家人朋友"];
    KTDropdownMenuView *menuView = [[KTDropdownMenuView alloc] initWithFrame:CGRectMake(0, 0,100, 44) titles:titles];
    menuView.selectedAtIndex = ^(int index)
    {
        NSLog(@"selected title:%@", titles[index]);
    };
    menuView.width = 130;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:menuView];
    
    //    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem  alloc]initWithCustomView:menuView];
//    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    UINavigationController * nav=[mainStoryboard instantiateViewControllerWithIdentifier:@"NAV"];
    //    nav.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(methodtocall:) ];
    
}
#pragma mark - Button Handlers
-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
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
