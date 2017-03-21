//
//  UIImage+category.h
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)

/**
 *  剪裁图片
 *
 *  @param image 原图片
 *  @param inset 剪裁比例
 *
 *  @return 剪裁后图片
 */
+ (UIImage *)kds_circleImage:(UIImage *)image withParam:(CGFloat)inset;

/**
 *  压缩图片
 *
 *  @param imgSrc 原图片
 *  @param size   压缩到的大小
 *
 *  @return 压缩后图片
 *
 */
+ (UIImage *)kds_compressImage:(UIImage *)imgSrc compressToSize:(CGSize)size;

/**
 *  截屏
 *
 *  @return 返回图片
 */
+ (UIImage *)kds_screenshot;

/**
 *  颜色转成图片
 *
 *  @param color 颜色
 *
 *  @return 图片
 */
+ (UIImage *)kds_imageWithColor:(UIColor *)color;



/* 调整图片大小 */
- (UIImage *)kds_TransformtoSize:(CGSize)Newsize;

@end
