//
//  BaseNavigationViewController.m
//  RedPacket
//
//  Created by chendy on 15/12/25.
//  Copyright © 2015年 chendy. All rights reserved.
//

#import "BaseNavigationViewController.h"


@interface BaseNavigationViewController ()

@end

@implementation BaseNavigationViewController

//@synthesize navigationBar;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = self.navigationBar;
    /**
     *  1，在View controller-based status bar appearance 为YES ,意思的是状态栏的样式依据viewController来，而不是Application
     *      ①，这种情况下默认的UINavigtionController UINavgationBar 设置UIBarStyleDefault：那么标题和状态栏就是黑色，
     *          UIBarStyleBlack： 那么标题和状态栏就是白色
     *      ②，如果是自定义的NavBar的话上面的判断就没有，①说的就没啥用了，要想设置状态栏颜色，需要重载ViewController preferredStatusBarStyle方法，
     *          这种方法对 ① 无效
     *  2，在View controller-based status bar appearance 为NO ,意思是状态栏设置的时候全局的Application，起作用，
     *     这时候单独在ViewController 重载preferredStatusBarStyle控制就没有效果了，需要使用[UIApplcation shareApplcation]setStateBarStyle
     */
    //navBar.barStyle = UIBarStyleBlack;                      //可以控制这个样式改变状态栏的颜色,还可以控制导航条的标题颜色
    //navBar.barTintColor = [UIColor whiteColor];            //导航栏的颜色
    //[navBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];                //单独控制当行条标题的颜色
    navBar.tintColor = [UIColor grayColor];        //控制返回按钮的颜色
    
    //UIBarButtonItem *barItem=[[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    //navBar.backItem.leftBarButtonItem=barItem;
//    navBar.backItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(goBack:)];
//    navBar.backIndicatorImage=[UIImage imageNamed:@"back"];
//
   // navBar.translucent = YES;                        //导航栏是否支持磨砂半透明 必须为YES UINavigationBar+Awesome.h 这个分类才有作用
    
    //移除导航条上的一条线
    //[navBar setShadowImage:[[UIImage alloc] init]];
    
    //self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];

   
    
}

-(void)goBack:(UIBarButtonItem *)item
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





@end
