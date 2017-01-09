//
//  VC1.m
//  MadMax+
//
//  Created by ruany on 2016/12/29.
//  Copyright © 2016年 ruany. All rights reserved.
//
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define Device_Height [[UIScreen mainScreen] bounds].size.height
#define Device_Width  [[UIScreen mainScreen] bounds].size.width
#define LBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LBRandomColor LBColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define MainColor [UIColor colorWithRed:1.000 green:0.580 blue:0.302 alpha:1.000];

#define LXWEAK(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define Image(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@", imageName]]
#define LXFont(font) [UIFont systemFontOfSize:font]
//#import "LxButton.h"
#import "UIView+Frame.h"
#import "NSString+Extension.h"

#import "VC1.h"
#import "LXSegmentControl.h"
#import "oneVC.h"
#import "twoVC.h"
@interface VC1 ()<UIScrollViewDelegate,LXSegmentControlDelegate>

@property(nonatomic,strong)LXSegmentControl *segmentControl;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) oneVC *oneVC;
@end

@implementation VC1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//    self.automaticallyAdjustsScrollViewInsets = YES;
    // 1.添加所有子控制器
    [self setupChildViewController];
    [self setupSegmentedControl];
    self.navigationItem.rightBarButtonItem  =[[UIBarButtonItem alloc]initWithTitle:@"切换滚动类型" style:UIBarButtonItemStylePlain target:self action:@selector(switchType:)];
}

-(void)switchType:(UIBarButtonItem *)buttonItem
{
    if (self.segmentControl.scrollType == LXSegmentedControlTypeCenterScroll) {
        self.segmentControl.scrollType = LXSegmentedControlTypeEndScroll;
    }else
    {
        self.segmentControl.scrollType = LXSegmentedControlTypeCenterScroll;
    }
    
}
- (void)setupSegmentedControl {
    
    
    NSArray *title_arr = @[@"NBA", @"西甲",@"CBA", @"斯诺克",@"飞镖大赛", @"WBA",@"UFC", @"黑带"];
    
    self.segmentControl =[LXSegmentControl segmentControlWithFrame:CGRectMake(0, 0, Device_Width, 44) delegate:self titleArr:title_arr];
    self.segmentControl.scrollType = LXSegmentedControlTypeEndScroll;
    [self.view addSubview:self.segmentControl];
    
    // 创建底部滚动视图
    self.mainScrollView = [[UIScrollView alloc] init];
    _mainScrollView.frame = CGRectMake(0, 44, self.view.frame.size.width, self.view.frame.size.height);
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width * title_arr.count, 0);
    _mainScrollView.backgroundColor = [UIColor clearColor];
    // 开启分页
    _mainScrollView.pagingEnabled = YES;
    // 没有弹簧效果
    _mainScrollView.bounces = NO;
    // 隐藏水平滚动条
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    // 设置代理
    _mainScrollView.delegate = self;
    [self.view addSubview:_mainScrollView];
    
    oneVC *VC1 = [[oneVC alloc] init];
    VC1.view.backgroundColor=[UIColor orangeColor];
    [self addChildViewController:VC1];
    [self.mainScrollView addSubview:VC1.view];
    [self addChildViewController:VC1];
    
}
-(void)LXSegmentControl:(LXSegmentControl *)segmentControl didSelectBtnAtIndex:(NSInteger)index
{
    // 1 计算滚动的位置
    CGFloat offsetX = index * self.view.frame.size.width;
    self.mainScrollView.contentOffset = CGPointMake(offsetX, 0);
    
    // 2.给对应位置添加对应子控制器
    [self showVc:index];
}
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    // 计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 1.添加子控制器view
    [self showVc:index];
    
    // 2.把对应的标题选中
    [self.segmentControl titleBtnSelectedWithScrollView:scrollView];
}

// 显示控制器的view
- (void)showVc:(NSInteger)index {
    
    CGFloat offsetX = index * self.view.frame.size.width;
    
    UIViewController *vc = self.childViewControllers[index];
    
    // 判断控制器的view有没有加载过,如果已经加载过,就不需要加载
    if (vc.isViewLoaded) return;
    vc.view.backgroundColor =  LBRandomColor;
    [self.mainScrollView addSubview:vc.view];
    vc.view.frame = CGRectMake(offsetX, 0, self.view.frame.size.width, self.view.frame.size.height);
}

-(void)setupChildViewController
{
    // 精选啊啊哈哈儿很听话
    oneVC *VC1 = [[oneVC alloc] init];
//    UIViewController *oneVC = [[UIViewController alloc] init];
    [self addChildViewController:VC1];
    
    // 电视剧
    twoVC *VC2 = [[twoVC alloc] init];
    [self addChildViewController:VC2];
    
    // 电影
    UIViewController *threeVC = [[UIViewController alloc] init];
    [self addChildViewController:threeVC];
    
    // 综艺
    UIViewController *fourVC = [[UIViewController alloc] init];
    [self addChildViewController:fourVC];
    
    // NBA
    UIViewController *fiveVC = [[UIViewController alloc] init];
    [self addChildViewController:fiveVC];
    
    // 新闻
    UIViewController *sixVC = [[UIViewController alloc] init];
    [self addChildViewController:sixVC];
    
    // 娱乐
    UIViewController *sevenVC = [[UIViewController alloc] init];
    [self addChildViewController:sevenVC];
    
    // 音乐
    UIViewController *eightVC = [[UIViewController alloc] init];
    [self addChildViewController:eightVC];
    
    // 网络电视
    UIViewController *nineVC = [[UIViewController alloc] init];
    [self addChildViewController:nineVC];
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
