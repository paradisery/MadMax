//
//  LXSegmentControl.m
//  CoarseImitationNetEase
//
//  Created by chuanglong02 on 17/1/6.
//  Copyright © 2017年 漫漫. All rights reserved.
//

#import "LXSegmentControl.h"
#define indicatorViewColorDefualt [UIColor redColor]
@interface LXSegmentControl()
/** 标题按钮 */
@property (nonatomic, strong) UIButton *title_btn;
/** 存入所有标题按钮 */
@property (nonatomic, strong) NSMutableArray *titleBtn_mArr;
/** 标题数组 */
@property (nonatomic, strong) NSArray *title_Arr;

/** 指示器 */
@property (nonatomic, strong) UIView *indicatorView;

/** 临时button用来转换button的点击状态 */
@property (nonatomic, strong) UIButton *temp_btn;
@end

/** 按钮之间的间距(滚动时按钮之间的间距) */
static CGFloat const btn_Margin = 15;
/** 按钮字体的大小(字号) */
static CGFloat const btn_fondOfSize = 17;
/** 指示器的高度 */
static CGFloat const indicatorViewHeight = 2;
/** 点击按钮时, 指示器的动画移动时间 */
static CGFloat const indicatorViewTimeOfAnimation = 0.2;
@implementation LXSegmentControl
+(instancetype)segmentControlWithFrame:(CGRect)frame delegate:(id<LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr
{
    return  [[self alloc]initWithFrame:frame delegate:delegate titleArr:titleArr];
}
-(instancetype)initWithFrame:(CGRect)frame delegate:(id<LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.7];
        self.showsHorizontalScrollIndicator = NO;
        self.bounces = NO;
        
        self.SeDelegate = delegate;
        
        self.scrollType = LXSegmentedControlTypeEndScroll;
        self.title_Arr = titleArr;
        
        [self setupTitleArr];
    }
    return self;
    
}
/**   创建标题按钮   */
-(void)setupTitleArr
{
    CGFloat button_X = 0;
    CGFloat button_Y = 0;
    CGFloat button_H = self.frame.size.height;
    
    for (NSUInteger i  = 0; i <_title_Arr.count; i++) {
        
        self.title_btn =[UIButton buttonWithType:UIButtonTypeCustom];
        _title_btn.titleLabel.font = LXFont(btn_fondOfSize);
        _title_btn.tag = i;
        
        //计算内容的size
        CGSize buttonSize =[self sizeWithText:_title_Arr[i] font:LXFont(btn_fondOfSize) maxSize:CGSizeMake(MAXFLOAT, button_H)];
        //计算内容的宽度
        CGFloat button_W = 2 *btn_Margin + buttonSize.width;
        _title_btn.frame = CGRectMake(button_X, button_Y, button_W, button_H);
        [_title_btn setTitle:_title_Arr[i] forState:UIControlStateNormal];
        [_title_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_title_btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        //计算每个button的 X 值
        button_X = button_X + button_W;
        //点击事件
        [_title_btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        //默认选中第0 个button
        if (i == 0) {
            [self buttonAction:_title_btn];
        }
        //存入所有的 title_btn
        [self.titleBtn_mArr addObject:_title_btn];
        [self addSubview:_title_btn];
        
    }
    
    //计算 scrollview 的宽度
    
    UIButton *lastButton = self.titleBtn_mArr.lastObject;
    CGFloat scrollViewWidth = CGRectGetMaxX(lastButton.frame);
    self.contentSize = CGSizeMake(scrollViewWidth, self.height);
    
    //取出第一个子控件
    UIButton *firstButton =self.titleBtn_mArr.firstObject;
    
    //添加指示器
    //计算Titlelabel内容的size
    CGSize buttonSize =[self sizeWithText:firstButton.titleLabel.text font:LXFont(btn_fondOfSize) maxSize:CGSizeMake(MAXFLOAT, self.height)];
    
    self.indicatorView =[[UIView alloc]init];
    _indicatorView.backgroundColor = indicatorViewColorDefualt;
    
    _indicatorView.width = buttonSize.width;
    _indicatorView.y = self.height - 2 *indicatorViewHeight;
    _indicatorView.height = indicatorViewHeight;
    _indicatorView.centerX = firstButton.centerX;
    [self addSubview:self.indicatorView];
    
    
}
#pragma mark - - - 按钮的点击事件
- (void)buttonAction:(UIButton *)sender
{
    [self titleBtnSelectededCenter:sender];
    
    // 2、代理方法实现
    NSInteger index = sender.tag;
    
    if ([self.SeDelegate respondsToSelector:@selector(LXSegmentControl:didSelectBtnAtIndex:)]) {
        
        [self.SeDelegate LXSegmentControl:self didSelectBtnAtIndex:index];
    }
    
    //3 、 改变指示器的位置
    [self titleBtnSelected:sender];
}
/** 标题选中颜色改变以及指示器位置变化 */
- (void)titleBtnSelected:(UIButton *)button {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(indicatorViewTimeOfAnimation * 0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_temp_btn == nil) {
            button.selected = YES;
            _temp_btn = button;
        }else if (_temp_btn != nil && _temp_btn == button){
            button.selected = YES;
        }else if (_temp_btn != button && _temp_btn != nil){
            _temp_btn.selected = NO;
            button.selected = YES; _temp_btn = button;
        }
    });

    [UIView animateWithDuration:0.10 animations:^{
        self.indicatorView.width = button.width - btn_Margin;
        self.indicatorView.centerX = button.centerX;
    }];
    [self titleBtnSelectededCenter:button];

    
}
/** 滚动标题选中居中 */
- (void)titleBtnSelectededCenter:(UIButton *)centerBtn {
  
    
    switch (self.scrollType) {
        case LXSegmentedControlTypeCenterScroll:
            
            [self centerScroll:centerBtn];
            
            break;
        case LXSegmentedControlTypeEndScroll:
            
            [self endScroll:centerBtn];
            
        default:
            break;
    }
}
-(void)centerScroll:(UIButton *)centerBtn
{
     //计算偏移量
        CGFloat offsetX = centerBtn.center.x - Device_Width * 0.5;
    
        if (offsetX < 0) offsetX = 0;
    
        // 获取最大滚动范围
        CGFloat maxOffsetX = self.contentSize.width - Device_Width;
    
        if (offsetX > maxOffsetX) offsetX = maxOffsetX;
    
        // 滚动标题滚动条
        [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

-(void)endScroll:(UIButton *)centerBtn
{
    CGFloat offsetX;
    
    if (CGRectGetMaxX(centerBtn.frame) >= Device_Width) {
        
        offsetX = CGRectGetMaxX(centerBtn.frame) - Device_Width;
        
        if (centerBtn.tag <[_title_Arr count]-1) {
            offsetX = offsetX + centerBtn.frame.size.width;
        }
    }else
    {
        offsetX = 0 ;
    }
    [self setContentOffset:CGPointMake(offsetX, 0) animated:YES];

}
/** 标题选中颜色改变以及指示器位置变化 */
- (void)titleBtnSelectedWithScrollView:(UIScrollView *)scrollView {
    // 1、计算滚动到哪一页
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    // 2、把对应的标题选中
    UIButton *selectedBtn = self.titleBtn_mArr[index];
    
    // 3、滚动时，改变标题选中
    [self titleBtnSelected:selectedBtn];
}
-(void)setScrollType:(LXSegmentedControlScrollType)scrollType
{
    if (_scrollType != scrollType) {
        _scrollType = scrollType;
    }
}
#pragma mark---懒加载---
-(NSMutableArray *)titleBtn_mArr
{
    if (!_titleBtn_mArr) {
        _titleBtn_mArr =  [NSMutableArray array];
    }
    return _titleBtn_mArr;
}
/**
 *  计算文字尺寸
 *
 *  @param text    需要计算尺寸的文字
 *  @param font    文字的字体
 *  @param maxSize 文字的最大尺寸
 */
- (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize {
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
@end
