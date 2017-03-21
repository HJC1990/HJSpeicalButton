//
//  UIImageView+Cateroy.h
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIImageView (Cateroy)


/*
 * 创建图片
 */
/**
 *  创建图片
 *
 *  @param frame   frame
 *  @param imgName 图片名称
 *
 *  @return imageView对象
 */
+ (UIImageView *)kds_createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imgName;

/**
 *  创建图片对象用 图片
 *
 *  @param frame  frame
 *  @param image  image
 *
 *  @return 对象
 */
+ (UIImageView *)kds_createImageViewWithFrame:(CGRect)frame Image:(UIImage *)image;


@end
