//
//  LXSegmentControl.h
//  CoarseImitationNetEase
//
//  Created by chuanglong02 on 17/1/6.
//  Copyright © 2017年 漫漫. All rights reserved.
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

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    LXSegmentedControlTypeCenterScroll, // 滚动风格
    LXSegmentedControlTypeEndScroll, // 静止风格
} LXSegmentedControlScrollType;  // 默认为滚动风格
@class LXSegmentControl;
@protocol LXSegmentControlDelegate<NSObject>
-(void)LXSegmentControl:(LXSegmentControl *)segmentControl didSelectBtnAtIndex:(NSInteger)index;
@end;
@interface LXSegmentControl : UIScrollView
//对象方法创建 LXSegmentControl
-(instancetype)initWithFrame:(CGRect)frame delegate:(id <LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr;
//类方法创建 LXSegmentControl
+(instancetype)segmentControlWithFrame:(CGRect)frame delegate:(id <LXSegmentControlDelegate>)delegate titleArr:(NSArray *)titleArr;

@property(nonatomic,weak)id <LXSegmentControlDelegate> SeDelegate;

@property(nonatomic,assign)LXSegmentedControlScrollType scrollType;

///** 标题选中颜色改变以及指示器位置变化 */
- (void)titleBtnSelectedWithScrollView:(UIScrollView *)scrollView;

@end
