//
//  SegmentControlView.m
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import "SegmentControlView.h"
#import "UIView+extention.h"
#import "NSString+help.h"
#import "UIImage+category.h"
#import "UIImageView+Cateroy.h"

@implementation KDS_SegmentButton
#define kTriangle_Width     10.0f     //三角的宽 高是此的二分之一


#pragma mark - KDS_SegmentButton (Super View)
- (void)drawRect:(CGRect)rect {
    _markColor = [UIColor redColor];
    switch (_segmentButtonType) {
        case KDS_SegmentButtonType_Normal: {    //没有任何标识
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
            CGContextFillRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height));
        }
            break;
            
        case KDS_SegmentButtonType_BottonLine: {    //底部有横线的特殊标识
            CGContextRef context = UIGraphicsGetCurrentContext();
            UIColor *lineColor = _markColor;
            //底部颜色
            CGContextSetFillColorWithColor(context, lineColor.CGColor);
            if (0 == _fButtonLine_W) {   // 没有设置线宽的，默认是按钮的宽
                _fButtonLine_W = rect.size.width;
            }
            CGContextFillRect(context, CGRectMake((rect.size.width-_fButtonLine_W)/2, rect.size.height - _fMarkLineHeight_W, _fButtonLine_W, _fMarkLineHeight_W));
            
            CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
            CGContextFillRect(context, CGRectMake(0, 0, rect.size.width, rect.size.height - _fMarkLineHeight_W));
        }
            break;
            
        case KDS_SegmentButtonType_BottonTriangle: {    //底部横线上有小三角
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, _markColor.CGColor);
            
            //画路径
            CGContextMoveToPoint(context, 0, rect.size.height - _fMarkLineHeight_W);
            CGContextAddLineToPoint(context, (rect.size.width - kTriangle_Width)/2, rect.size.height - _fMarkLineHeight_W);
            
            CGContextAddLineToPoint(context, (rect.size.width - kTriangle_Width)/2 + kTriangle_Width/2, rect.size.height - _fMarkLineHeight_W - kTriangle_Width/2);
            
            CGContextAddLineToPoint(context, (rect.size.width - kTriangle_Width)/2 + kTriangle_Width, rect.size.height - _fMarkLineHeight_W);
            
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height - _fMarkLineHeight_W);
            
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
            
            CGContextAddLineToPoint(context, 0, rect.size.height);
            
            //填充
            CGContextFillPath(context);
        }
            break;
            
        case KDS_SegmentButtonType_RightTriangle: {     //右部横线上有小三角
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, _markColor.CGColor);
            
            //画路径
            CGContextMoveToPoint(context, rect.size.width - _fMarkLineHeight_W, rect.size.height);
            CGContextAddLineToPoint(context, rect.size.width - _fMarkLineHeight_W, (rect.size.height - kTriangle_Width)/2 + kTriangle_Width);
            
            CGContextAddLineToPoint(context, rect.size.width - _fMarkLineHeight_W - kTriangle_Width/2, (rect.size.height - kTriangle_Width)/2 + kTriangle_Width/2);
            
            CGContextAddLineToPoint(context, rect.size.width - _fMarkLineHeight_W, (rect.size.height - kTriangle_Width)/2);
            
            CGContextAddLineToPoint(context, rect.size.width - _fMarkLineHeight_W, 0);
            
            CGContextAddLineToPoint(context, rect.size.width, 0);
            
            CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
            
            CGContextAddLineToPoint(context, 0, rect.size.height);
            
            //填充
            CGContextFillPath(context);
        }
            break;
            
        default:
            break;
    }
    
    // 左边角标识
    switch (_leftType) {
        case KDS_SegButtonLeftType_CircleDot:
        {
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetFillColorWithColor(context, _leftMarkColor.CGColor);
            CGFloat y = self.titleLabel.centerY;
            CGContextAddArc(context, self.leftMark_X, y, 4, 0, 2*M_PI, 0);
            //填充
            CGContextFillPath(context);
        }
            break;
            
        case KDS_SegButtonLeftType_Normal:
        default:
            break;
    }
    
    //更多标识
    switch (_segButtPointType) {
        case KDS_SegButPointType_Normal: {   //没有任何更多等标识
        }
            break;
            
        case KDS_SegButPointType_Right: {   //更多向右
            CGFloat point_w = self.bounds.size.height/3;    //剪头最宽
            CGSize fontSize = [NSString kds_stringSize:self.titleLabel.text
                                           withMaxSize:self.bounds.size
                                          withTextFont:self.titleLabel.font
                                                  with:@{NSFontAttributeName:self.titleLabel.font}];
            CGFloat fbeign_X = (self.frame.size.width - fontSize.width)/2 + fontSize.width + point_w/4 +3;   //剪头最左开始X位置
            CGFloat fend_X = fbeign_X + point_w/2;   //剪头最右结束X位置
            if (fend_X > self.bounds.size.width) {
                fend_X = self.bounds.size.width - 2.0f;
                fbeign_X = fend_X - point_w/2;
            }
            
            CGPoint begin = CGPointMake(fbeign_X, (self.frame.size.height - point_w)/2+2);
            CGPoint middle = CGPointMake(fend_X, self.frame.size.height/2);
            CGPoint end = CGPointMake(fbeign_X, (self.frame.size.height - point_w)/2 + point_w-2);
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetStrokeColorWithColor(context, self.currentTitleColor.CGColor);
            
            CGContextSetLineWidth(context, 1.0f);
            
            //画路径
            CGContextMoveToPoint(context, begin.x, begin.y);
            CGContextAddLineToPoint(context, middle.x, middle.y);
            CGContextAddLineToPoint(context, end.x, end.y);
            
            //填充
            CGContextStrokePath(context);
        }
            break;
            
        case KDS_SegButPointType_Up: {   //更多向上
            CGFloat point_w = self.bounds.size.height/5;    //剪头最宽
            CGSize fontSize = [NSString kds_stringSize:self.titleLabel.text
                                           withMaxSize:self.bounds.size
                                          withTextFont:self.titleLabel.font
                                                  with:@{NSFontAttributeName:self.titleLabel.font}];
            CGFloat fTitleEnd_X = (self.frame.size.width - fontSize.width)/2 + fontSize.width;   //字体结尾的X点
            CGFloat fbeign_X = fTitleEnd_X + (self.frame.size.width - fTitleEnd_X - point_w)/2;   //剪头最左开始X位置
            CGFloat fend_X = fbeign_X + point_w;      //剪头最右结束X位置
            CGFloat fbeign_Y = (self.frame.size.height - point_w*2/3)/2;   //剪头最上开始Y位置
            CGFloat fend_Y = fbeign_Y + point_w*2/3;       //剪头最下结束Y位置
            if (fend_X > self.bounds.size.width) {
                fend_X = self.bounds.size.width - 2.0f;
                fbeign_X = fend_X - point_w/2;
            }
            
            CGPoint begin = CGPointMake(fbeign_X, fend_Y);
            CGPoint middle = CGPointMake(fbeign_X + point_w/2, fbeign_Y);
            CGPoint end = CGPointMake(fbeign_X + point_w, fend_Y);
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetStrokeColorWithColor(context, self.currentTitleColor.CGColor);
            
            CGContextSetLineWidth(context, 1.0f);
            
            //画路径
            CGContextMoveToPoint(context, begin.x, begin.y);
            CGContextAddLineToPoint(context, middle.x, middle.y);
            CGContextAddLineToPoint(context, end.x, end.y);
            
            //填充
            CGContextStrokePath(context);
        }
            break;
        case KDS_SegButPointType_Down: {   //更多向下
            CGFloat point_w = self.bounds.size.height/5;    //剪头最宽
            CGSize fontSize = [NSString kds_stringSize:self.titleLabel.text
                                           withMaxSize:self.bounds.size
                                          withTextFont:self.titleLabel.font
                                                  with:@{NSFontAttributeName:self.titleLabel.font}];
            CGFloat fTitleEnd_X = (self.frame.size.width - fontSize.width)/2 + fontSize.width;   //字体结尾的X点
            CGFloat fbeign_X = fTitleEnd_X + (self.frame.size.width - fTitleEnd_X - point_w)/2;   //剪头最左开始X位置
            CGFloat fend_X = fbeign_X + point_w;      //剪头最右结束X位置
            CGFloat fbeign_Y = (self.frame.size.height - point_w*2/3)/2;   //剪头最上开始Y位置
            CGFloat fend_Y = fbeign_Y + point_w*2/3;       //剪头最下结束Y位置
            if (fend_X > self.bounds.size.width) {
                fend_X = self.bounds.size.width - 2.0f;
                fbeign_X = fend_X - point_w/2;
            }
            
            CGPoint begin = CGPointMake(fbeign_X, fbeign_Y);
            CGPoint middle = CGPointMake(fbeign_X + point_w/2, fend_Y);
            CGPoint end = CGPointMake(fbeign_X + point_w, fbeign_Y);
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextSetStrokeColorWithColor(context, self.currentTitleColor.CGColor);
            
            CGContextSetLineWidth(context, 1.0f);
            
            //画路径
            CGContextMoveToPoint(context, begin.x, begin.y);
            CGContextAddLineToPoint(context, middle.x, middle.y);
            CGContextAddLineToPoint(context, end.x, end.y);
            
            //填充
            CGContextStrokePath(context);
        }
            break;
            
        default:
            break;
    }
}

