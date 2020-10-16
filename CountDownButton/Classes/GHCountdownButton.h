//
//  GHCountdownButton.h
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/6.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHCountdownButton : UIButton

// 按钮标题
@property (nonatomic, strong)NSString *title;
// 按钮标题颜色
@property (nonatomic, strong)UIColor *titleColor;
// 按钮标题样式
@property (nonatomic, strong)UIFont *titleFont;
// 按钮普通情况背景色
@property (nonatomic, strong)UIColor *nomalBgColor;
// 按钮倒计时情况背景色
@property (nonatomic, strong)UIColor *disableBgColor;
// 按钮圆角
@property (nonatomic, assign)CGFloat cornerRadius;
// 按钮是否有效 YES有效 NO失效
@property (nonatomic, assign)BOOL btnEnable;
// 定时器总时长
@property (nonatomic, assign)NSUInteger totalSecond;

/**
 * 展示倒计时按钮
 *
 * @param frame 按钮frame
 * @param totalSecond 倒计时总时长
 */
- (instancetype)initCountdownButtonWithFrame:(CGRect)frame totalSecond:(NSUInteger)totalSecond;

/**
 *  获取倒计时进度
 *
 *  @param timerProcessBlock  倒计时进度
 *  @param timerComplateBlock 计时完成回调
 */
- (void)zkwTimerProcessBlock:(void (^)(NSUInteger second))timerProcessBlock timerComplateBlock:(void (^)(void))timerComplateBlock;

/**
 * 开始倒计时
 *
 * @param fire 是否立即执行
 * @param userInteractionEnabled 按钮手势是否有效
 */
- (void)zkwStartTimeIsFire:(BOOL)fire userInteractionEnabled:(BOOL)userInteractionEnabled;

/**
 * 停止倒计时
 */
- (void)stopTime;

@end

NS_ASSUME_NONNULL_END
