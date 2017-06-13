//
//  FunctionWindow.h
//  DesktopFunctionBall
//
//  Created by 茭白 on 2017/6/13.
//  Copyright © 2017年 茭白. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kscreenWidth [[UIScreen mainScreen] bounds].size.width
#define kscreenHeight [[UIScreen mainScreen] bounds].size.height
static CGFloat const gestureMinimumTranslation = 20.0 ;


/*
 前提说明：
 总结：
 
 应该是在ios9中，对应程序启动时的uiwindow处理有了调整。
 
 有网友说，xcode7后，多个uiwindow时，都需要有rootViewController。
 
 从上面的测试过程中，应该不全对，只是在启动过程中，未完全结束时，对多个uiwindow有要求。
 
 从uiwindow.h文件描述中，是这样定义的，@property(nullable,nonatomic,strong)UIViewController *rootViewControllerNS_AVAILABLE_IOS(4_0); // default is nil，
 
 是nullable，是允许未nil的，也可以算是一次侧面说明。
 **/


/**
 针对 CGFloat const gestureMinimumTranslation = 20.0
 问题描述：以上代码放在在.h 文件中模拟器运行失败
 解决方法：1：放在.m 文件就好了
 2：在.h 中加上static 也可以
 3：或者用#define gestureMinimumTranslation 20
 
 
 原因：
 1；局部常量：用static修饰后，不能提供外界访问  这个static CGFloat const gestureMinimumTranslation = 20.0 ;就属于局部常量
 
 2：const NSString *HSCoder = @"汉斯哈哈哈";全局常量：不管你定义在任何文件夹，外部都能访问
 
 3：三种写法
 1.const NSString *HSCoder = @"汉斯哈哈哈";
 2.NSString const *HSCoder = @"汉斯哈哈哈";
 3.NSString * const HSCoder = @"汉斯哈哈哈";
 解释 ：
 本质上：第一，第二种写法是一致的。
 可以通过
 NSString *p=哈哈
 HSCoder =&p
 改变值（虽然通过HSCoder =p不行，但是这个是改变指针位置的）
 
 第三种：
 NSString *p=哈哈
 HSCoder =p可以但是只是改变 指针位置
 HSCoder =&p是不行的
 */

typedef enum : NSInteger {
    
    kCameraMoveDirectionNone,//没有动
    
    kCameraMoveDirectionUp,//向上
    
    kCameraMoveDirectionDown,//向下
    
    kCameraMoveDirectionRight,//向右
    
    kCameraMoveDirectionLeft //向左
    
} CameraMoveDirection ;//描述手动的方向


@protocol FunctionWindowDelegate <NSObject>




/**
 *  必须实现代理的写法
 */
/*
 @required
 - (void)tapWindowClick;
 */
/**
 *  非必须实现代理的写法
 */
@optional
- (void)tapWindowClick;
@end

@interface FunctionWindow : UIWindow
@property (nonatomic, assign)id <FunctionWindowDelegate> fasterDelegate;
- (instancetype)initWithFrame:(CGRect)frame;
- (void)show;
-(void)hidden;
@end
