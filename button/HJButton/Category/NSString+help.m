//
//  NSString+help.m
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import "NSString+help.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (help)

#pragma mark - 检查string
+ (NSString *)kds_changeNullStringToEmpty:(NSString *)string {
    return [string length] > 0 ? string : @"";
}

+ (NSString *)kds_checkStringToTwoHorizontalLine:(NSString *)string {
    if ([string isEqualToString:@"%"]
        || [string isEqualToString:@"(null)%"]
        || [string isEqualToString:@"(nil)%"]
        || [string length] <= 0) {
        return @"--";
    } else if ([kListEmptyString isEqualToString:string]) {
        return @"";
    } else {
        return string;
    }
}

+ (NSString *)kds_checkStringFloatZero:(NSString *)string {
    CGFloat strFloat = [string floatValue];
    if (strFloat <= 0) {
        return @"--";
    } else {
        return string;
    }
}

+ (NSString *)kds_checkStringNSNullString:(NSString *)string {
    if ([string isEqual:[NSNull null]]) {
        return nil;
    } else {
        return string;
    }
}

+ (BOOL)kds_isContainsString:(NSString *)string withSubString:(NSString *)subString {
    BOOL bContain = NO;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {  //8.0以上
        NSRange range = [string rangeOfString:subString];
        if (range.location == NSNotFound) {
            bContain = NO;
        }
        else {
            bContain = YES;
        }
    }
    else {
        bContain = [string containsString:subString];
    }
    
    return bContain;
}


#pragma mark - 转换（替换、删除、添加等）string
+ (NSString *)kds_httpToHttpsUrl:(NSString *)httpurl httpsPort:(NSString *)httpsPort {
    NSString *httpsUrl = httpurl;
    // 如果地址不是https的则拼接替换
    if (![httpsUrl hasPrefix:@"https://"]) {
        // 去掉http://   htp:// 等
        NSRange range = [httpsUrl rangeOfString:@"://"];
        if (range.location != NSNotFound) {
            httpsUrl = [httpsUrl substringFromIndex:range.location+range.length];
        }
        // 去掉端口号
        range = [httpsUrl rangeOfString:@":"];
        if (range.location != NSNotFound) {
            httpsUrl = [httpsUrl substringToIndex:range.location];
        }
        // 去除/
        range = [httpsUrl rangeOfString:@"/"];
        if (range.location != NSNotFound) {
            httpsUrl = [httpsUrl substringToIndex:range.location];
        }
        // 增加端口号
        httpsUrl = [NSString stringWithFormat:@"%@:%@/", httpsUrl, httpsPort];
        // 增加协议
        httpsUrl = [NSString stringWithFormat:@"https://%@", httpsUrl];
    }
    return httpsUrl;
}


+ (NSString *)kds_deleteLastCharaIfMatch:(NSString *)chara originStr:(NSString *)originStr {
    if (!originStr || !chara || [originStr length] < [chara length]) {
        return originStr;
    }
    
    NSString *retStr = [originStr copy];
    NSRange range = NSMakeRange([originStr length]-[chara length], [chara length]);
    NSString *tmpStr = [retStr substringWithRange:range];
    if ([tmpStr isEqualToString:chara]) {
        retStr = [retStr substringToIndex:([originStr length]-[chara length])];
    }
    return retStr;
}

+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont {
    CGSize size = CGSizeZero;
    if ([string length] <= 0 || !textFont) {
        return size;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0) {
        size = [string sizeWithFont:textFont constrainedToSize:maxSize lineBreakMode:NSLineBreakByCharWrapping];
    } else {
        size = [self kds_stringSize:string withMaxSize:maxSize withTextFont:textFont with:@{NSFontAttributeName:textFont}];
    }
    
    return size;
}

+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont with:(NSDictionary *)attributes {
    CGSize size = CGSizeZero;
    if ([string length] <= 0 || !textFont) {
        return size;
    }
    size = [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
}
+ (CGSize)kds_stringSize:(NSString *)string withMaxSize:(CGSize)maxSize withTextFont:(UIFont *)textFont withlineSpacing:(CGFloat)lineSpacing {
    CGSize size = CGSizeZero;
    if ([string length] <= 0 || !textFont) {
        return size;
    }
    
    CGSize singleSize = [string sizeWithFont:textFont];
    CGSize totalSize = [string
                        sizeWithFont:textFont constrainedToSize:maxSize];
    CGFloat lineNum = totalSize.height/singleSize.height;
    
    size = CGSizeMake(totalSize.width, totalSize.height + lineNum * lineSpacing);
    return size;
}
+ (CGSize)kds_stringSize:(NSString *)string withTextFont:(UIFont *)textFont {
    CGSize size = CGSizeZero;
    if ([string length] <= 0 || !textFont) {
        return size;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0) {
        size = [string sizeWithFont:textFont];
    }
    else {
        size = [string sizeWithAttributes:@{NSFontAttributeName:textFont}];
    }
    
    return size;
}

+ (BOOL)kds_drawAtPoint:(CGPoint)point withFont:(UIFont *)font withColor:(UIColor *)color withString:(NSString *)string {
    if ([string length] <= 0 || !font) {
        return NO;
    }
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <= 7.0) {
        [string drawAtPoint:point withFont:font];
    }
    else {
        [string drawAtPoint:point withAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:color}];
    }
    return YES;
}

- (NSString *)md5Encrypt{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    for (int i=0;i<16;i++) {
        [hash appendFormat:@"%02x",result[i]];
        
        
    }
    return [hash lowercaseString];
}

@end