@end



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/***********************************分段控件 begin *****************************************/
@interface SegmentControlView () {
    NSMutableArray *buttonArray_;    //全部按钮存储数组
    NSMutableArray *labelArray_;     //分隔线img存储数组
    CGFloat         fPWidthHeight_;  //分隔线的宽度或高度
}
//  重复点击同一个按钮，不做响应（暴露个BOOL接口，默认支持）
@property (nonatomic, assign) NSInteger lastClickedIndex;     ///< 记录点击了的上个按钮
@end

@implementation SegmentControlView

#define kSegmentButton_tag      1001     //按钮tag开始


#pragma mark - KDS_SegmentedControlView (Private)
/*
 * 按钮点击
 */
- (void)buttonAction:(UIButton *)sender {
    _nCurrSelectIndex = [sender tag] - kSegmentButton_tag;
    
    //重新设置按钮风格
    [self setSegmentControlButtonType:_buttonType];
    [self setSegmentControlButtonBackColor:_selBackColor ButtonNormalBackColor:_norBackColor];
    [self setSegmentControlButtonFontColor:_selFontColor ButtonNormalFontColor:_norFontColor];
    
    if (_kdsSegmentDelegate && [_kdsSegmentDelegate respondsToSelector:@selector(segmentedControl:ClickIndex:)]) {
        [_kdsSegmentDelegate segmentedControl:self ClickIndex:_nCurrSelectIndex];
    }
}

