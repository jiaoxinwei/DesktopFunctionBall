//
//  BaseViewController.h
//  RedPacket
//
//  Created by chendy on 15/12/21.
//  Copyright © 2015年 chendy. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface BaseViewController : UIViewController
{
    BOOL _statusBarHide;
    UIStatusBarStyle _cStatusBarStyle;
    
    BOOL _cNavBarTransparent;
    BOOL _cNavBarHidden;
    
    BOOL _isOpenNoticeTaskServer;
    NSMutableArray *_taskActions;
}

@property (assign,nonatomic) BOOL statusBarHide;                //状态栏是否隐藏
@property (assign,nonatomic) UIStatusBarStyle cStatusBarStyle;   //状态栏的样式，是黑是白

@property (assign,nonatomic) BOOL cNavBarTransparent;                //当航条是否透明
@property (assign,nonatomic) BOOL cNavBarHidden;                     //导航条是否隐藏


@property (assign,nonatomic) BOOL isOpenNoticeTaskServer;           //是否开始本页面的通知任务监听
@property (strong,nonatomic,readonly) NSMutableArray *taskActions;  //通知刷新任务集合

- (void)viewWillAppearPerformTaskActions;
- (void)endPerformTaskRemoveAllActions;

//进度指示器控制
- (void)showProgress;
- (void)dismissProgress;

- (void)showProgressSuccess:(NSString *)string;
- (void)showProgressSuceess:(NSString *)string dismissTimeInterval:(NSTimeInterval)timeval;

- (void)showProgressError:(NSString *)string;
- (void)showProgressError:(NSString *)string dismissTimeInterval:(NSTimeInterval)timeval;


@end
