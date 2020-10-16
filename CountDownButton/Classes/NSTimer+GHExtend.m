//
//  NSTimer+GHExtend.m
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/6.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import "NSTimer+GHExtend.h"

#define ZKWIgnoredPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

/**
 *  timer的弱引用目标对象，和消息转发者功能类似。
 *
 *  @class GHTimerWeakTarget
 */
@interface GHTimerWeakTarget:NSObject

// timer的原始目标对象
@property (nonatomic, weak)id timerTarget;

// timer的原始轮询回调
@property (nonatomic, assign)SEL timerRunLoopMethod;

@end

@implementation GHTimerWeakTarget

/**
 *  利用该方法实现timer方法原始回调的中转
 *
 *  @param timer timer
 */
-(void)weakTargetCallBack:(NSTimer *)timer
{
    // 如果timer的原始目标对象存在
    if (_timerTarget)
    {
        // 原始目标对象执行原始的轮训回掉方法
        ZKWIgnoredPerformSelectorLeakWarning([_timerTarget performSelector:_timerRunLoopMethod withObject:timer]);
        // 如果timer的原始目标对象不存在，销毁定时器
    }
    else
    {
        // 销毁定时器
        [timer invalidate];
    }
}

@end

@implementation NSTimer (GHExtend)

/**
 *  创建一个不会强引用target的NSTimer，等价于：
    + (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                        target:(id)aTarget
                                        selector:(SEL)aSelector
                                        userInfo:(nullable id)userInfo
                                        repeats:(BOOL)yesOrNo
 *  @param ti        同原始方法参数一样
 *  @param aTarget   同原始方法参数一样
 *  @param aSelector 同原始方法参数一样
 *  @param userInfo  同原始方法参数一样
 *  @param yesOrNo   同原始方法参数一样
 *
 *  @return 同原始方法参数一样
 */
+ (NSTimer *)ghScheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                       target:(id)aTarget
                                     selector:(SEL)aSelector
                                     userInfo:(nullable id)userInfo
                                      repeats:(BOOL)yesOrNo
{
    GHTimerWeakTarget * weakTarget = [GHTimerWeakTarget new];
    [weakTarget setTimerTarget:aTarget];
    [weakTarget setTimerRunLoopMethod:aSelector];
    return [self scheduledTimerWithTimeInterval:ti
                                         target:weakTarget
                                       selector:@selector(weakTargetCallBack:)
                                       userInfo:userInfo
                                        repeats:yesOrNo];
}

/**
 *  创建一个不会强引用target的NSTimer，等价于：
    + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti
                                target:(id)aTarget
                                selector:(SEL)aSelector
                                userInfo:(nullable id)userInfo
                                repeats:(BOOL)yesOrNo;
 *  @param ti        同原始方法参数一样
 *  @param aTarget   同原始方法参数一样
 *  @param aSelector 同原始方法参数一样
 *  @param userInfo  同原始方法参数一样
 *  @param yesOrNo   同原始方法参数一样
 *
 *  @return 同原始方法参数一样
*/
+ (NSTimer *)ghTimerWithTimeInterval:(NSTimeInterval)ti
                              target:(id)aTarget
                            selector:(SEL)aSelector
                            userInfo:(id)userInfo
                             repeats:(BOOL)yesOrNo
{
    GHTimerWeakTarget * weakTarget = [GHTimerWeakTarget new];
    [weakTarget setTimerTarget:aTarget];
    [weakTarget setTimerRunLoopMethod:aSelector];
    return [self timerWithTimeInterval:ti
                                target:weakTarget
                              selector:@selector(weakTargetCallBack:)
                              userInfo:userInfo
                               repeats:yesOrNo];
}

/**
 *  暂停定时器
 */
- (void)pauseTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate distantFuture]];
}

/**
 *  继续开启定时器
 */
- (void)resumeTimer
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate date]];
}

/**
 * 指定时间后继续开启定时器
 *
 * @param interval 指定的时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
