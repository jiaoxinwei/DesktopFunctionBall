//
//  JBMainViewController.m
//  DesktopFunctionBall
//
//  Created by 茭白 on 2017/6/13.
//  Copyright © 2017年 茭白. All rights reserved.
//

#import "JBMainViewController.h"

@interface JBMainViewController ()<FunctionWindowDelegate>
@property (nonatomic ,strong) FunctionWindow  *functionWindow;

@end

@implementation JBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showFasterWindow];
    // Do any additional setup after loading the view.
}
- (void)showFasterWindow {
    
    if (!((AppDelegate*)[UIApplication sharedApplication].delegate).fasterWindow) {
        _functionWindow
        =[[FunctionWindow alloc]initWithFrame:CGRectMake(kscreenWidth-60-8, 250, 60, 60)];
        [self performSelector:@selector(showTw) withObject:nil afterDelay:5.0];
        _functionWindow.fasterDelegate=self;
        ((AppDelegate*)[UIApplication sharedApplication].delegate).fasterWindow=_functionWindow;
        [_functionWindow show];
    }
    else
    {
        [((AppDelegate*)[UIApplication sharedApplication].delegate).fasterWindow setHidden:NO];
    }
    
    
}
#pragma mark--delegate;
- (void)tapWindowClick
{
    NSLog(@"不要想念我");
}

- (void)showTw {
    [UIView animateWithDuration:1.0 animations:^{
        
        
        [_functionWindow setAlpha:0.8];
        
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
