//
//  GHCountdownButton.m
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/6.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import "GHCountdownButton.h"
#import "GHImageByColor.h"
#import "NSTimer+GHExtend.h"
#import "GHMacros.h"

@interface GHCountdownButton ()

// 按钮倒计时定时器
@property (nonatomic, strong)NSTimer *currentTimer;
// 倒计时秒数
@property (nonatomic, assign)NSUInteger second;
// 倒计时进行中回调
@property (nonatomic, copy) void(^timerProcessBlock)(NSUInteger second);
// 倒计时结束回调
@property (nonatomic, copy) void(^timerComplateBlock)(void);

@end

@implementation GHCountdownButton

/**
 * 展示倒计时按钮
 *
 * @param frame 按钮frame
 */
- (instancetype)initCountdownButtonWithFrame:(CGRect)frame totalSecond:(NSUInteger)totalSecond {
   
    if (self = [super initWithFrame:frame]) {
        // 初始化设置
        [self initialization];
        // 初始化总时长
        self.totalSecond = totalSecond;
    }
    return self;
}

/**
 * 按钮释放，销毁定时器
 */
- (void)dealloc {
    [self stopTime];
}

/**
 * 初始化设置
 */
- (void)initialization {
    [self setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self setTitleColor:GHRGB(7, 184, 96) forState:UIControlStateNormal];
    [self setBackgroundImage:GH_IMAGE_WITH_RGB(204, 204, 204) forState:UIControlStateDisabled];
    self.nomalBgColor = GHRGB(242, 242, 242);
    self.disableBgColor = [UIColor clearColor];
    self.totalSecond = 60;
    self.cornerRadius = 14.0f;
}

/**
 * 不同情况的
 */
- (void)setNomalBgColor:(UIColor *)nomalBgColor {
    _nomalBgColor = nomalBgColor;
    [self setBackgroundImage:[GHImageByColor GetImageWithColor:nomalBgColor] forState:UIControlStateNormal];
}

/**
 * 设置标题
 */
- (void)setTitle:(NSString *)title {
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}

/**
 * 设置标题样式
 */
- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

/**
 * 设置标题颜色
 */
- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}

/**
 * 设置按钮圆角
 */
- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

/**
 * 设置按钮是否有效
 */
- (void)setBtnEnable:(BOOL)btnEnable {
    _btnEnable = btnEnable;
    self.enabled = btnEnable;
}

/**
 *  倒计时总时长
 */
- (void)setTotalSecond:(NSUInteger)totalSecond
{
    _totalSecond = totalSecond;
}

/**
 * 开始倒计时
 *
 * @param fire 是否立即执行
 * @param userInteractionEnabled 按钮手势是否有效
 */
- (void)zkwStartTimeIsFire:(BOOL)fire userInteractionEnabled:(BOOL)userInteractionEnabled {
    // 设置倒计时时间为总时长
    self.second = self.totalSecond;
    // 按钮手势失效
    self.userInteractionEnabled = userInteractionEnabled;
    // 显示倒计时背景色
    [self setBackgroundImage:[GHImageByColor GetImageWithColor:self.disableBgColor] forState:UIControlStateNormal];
    // 开启定时器
    self.currentTimer = [NSTimer ghScheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
    // 立即执行
    if (fire) {
        [self.currentTimer fire];
    }    
    // 设置runloop防止滚动定时器被暂停
    [[NSRunLoop mainRunLoop] addTimer:self.currentTimer forMode:NSRunLoopCommonModes];
    
}

/**
 * 倒计时方法
 */
- (void)timerFire {
    // 倒计时
    self.second --;
    if (self.second <= 0) {
        // 定时器销毁
        [self stopTime];
        // 倒计时结束回调
        if (self.timerComplateBlock) {
            self.timerComplateBlock();
        }
        return;
    }
    // 倒计时进行中回调
    if (self.timerProcessBlock) {
        self.timerProcessBlock(self.second);
    }
}

/**
 * 停止倒计时
 */
- (void)stopTime {
    // 如果定时器有效
    if ([self.currentTimer isValid]) {
        // 销毁定时器
        [self.currentTimer invalidate];
        // 定时器置空
        self.currentTimer = nil;
        // 重新设置定时器倒计时时间
        self.second = self.totalSecond;
        // 设置倒计时按钮点击手势有效
        self.userInteractionEnabled = YES;
        // 重置倒计时按钮背景色
        [self setBackgroundImage:[GHImageByColor GetImageWithColor:self.nomalBgColor] forState:UIControlStateNormal];
    }
}

/**
 *  获取倒计时进度
 *
 *  @param timerProcessBlock  倒计时进度
 *  @param timerComplateBlock 计时完成回调
 */
- (void)zkwTimerProcessBlock:(void (^)(NSUInteger))timerProcessBlock timerComplateBlock:(void (^)(void))timerComplateBlock {
    self.timerProcessBlock = [timerProcessBlock copy];
    self.timerComplateBlock = [timerComplateBlock copy];
}

@end