#pragma mark - KDS_SegmentedControlView (Public)
- (id)initWithFrame:(CGRect)frame
         ItemsArray:(NSArray *)itemArray
SegmentedControlType:(KDS_SegmentedControlType)segType
           PadWidth:(CGFloat)pWidth
           PadColor:(UIColor *)pColor
        KdsDelegate:(id)delegate
    LastButtonWidth:(CGFloat)lWidth
markLineHeightOrWitdh:(CGFloat)fLineWHeight {
    
    if (self = [super initWithFrame:frame]) {
        if ([itemArray count] > 0) {
            buttonArray_ = [NSMutableArray array];
            labelArray_  = [NSMutableArray array];
            self.kdsSegmentDelegate = delegate;
            self.segmentType = segType;
            fPWidthHeight_ = pWidth;
            
            if (KDS_SegmentedControlType_Horizontal == segType) {   //水平
                CGFloat buttonWidth = (frame.size.width - ([itemArray count] - 1)*pWidth)/[itemArray count];
                NSLog(@"===%f",frame.size.width);
                NSLog(@"===%lu",(unsigned long)[itemArray count]);
                NSLog(@"===%f",buttonWidth);
                if (lWidth > 0) {  //最后一个按键的宽度
                    buttonWidth = (frame.size.width - ([itemArray count] - 1)*pWidth - lWidth)/([itemArray count] - 1);
                }
                CGRect subFrame = CGRectMake(0, 0, buttonWidth, frame.size.height);
                
                for (NSInteger i = 0; i < [itemArray count]; i++) {
                    if (lWidth > 0 && [itemArray count] - 1 == i) {
                        subFrame.size.width = lWidth;
                    }
                    KDS_SegmentButton *button = [KDS_SegmentButton buttonWithType:UIButtonTypeCustom];
                    button.frame = subFrame;
                    button.tag = kSegmentButton_tag+i;
                    [button setTitle:[itemArray objectAtIndex:i] forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                    button.fMarkLineHeight_W = fLineWHeight;
                    [button setTranslatesAutoresizingMaskIntoConstraints:YES];
                    
                    [self addSubview:button];
                    
                    
                    [buttonArray_ addObject:button];
                    
                    subFrame.origin.x += pWidth + buttonWidth;
                }
                
                //分隔线
                if (pWidth > 0.0f) {
                    subFrame = CGRectMake(buttonWidth, 0, pWidth, frame.size.height);
                    for (NSInteger i = 1; i < [itemArray count]; i++) {
                        UIImageView *lineImg = [UIImageView kds_createImageViewWithFrame:subFrame Image:[UIImage kds_imageWithColor:pColor]];
                        [self addSubview:lineImg];
                        
                        [labelArray_ addObject:lineImg];
                        
                        subFrame.origin.x += pWidth + buttonWidth;
                    }
                }
            }
            else { //垂直
                CGFloat buttonHeigh = (frame.size.height - ([itemArray count] - 1)*pWidth)/[itemArray count];
                CGRect subFrame = CGRectMake(0, 0, frame.size.width, buttonHeigh);
                
                for (NSInteger i = 0; i < [itemArray count]; i++) {
                    KDS_SegmentButton *button = [KDS_SegmentButton buttonWithType:UIButtonTypeCustom];
                    button.frame = subFrame;
                    button.tag = kSegmentButton_tag+i;
                    [button setTitle:[itemArray objectAtIndex:i] forState:UIControlStateNormal];
                    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                    button.fMarkLineHeight_W = fLineWHeight;
                    [self addSubview:button];
                    
                    [buttonArray_ addObject:button];
                    
                    subFrame.origin.y += pWidth + buttonHeigh;
                }
                
                //分隔线
                if (pWidth > 0.0f) {
                    subFrame = CGRectMake(0, buttonHeigh, frame.size.width, pWidth);
                    for (NSInteger i = 1; i < [itemArray count]; i++) {
                        UIImageView *lineImg = [UIImageView kds_createImageViewWithFrame:subFrame Image:[UIImage kds_imageWithColor:pColor]];
                        [self addSubview:lineImg];
                        
                        [labelArray_ addObject:lineImg];
                        
                        subFrame.origin.y += pWidth + buttonHeigh;
                    }
                }
            }
        }
    }
    return self;
}

- (void)reSetViewWithFrame:(CGRect)frame {
    if (KDS_SegmentedControlType_Horizontal == _segmentType) {   //水平
        CGFloat buttonWidth = (frame.size.width - ([buttonArray_ count] - 1)*fPWidthHeight_)/[buttonArray_ count];     //按钮宽
        
        CGRect subFrame = CGRectMake(0, 0, buttonWidth, frame.size.height);
        for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
            KDS_SegmentButton *button = (KDS_SegmentButton *)[buttonArray_ objectAtIndex:i];
            button.frame = subFrame;
            subFrame.origin.x += fPWidthHeight_ + buttonWidth;
        }
        
        subFrame = CGRectMake(buttonWidth, 0, fPWidthHeight_, frame.size.height);
        //分隔线
        for (NSInteger i = 0; i < [labelArray_ count]; i++) {
            UIImageView *lineImg = (UIImageView *)[labelArray_ objectAtIndex:i];
            lineImg.frame = subFrame;
            
            subFrame.origin.x += fPWidthHeight_ + buttonWidth;
        }
    } else { //垂直
        CGFloat buttonHeigh = (frame.size.height - ([buttonArray_ count] - 1)*fPWidthHeight_)/[buttonArray_ count];     //按钮高
        
        CGRect subFrame = CGRectMake(0, 0, frame.size.width, buttonHeigh);
        for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
            KDS_SegmentButton *button = (KDS_SegmentButton *)[buttonArray_ objectAtIndex:i];
            button.frame = subFrame;
            
            subFrame.origin.y += fPWidthHeight_ + buttonHeigh;
        }
        
        subFrame = CGRectMake(0, buttonHeigh, frame.size.width, fPWidthHeight_);
        //分隔线
        for (NSInteger i = 0; i < [labelArray_ count]; i++) {
            UIImageView *lineImg = (UIImageView *)[labelArray_ objectAtIndex:i];
            lineImg.frame = subFrame;
            
            subFrame.origin.y += fPWidthHeight_ + buttonHeigh;
        }
        
    }
}

