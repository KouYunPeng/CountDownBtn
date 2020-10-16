//
//  GHImageByColor.m
//  GHShop
//
//  Created by 寇云鹏 on 2020/7/10.
//  Copyright © 2020 TANetwork. All rights reserved.
//

#import "GHImageByColor.h"

@implementation GHImageByColor

/**
 * 根据颜色生成图片
 *
 * @param color 生成图片所需的颜色
 */
+ (UIImage *)GetImageWithColor:(UIColor *)color
{
    CGRect r = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

@end
