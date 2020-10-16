//
//  GHImageByColor.h
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/10.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GHImageByColor : NSObject

/**
 * 根据颜色生成图片
 *
 * @param color 生成图片所需的颜色
 */
+ (UIImage*)GetImageWithColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
