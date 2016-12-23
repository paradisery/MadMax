//
//  newsVC.m
//  MadMax+
//  5850bb80
//  Created by ruany on 2016/12/14.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "newsVC.h"
#import "ISRDataHelper.h"
#import <iflyMSC/iflyMSC.h>
#import <iflyMSC/IFlyRecognizerViewDelegate.h>
#import <iflyMSC/IFlyRecognizerView.h>
@interface newsVC ()<IFlyRecognizerViewDelegate>
{
    IFlyRecognizerView * _iflyRecognizerView;
}
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation newsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    //避免同时产生多个按钮事件
    [self setExclusiveTouchForButtons:self.view];
    
    
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",@"5850bb80"];
    [IFlySpeechUtility createUtility:initString];
    
    
    
}
-(void)ifly{
    //初始化语音识别控件
    _iflyRecognizerView = [[IFlyRecognizerView alloc] initWithCenter:self.view.center];
    _iflyRecognizerView.delegate = self;
    [_iflyRecognizerView setParameter: @"iat" forKey: [IFlySpeechConstant IFLY_DOMAIN]];
    //asr_audio_path保存录音文件名，如不再需要，设置value为nil表示取消，默认目录是documents
    [_iflyRecognizerView setParameter:@"asrview.pcm " forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    //启动识别服务
    [_iflyRecognizerView start];
}
/*识别结果返回代理
 @param resultArray 识别结果
 @ param isLast 表示是否最后一次结果
 */
- (void)onResult: (NSArray *)resultArray isLast:(BOOL) isLast
{
    NSMutableString *result = [[NSMutableString alloc] init];
    NSDictionary *dic = [resultArray objectAtIndex:0];
    
    for (NSString *key in dic) {
        [result appendFormat:@"%@",key];
    }
    
    NSString * resultFromJson =  [ISRDataHelper stringFromJson:result];
    _textView.text = [NSString stringWithFormat:@"%@%@", _textView.text,resultFromJson];
    
    
//    _textView.text = [NSString stringWithFormat:@"%@%@",_textView.text,result];
//    _textView.text=result;
}
/*识别会话错误返回代理
 @ param  error 错误码
 */
- (void)onError: (IFlySpeechError *) error
{
    NSLog(@"error:%@",error);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    [self ifly];
}

/**
 设置UIButton的ExclusiveTouch属性
 ****/
-(void)setExclusiveTouchForButtons:(UIView *)myView
{
    for (UIView * button in [myView subviews]) {
        if([button isKindOfClass:[UIButton class]])
        {
            [((UIButton *)button) setExclusiveTouch:YES];
        }
        else if ([button isKindOfClass:[UIView class]])
        {
            [self setExclusiveTouchForButtons:button];
        }
    }
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
