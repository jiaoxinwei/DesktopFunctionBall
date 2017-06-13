//
//  FunctionWindow.m
//  DesktopFunctionBall
//
//  Created by 茭白 on 2017/6/13.
//  Copyright © 2017年 茭白. All rights reserved.
//

#import "FunctionWindow.h"




@implementation FunctionWindow
{
    CameraMoveDirection direction;
}
- (id)initWithFrame:(CGRect)frame {
    
    self=[super initWithFrame:frame];
    
    if (self) {
        
        self.windowLevel = UIWindowLevelAlert;
        self.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"wo"]];
        self.frame=frame;
        //[self setAlpha:0.5];
        self.layer.cornerRadius = frame.size.width*0.5;
        self.layer.masksToBounds = YES;
        //拖动手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pan];
        //点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)];
        [self addGestureRecognizer:tap];
        
        
    }
    
    
    return self;
}

- (void)locationChange:(UIPanGestureRecognizer *)pan {
    
    //拖动时候控件的移动
    /*
     在指定的视图坐标系统中转换(拖动？) pan gesture
     返回参数：返回一个明确的新的坐标位置，在指定的父视图坐标系统中
     简单的理解就是
     该方法返回在横坐标上、纵坐标上拖动了多少像素
     因为拖动起来一直是在递增，所以每次都要用setTranslation:方法制0这样才不至于不受控制般滑动出视图
     */
    CGPoint point = [pan translationInView:self];
    //NSLog(@"%f,%f",point.x,point.y);
    
    //找到当前的视图的中心坐标
    
    CGPoint center=self.center;
    //计算拖动后 新的中心坐标
    CGFloat offsetX=center.x+point.x;
    CGFloat offsetY=center.y+point.y;
    
    //
    CGFloat w = self.frame.size.width / 2;
    CGFloat h = self.frame.size.height / 2;
    
    if (offsetX < w) {
        offsetX = w;
    } else if (offsetX > kscreenWidth - w) {
        offsetX = kscreenWidth - w;
    }
    
    if (offsetY < h) {
        offsetY = h;
    } else if (offsetY > kscreenHeight - h) {
        offsetY = kscreenHeight - h;
    }
    //确定新的位置坐标
    CGPoint movedCenter = CGPointMake(offsetX, offsetY);
    
    
    
    //pan.state  是拖动时候的处于的状态
    if (pan.state == UIGestureRecognizerStateChanged) {
        //拖动开始时候
        self.center = movedCenter;
        [pan setTranslation:CGPointZero inView:self];
    }
    else if (pan.state == UIGestureRecognizerStateEnded) {
        //拖动结束的时候
        [UIView animateWithDuration:0.2 animations:^{
            if (movedCenter.x>=kscreenWidth*0.5)
            {
                self.center=CGPointMake(kscreenWidth-60-8+24,movedCenter.y);
            }
            else
            {
                self.center=CGPointMake(8+30,movedCenter.y);
            }
            // self.center = movedCenter;
        } completion:^(BOOL finished) {
            [pan setTranslation:CGPointZero inView:self];
        }];
    }
    
    
    /**
     *  描述手移动方向
     */
    if (pan.state == UIGestureRecognizerStateBegan )
        
    {
        
        direction = kCameraMoveDirectionNone;
        
    }
    
    else if (pan.state == UIGestureRecognizerStateChanged && direction == kCameraMoveDirectionNone)
        
    {
        
        direction = [ self determineCameraDirectionIfNeeded:point];
        
        // ok, now initiate movement in the direction indicated by the user's gesture
        
        switch (direction) {
                
            case kCameraMoveDirectionDown:
                
                NSLog (@ "Start moving down" );
                
                break ;
                
            case kCameraMoveDirectionUp:
                
                NSLog (@ "Start moving up" );
                
                break ;
                
            case kCameraMoveDirectionRight:
                
                NSLog (@ "Start moving right" );
                
                break ;
                
            case kCameraMoveDirectionLeft:
                
                NSLog (@ "Start moving left" );
                
                break ;
                
            default :
                
                break ;
                
        }
        
    }
    
    else if (pan.state == UIGestureRecognizerStateEnded )
        
    {
        
        // now tell the camera to stop
        
        NSLog (@ "Stop" );
        
    }
    
    
    
}

- (void)click:(UITapGestureRecognizer *)tap {
    //很明显这个方法是点击跳转的 所以涉及到具体的两个具体的页面 这里需要实现代理
    /**
     *  必须实现代理的写法
     */
    /*
     [self.delegate tapWindowClick];
     */
    /**
     *  非必须实现代理的写法
     */
    
    
    /**
     *  加条件判断
     *  第一个条件是 必须在其他地方声明delegate
     *  第二个条件是 必须在调用页面实现 代理方法
     *  当上面的两个条件同时满足时 才调用我们crash的代理 这样就不会因为没有实现方法 而造成crash
     */
    if (self.fasterDelegate && [self.fasterDelegate respondsToSelector:@selector(tapWindowClick)]) {
        [self.fasterDelegate tapWindowClick];
    }
    
    
}
- (void)show {
    [self setHidden:NO];
}
-(void)hidden {
    
    [self setHidden:YES];
}
- ( CameraMoveDirection )determineCameraDirectionIfNeeded:( CGPoint )translation

{
    
    if (direction != kCameraMoveDirectionNone)
        
        return direction;
    
    // determine if horizontal swipe only if you meet some minimum velocity
    
    if (fabs(translation.x) > gestureMinimumTranslation)
        
    {
        
        BOOL gestureHorizontal = NO;
        
        if (translation.y == 0.0 )
            
            gestureHorizontal = YES;
        
        else
            
            gestureHorizontal = (fabs(translation.x / translation.y) > 5.0 );
        
        if (gestureHorizontal)
            
        {
            
            if (translation.x > 0.0 )
                
                return kCameraMoveDirectionRight;
            
            else
                
                return kCameraMoveDirectionLeft;
            
        }
        
    }
    
    // determine if vertical swipe only if you meet some minimum velocity
    
    else if (fabs(translation.y) > gestureMinimumTranslation)
        
    {
        
        BOOL gestureVertical = NO;
        
        if (translation.x == 0.0 )
            
            gestureVertical = YES;
        
        else
            
            gestureVertical = (fabs(translation.y / translation.x) > 5.0 );
        
        if (gestureVertical)
            
        {
            
            if (translation.y > 0.0 )
                
                return kCameraMoveDirectionDown;
            
            else
                
                return kCameraMoveDirectionUp;
            
        }
        
    }
    
    return direction;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
