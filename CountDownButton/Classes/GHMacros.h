//
//  GHMacros.h
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/2.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#ifndef GHMacros_h
#define GHMacros_h

#define GH_NET_WORK_DEBUG 1

// app版本号
#define GH_VERSION_CODE @"1.0.3"

#define mc_Is_iphone ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
#define mc_Is_iphoneX SCREEN_WIDTH >= 375.0f && SCREEN_HEIGHT >= 812.0f && mc_Is_iphone

/*设置屏幕宽度尺寸*/
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
/*设置屏幕高度尺寸*/
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
/*状态栏高度*/
#define STATUS_BAR_HIGHT (CGFloat)(mc_Is_iphoneX?(44.0):(20.0))
/*导航栏高度*/
#define NAV_BAR_HEIGHT (44)
/*状态栏和导航栏总高度*/
#define NAV_BAR_AND_STATUS_BAR_HEIGHT (CGFloat)(mc_Is_iphoneX?(88.0):(64.0))
/*TabBar高度*/
#define TAB_BAR_HEIGHT (CGFloat)(mc_Is_iphoneX?(49.0 + 34.0):(49.0))
/*TabBar底部安全区域高度*/
#define TOOLH (mc_Is_iphoneX ? 34 : 0)
/*设置RGB颜色*/
#define GHRGB(x, y, z) [UIColor colorWithRed:(x / 255.0) green:(y / 255.0) blue:(z / 255.0) alpha:1]
/*设置RGB颜色带透明度*/
#define GHRGBALPHA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
/*rgb颜色转换（16进制->10进制）*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/*设置RGB颜色生成图片*/
#define GH_IMAGE_WITH_RGB(r, g, b) [GHImageByColor GetImageWithColor:GHRGB(r, g, b)]
/*按照6P屏幕的比例适配尺寸*/
#define GH_SCREEN_SIZE(value) ((value) / 414.0f * [UIScreen mainScreen].bounds.size.width)
/*按照6s屏幕的比例适配尺寸*/
#define GH_SCREEN_HEIGHT_SIZE(value) ((value) / 667.0f * [UIScreen mainScreen].bounds.size.height)
/*偏好设置*/
#define SEEKPLISTTHING(KEY)     [[NSUserDefaults standardUserDefaults]objectForKey:KEY]
#define DEPOSITLISTTHING(VALUE,KEY)  [[NSUserDefaults standardUserDefaults] setObject:VALUE forKey:KEY]

//** 沙盒路径 ***********************************************************************************
#define PATH_OF_APP_HOME        NSHomeDirectory()
#define PATH_OF_TEMP            NSTemporaryDirectory()
#define PATH_OF_DOCUMENT        [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]
// 历史搜索plist文件存储路径
#define PATH_OF_HISTORY_SEARCH  [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"GHSearchHistories.plist"]

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
                                \
                                [View.layer setCornerRadius:(Radius)];\
                                [View.layer setMasksToBounds:YES];\
                                [View.layer setBorderWidth:(Width)];\
                                [View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
                                \
                                [View.layer setCornerRadius:(Radius)];\
                                [View.layer setMasksToBounds:YES]

// 转换为字符串
#define TEXT_STRING(x) [NSString stringWithFormat:@"%@",x]
// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":TEXT_STRING(x)

// 个人信息
#define USER_ID @"GHAPP_UserId"
#define IS_LOGIN (((NSString *)SEEKPLISTTHING(USER_ID)).length > 0)
#define GH_USER_ID IF_NULL_TO_STRING(((NSString *)SEEKPLISTTHING(USER_ID)))
// 是否为新人
#define NEWUSER_STATUS @"GHAPP_NewStatus"
#define IS_NEWUSER ![SEEKPLISTTHING(NEWUSER_STATUS) boolValue]

// 手机网络发生变化通知名称
#define NET_WORK_CHANGE @"kReachabilityChangedNotification"

// 弱引用设置
#define ASK_WEAK_SELF           @weakify(self)
// 强引用设置
#define ASK_STRONG_SELF         @strongify(self)

#endif /* GHMacros_h */
