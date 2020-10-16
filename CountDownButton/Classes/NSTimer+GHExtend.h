//
//  NSTimer+GHExtend.h
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/6.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (GHExtend)

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
+(NSTimer *)ghScheduledTimerWithTimeInterval:(NSTimeInterval)ti
                                       target:(id)aTarget
                                     selector:(SEL)aSelector
                                     userInfo:(nullable id)userInfo
                                      repeats:(BOOL)yesOrNo;
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
+(NSTimer *)ghTimerWithTimeInterval:(NSTimeInterval)ti
                              target:(id)aTarget
                            selector:(SEL)aSelector
                            userInfo:(id)userInfo
                             repeats:(BOOL)yesOrNo;

/**
 *  暂停定时器
 */
- (void)pauseTimer;

/**
 *  继续开启定时器
 */
- (void)resumeTimer;

/**
 * 指定时间后继续开启定时器
 *
 * @param interval 指定的时间
 */
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end

NS_ASSUME_NONNULL_END