- (void)setSegmentControlButtonType:(KDS_SegmentButtonType)buttonType {
    self.buttonType = buttonType;
    
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        if (_nCurrSelectIndex == i) {
            button.segmentButtonType = buttonType;
        }
        else {
            button.segmentButtonType = KDS_SegmentButtonType_Normal;
        }
        [button setNeedsDisplay];
    }
}

- (void)setSegmentControlButtonBackColor:(UIColor *)selBackColor
                   ButtonNormalBackColor:(UIColor *)norBackColor {
    self.selBackColor = selBackColor;
    self.norBackColor = norBackColor;
    
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        if (KDS_SegmentButtonType_Normal == button.segmentButtonType) {
            if (_nCurrSelectIndex == i) {
                button.backgroundColor = selBackColor;
            }
            else {
                button.backgroundColor = norBackColor;
            }
        }
        else {
            button.backgroundColor = norBackColor;
        }
    }
}

- (void)setSegmentControlButtonFontColor:(UIColor *)selFontColor
                   ButtonNormalFontColor:(UIColor *)norFontColor {
    self.selFontColor = selFontColor;
    self.norFontColor = norFontColor;
    
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        if (_nCurrSelectIndex == i) {
            [button setTitleColor:selFontColor forState:UIControlStateNormal];
        }
        else {
            [button setTitleColor:norFontColor forState:UIControlStateNormal];
        }
    }
}

