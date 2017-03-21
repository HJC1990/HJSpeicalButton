//
//  NSString+help.h
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kListEmptyString      @"ABC123"    //如果是这个字符串，列表显示时显示空

@interface NSString (help)

/**
 *  查检string是否为null，如果是null或"ABC123"转成""
 *
 *  @param string 被检string
 *
 *  @return string或""
 */
+ (NSString *)kds_changeNullStringToEmpty:(NSString *)string;

/**
 *  检查字符串---如果是空换成两水平线"--"、如果是"ABC123"转成""
 *
 *  @param string 被查string
 *  @param warning 此方法主要是行情列表中使用"ABC123"是自选股最后一行不显示，"--"显示是为了列表下面空单元格统一显示"--"
 *
 *  @return 查后返回string
 */
+ (NSString *)kds_checkStringToTwoHorizontalLine:(NSString *)string;

/**
 *  查检转成float小于0设置成两水平线
 *
 *  @param string 被查string
 *
 *  @return 查后返回string
 */
+ (NSString *)kds_checkStringFloatZero:(NSString *)string;

/**
 *  查检字符串---如果是NSNull 需要处理成nil
 *
 *  @param string 被查string
 *
 *  @return 查后返回string
 */
+ (NSString *)kds_checkStringNSNullString:(NSString *)string;

/**
 *  查询一个字符串内是否包含另一字符串
 *
 *  @param string    主字符串
 *  @param subString 子字符串
 *
 *  @return YES：包含  NO：不包含
 */
+ (BOOL)kds_isContainsString:(NSString *)string withSubString:(NSString *)subString;



/**
 *  http地址改成https
 *
 *  @param httpurl url
 *
 *  @return 返回https协议以及端口号
 */
+ (NSString *)kds_httpToHttpsUrl:(NSString *)httpurl httpsPort:(NSString *)httpsPort;

/**
 *  删除最后的字符如果跟提供的字符一样，字符可以为多个
 *
 *  @param chara 提供的字符
 *  @param originStr 原始字符串
 *
 *  @return
 */
+ (NSString *)kds_deleteLastCharaIfMatch:(NSString *)chara originStr:(NSString *)originStr;

/**
 *  获取字体的size
 *
 *  @param string   字体内容
 *  @param maxSize  最大宽
 *  @param textFont 字体大小
 *
 *  @return 字体size
 */
+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont;

/**
 *  获取字体的size
 *
 *  @param string     字体内容
 *  @param maxSize    最大宽
 *  @param textFont   字体大小
 *  @param attributes 字体网络
 *
 *  @return 字体size
 */
+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont with:(NSDictionary *)attributes;

/**
 *  获取string的size 一行
 *
 *  @param string
 *  @param textFont 字体大小
 *
 *  @return 字体size
 *
 *  @exception
 */
+ (CGSize)kds_stringSize:(NSString *)string withTextFont:(UIFont *)textFont;

/**
 *  获取字体的size
 *
 *  @param string     字体内容
 *  @param maxSize    最大宽
 *  @param textFont   字体大小
 *  @param lineSpacing 行距
 *
 *  @return 字体size
 */
+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont withlineSpacing:(CGFloat)lineSpacing;
/**
 *  把string画到屏幕
 *
 *  @param point  开始点
 *  @param font   字体
 *  @param string
 *
 *  @return 组画的结果
 *
 *  @exception
 */
+ (BOOL)kds_drawAtPoint:(CGPoint)point withFont:(UIFont *)font withColor:(UIColor *)color withString:(NSString *)string;

/**
 *  把string进行md5加密
 *
 *  @return 加密后的string
 */
- (NSString *)md5Encrypt;



@end
