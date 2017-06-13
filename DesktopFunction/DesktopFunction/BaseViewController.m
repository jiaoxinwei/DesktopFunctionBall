//
//  BaseViewController.m
//  RedPacket
//
//  Created by chendy on 15/12/21.
//  Copyright © 2015年 chendy. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseNavigationViewController.h"
#import "AppDelegate.h"
@interface BaseViewController ()
{
}

@end

@implementation BaseViewController

@synthesize statusBarHide = _statusBarHide;
@synthesize cStatusBarStyle = _cStatusBarStyle;

@synthesize cNavBarTransparent = _cNavBarTransparent;
@synthesize cNavBarHidden = _cNavBarHidden;

@synthesize isOpenNoticeTaskServer = _isOpenNoticeTaskServer;
@synthesize taskActions = _taskActions;


#pragma mark - lifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _cStatusBarStyle = UIStatusBarStyleLightContent;
    [self setNeedsStatusBarAppearanceUpdate];
    //控制子页面返回按钮的文字,只能用self.navigationItem 用self.navigationController.navigationItem 没效果
    
    //在viewcontroller里面设置
   self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    
//    
//    //
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];

    
    if (_isOpenNoticeTaskServer)
    {
    }
    
    //设置进度提示的默认的配置信息
    [self setDefaultKVNProgressConfiguration];
}

- (void)rewriteNavigationBar{
    UIImage *image = [UIImage imageNamed:@"back"];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    if(!self.navigationItem.backBarButtonItem&&self.navigationController.viewControllers.count>1)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 0, 24, 40);
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(goBack_Swizzle) forControlEvents:UIControlEventTouchUpInside];
        
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = backItem;
        self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
        
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (_isOpenNoticeTaskServer)
    {   //开始执行队列任务
        [self viewWillAppearPerformTaskActions];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self endPerformTaskRemoveAllActions];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    
}

- (void)dealloc
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - setter method

- (void)setStatusBarHide:(BOOL)hide
{
    _statusBarHide = hide;
    [self setNeedsStatusBarAppearanceUpdate];
}
-(void)setCStatusBarStyle:(UIStatusBarStyle)cStatusBarStyle
{
    _cStatusBarStyle = cStatusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}
-(void)setCNavBarHidden:(BOOL)cNavBarHidden
{
    _cNavBarHidden = cNavBarHidden;
    [self.navigationController setNavigationBarHidden:cNavBarHidden animated:YES];
}
-(void)setCNavBarTransparent:(BOOL)cNavBarTransparent
{
    _cNavBarTransparent = cNavBarTransparent;
    BaseNavigationViewController *baseNav = (BaseNavigationViewController *)self.navigationController;
    [baseNav setNavBarTransparent:cNavBarTransparent];
}

- (void)setIsOpenNoticeTaskServer:(BOOL)isOpenNoticeTaskServer_
{
    _isOpenNoticeTaskServer = isOpenNoticeTaskServer_;
    
    if (_isOpenNoticeTaskServer)
    {   //初始化任务队列
        if (!_taskActions)
        {
            _taskActions = [NSMutableArray array];
        }
    }
    else
    {
        [_taskActions removeAllObjects];
    }
}

#pragma mark -
#pragma mark 接受到任务通知
- (void)didReceiveTashActionNotice:(NSNotification *)notice
{
    
}


- (void)viewWillAppearPerformTaskActions
{
    
}

- (void)endPerformTaskRemoveAllActions
{
    if (_taskActions) {
        
        [_taskActions removeAllObjects];
    }
}



#pragma mark ** 状态指示器相关 **
- (void)setDefaultKVNProgressConfiguration
{
   
    
}

- (void)showProgress
{
}
- (void)dismissProgress
{
}

- (void)showProgressSuccess:(NSString *)string
{
}
- (void)showProgressSuceess:(NSString *)string dismissTimeInterval:(NSTimeInterval)timeval
{
    
}

- (void)showProgressError:(NSString *)string
{
}
- (void)showProgressError:(NSString *)string dismissTimeInterval:(NSTimeInterval)timeval
{
    
}

#pragma mark - 重载控制ViewController 控制StateBar状态
- (BOOL)prefersStatusBarHidden
{
    return _statusBarHide;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return _cStatusBarStyle;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationSlide;
}



@end
