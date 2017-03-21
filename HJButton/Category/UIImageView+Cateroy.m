//
//  UIImageView+Cateroy.m
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import "UIImageView+Cateroy.h"

@implementation UIImageView (Cateroy)

+ (UIImageView *)kds_createImageViewWithFrame:(CGRect)frame imageName:(NSString *)imgName {
    return [self kds_createImageViewWithFrame:frame Image:[UIImage imageNamed:imgName]];
}

+ (UIImageView *)kds_createImageViewWithFrame:(CGRect)frame Image:(UIImage *)image {
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:frame];
    if (image) {
        imgView.image = image;
    }
    return imgView;
}


@end
