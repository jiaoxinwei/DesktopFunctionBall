//
//  BaseNavigationViewController.h
//  RedPacket
//
//  Created by chendy on 15/12/25.
//  Copyright © 2015年 chendy. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BaseNavigationViewController : UINavigationController


/**
 *  设置状态栏是否透明 透明是完全透明，不透明是完全不透明（不是那种磨砂的半透明）
 *
 *  @param transparent 是否透明
 */
- (void)setNavBarTransparent:(BOOL)transparent;

/**
 *  设置状态栏为系统默认，这个设置的话，如果navBar.translucent = YES那么就是磨砂半透明的系统那种 如果为NO 就是完全不透明的那种
 */
- (void)setNavBarDefault;

/**
 *  设置状态栏的alpha 值
 *
 *  @param alpha 值，这个是setNavBarTransparent:方法的变化过程，变化范围在setNavBarTransparent:范围内，由完全透明变成完全不透明
 */
- (void)setNavBarTransparentAlpha:(CGFloat)alpha;

/**
 *  控制nav的偏移
 *
 *  @param translationY 偏移值
 */
- (void)setNavBarTranslationY:(CGFloat)translationY;

@end