- (void)setSegmentControlButtonFont:(UIFont *)buttonFont {
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        button.titleLabel.font = buttonFont;
    }
}

- (void)setSegmentControlSelectIndex:(NSInteger)index {
    if (index < 0) {   //所有都不选择
        NSInteger index = _nCurrSelectIndex<0 ? 0 : _nCurrSelectIndex;
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:index];
        button.segmentButtonType = KDS_SegmentButtonType_Normal;
        [button setTitleColor:_norFontColor forState:UIControlStateNormal];
        button.backgroundColor = _norBackColor;
        _nCurrSelectIndex = -1;
    }
    else {
        _nCurrSelectIndex = index;    //默认0
        for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
            KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
            if (_nCurrSelectIndex == i) {
                [self buttonAction:button];
                break;
            }
        }
    }
}

- (void)setSegmentControlLastButtonPoint:(KDS_SegButPointType)segButPointType {
    KDS_SegmentButton *button = [buttonArray_ lastObject];
    button.segButtPointType = segButPointType;
    [button setNeedsDisplay];
}

- (KDS_SegButPointType)getLastButtonSegButPointType {
    KDS_SegmentButton *button = [buttonArray_ lastObject];
    return button.segButtPointType;
}

- (void)reSetViewTitle:(NSArray *)itemArray {
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        [button setTitle:[itemArray objectAtIndex:i] forState:UIControlStateNormal];
    }
}

- (void)setSegmentControlButtonNameWithIndex:(NSInteger)index withName:(NSString *)strName {
    KDS_SegmentButton *button = [buttonArray_ objectAtIndex:index];
    [button setTitle:strName forState:UIControlStateNormal];
}

- (NSString *)getSegmentControlButtonNameWithIndex:(NSInteger)index {
    KDS_SegmentButton *button = [buttonArray_ objectAtIndex:index];
    NSString *title = [button titleForState:UIControlStateNormal];
    return title;
}

- (NSInteger)getSegmentControlButtonCount {
    return [buttonArray_ count];
}

- (void)setSegmentControlViewLine:(UIColor *)color {
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height - 1, self.bounds.size.width, 1)];
    lineView.backgroundColor = color;
    [self addSubview:lineView];
}

- (void)setFButtonLine_W:(CGFloat)fButtonLine_W {
    _fButtonLine_W = fButtonLine_W;
    for (KDS_SegmentButton *button in buttonArray_) {
        button.fButtonLine_W = fButtonLine_W;
        button.frame = button.frame;
    }
}

- (void)setFButtonLine_Color:(UIColor *)fButtonLine_Color {
    _fButtonLine_Color = fButtonLine_Color;
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        KDS_SegmentButton *button = [buttonArray_ objectAtIndex:i];
        button.markColor = fButtonLine_Color;
        [button setNeedsDisplay];
    }
}

- (CGRect)getSegmentControlButtonRectWithIndex:(NSInteger)index {
    KDS_SegmentButton *button = [buttonArray_ objectAtIndex:index];
    return button.frame;
}

- (void)selectLastIndexWithOutAction {
    _nCurrSelectIndex = _lastClickedIndex;
    for (NSInteger i = 0; i < [buttonArray_ count]; i++) {
        if (_lastClickedIndex == i) {
            [self resetButtonSelectedClocr];
            break;
        }
    }
}

//重新设置按钮风格
- (void)resetButtonSelectedClocr {
    [self setSegmentControlButtonType:_buttonType];
    [self setSegmentControlButtonBackColor:_selBackColor ButtonNormalBackColor:_norBackColor];
    [self setSegmentControlButtonFontColor:_selFontColor ButtonNormalFontColor:_norFontColor];
}

- (void)showCycleDot:(BOOL)bShow withIndex:(NSInteger)index color:(UIColor *)color cycle_x:(CGFloat)x{
    if (index >= [buttonArray_ count]) {
        return;
    }
    
    KDS_SegmentButton *button = [buttonArray_ objectAtIndex:index];
    if (bShow) {
        button.leftType = KDS_SegButtonLeftType_CircleDot;
        button.leftMarkColor = color;
        button.leftMark_X = x;
    }else {
        button.leftType = KDS_SegButtonLeftType_Normal;
    }
    [button setNeedsDisplay];
}

@end
