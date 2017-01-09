//
//  animation2.m
//  MadMax+
//
//  Created by ruany on 2016/12/26.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "animation2.h"
#import "UIView+Extension.h"
@interface animation2 ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *menuHeight;
@property (weak, nonatomic) IBOutlet UIButton *menuButton;

@end

@implementation animation2
{
    BOOL isMenuOpen;
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    self.view.frame=CGRectMake(0, 0, self.view.width, self.view.height+64);
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden=NO;
//    self.view.frame=CGRectMake(0, 0, self.view.width, self.view.height-64);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)duang:(id)sender {
    
    isMenuOpen = !isMenuOpen;
    _menuHeight.constant=isMenuOpen ? 200:64;
    [UIView animateWithDuration:1
                          delay:0
         usingSpringWithDamping:0.4
          initialSpringVelocity:10
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         [self.view layoutIfNeeded];
                         float angle=isMenuOpen ? M_PI_4:0;
                         self.menuButton.transform=CGAffineTransformMakeRotation(angle);
    } completion:^(BOOL finished) {
        
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
