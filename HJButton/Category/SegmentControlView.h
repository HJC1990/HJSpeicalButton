//
//  SegmentControlView.h
//  testBtn
//
//  Created by Sam皇子 on 17/3/20.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import <UIKit/UIKit.h>

//分段控件组件按钮

//分段控件组件类型枚举
typedef enum {
    KDS_SegmentButtonType_Normal,           //没有任何标识
    KDS_SegmentButtonType_BottonLine,       //底部有横线的特殊标识
    KDS_SegmentButtonType_BottonTriangle,   //底部横线上有小三角
    KDS_SegmentButtonType_RightTriangle,    //右部横线上有小三角
}KDS_SegmentButtonType;

//分段控件组件类型枚举
typedef enum {
    KDS_SegButPointType_Normal,     //没有任何更多等标识
    KDS_SegButPointType_Right,      //更多向右
    KDS_SegButPointType_Up,         //更多向上
    KDS_SegButPointType_Down,       //更多向下
}KDS_SegButPointType;

typedef enum {
    KDS_SegButtonLeftType_Normal,        // 没有任何标识
    KDS_SegButtonLeftType_CircleDot,     // 圆点
}KDS_SegButtonLeftType;

@interface KDS_SegmentButton : UIButton

@property (nonatomic, assign) KDS_SegmentButtonType  segmentButtonType;    //按钮的类型
@property (nonatomic, retain)               UIColor *markColor;            //标识颜色

@property (nonatomic, assign)   KDS_SegButPointType  segButtPointType;     //更多标识类型

@property (nonatomic, assign)               CGFloat  fMarkLineHeight_W;    //标识线的高度或宽度
@property (nonatomic, assign)               CGFloat  fButtonLine_W;        //标识线的宽度

@property (nonatomic, assign) KDS_SegButtonLeftType  leftType;              // 左边标识
@property (nonatomic, strong)               UIColor  *leftMarkColor;        // 左边标识颜色
@property (nonatomic, assign)               CGFloat  leftMark_X;            // 左边标识x坐标
@end


/***********************************分段控件 begin *****************************************/
@class KDS_SegmentedControlView;

@protocol KDS_SegmentedControlViewDelegate <NSObject>
/**
 *  切换segment
 *
 *  @param segmentView self
 *  @param index       点击的按钮索引
 */
- (void)segmentedControl:(KDS_SegmentedControlView *)segmentView ClickIndex:(NSInteger)index;

@end

@class SegmentControlView;
//分段控件类型
typedef enum {
    KDS_SegmentedControlType_Horizontal,       //水平排列
    KDS_SegmentedControlType_Vertical,         //垂直排列
}KDS_SegmentedControlType;

/*
 * 分段控件
 */

@interface SegmentControlView : UIView

@property (nonatomic, weak) id<KDS_SegmentedControlViewDelegate> kdsSegmentDelegate;          //代理方法
@property (nonatomic, assign) KDS_SegmentedControlType  segmentType;    //分段控件的类型

@property (nonatomic, assign)    KDS_SegmentButtonType  buttonType;     //按钮类型
@property (nonatomic, retain)                  UIColor *selBackColor;   //选择按钮背景颜色
@property (nonatomic, retain)                  UIColor *norBackColor;   //非选择按钮背景颜色
@property (nonatomic, retain)                  UIColor *selFontColor;   //选择按钮字体颜色
@property (nonatomic, retain)                  UIColor *norFontColor;   //非选择按钮字体颜色
@property (nonatomic, retain)                  UIColor *fButtonLine_Color;  //标示线颜色
@property (nonatomic, assign)                NSInteger  nCurrSelectIndex; //当前选择按键索引
@property (nonatomic, assign)                  CGFloat  fButtonLine_W;        //标识线的宽度
//是否支持重复点击同一个按钮（默认支持）
@property (nonatomic, assign) BOOL canRepeatClick; ///< default = YES
/**
 *  初始化
 *
 *  @param frame     位置
 *  @param itemArray 按钮标题数组
 *  @param segType   分段类型
 *  @param pWidth    间隔宽度
 *  @param pColor    间隔颜色
 *  @param delegate  委托
 *  @param lWidth    后一个按钮的宽度（如果大于0说明最后一个按钮宽度与其他不同，等于0说明所有按钮宽度一样）
 *  @param lineWHeight 标识线的宽度或高度
 *
 *  @return KDS_SegmentedControlView
 */
- (id)initWithFrame:(CGRect)frame
         ItemsArray:(NSArray *)itemArray
SegmentedControlType:(KDS_SegmentedControlType)segType
           PadWidth:(CGFloat)pWidth
           PadColor:(UIColor *)pColor
        KdsDelegate:(id)delegate
    LastButtonWidth:(CGFloat)lWidth
markLineHeightOrWitdh:(CGFloat)fLineWHeight;

/**
 *  重新设置view的frame
 *
 *  @param frame  view的frame
 */
- (void)reSetViewWithFrame:(CGRect)frame;

/**
 *  设置分段类型
 *
 *  @param buttonType 分段类型
 */
- (void)setSegmentControlButtonType:(KDS_SegmentButtonType)buttonType;

/**
 *  设置分段按钮选中和非选中的背景色
 *
 *  @param selBackColor 选中的背景色
 *  @param norBackColor 非选中的背景色
 */
- (void)setSegmentControlButtonBackColor:(UIColor *)selBackColor
                   ButtonNormalBackColor:(UIColor *)norBackColor;

/**
 *  设置分段按钮选中和非选中的字体颜色
 *
 *  @param selFontColor 选中的字体色
 *  @param norFontColor 非选中的字体色
 */
- (void)setSegmentControlButtonFontColor:(UIColor *)selFontColor
                   ButtonNormalFontColor:(UIColor *)norFontColor;

/**
 *  设置字段按钮的字体
 *
 *  @param buttonFont 按钮的字体
 */
- (void)setSegmentControlButtonFont:(UIFont *)buttonFont;

/**
 *  设置选中索引
 *
 *  @param index 选中索引值
 */
- (void)setSegmentControlSelectIndex:(NSInteger)index;

/**
 *  设置最后一个按钮是否有剪头
 *
 *  @param segButPointType 剪头类型
 */
- (void)setSegmentControlLastButtonPoint:(KDS_SegButPointType)segButPointType;

/**
 *  得到最后一个按钮的剪头类型
 */
- (KDS_SegButPointType)getLastButtonSegButPointType;

/**
 *  重新设置标题
 *
 *  @param itemArray 标题数组
 */
- (void)reSetViewTitle:(NSArray *)itemArray;

/**
 *  设置第一个按钮的名称
 *
 *  @param index   按钮索引
 *  @param strName 按钮名称
 */
- (void)setSegmentControlButtonNameWithIndex:(NSInteger)index withName:(NSString *)strName;

/**
 *  得到第几个按钮的名称
 *
 *  @param index 按钮索引
 */
- (NSString *)getSegmentControlButtonNameWithIndex:(NSInteger)index;

/**
 *  获取按钮个数
 *
 *  @return 按钮个数
 */
- (NSInteger)getSegmentControlButtonCount;

/**
 *  设置底线
 *
 * @param color 底线颜色
 */
- (void)setSegmentControlViewLine:(UIColor *)color ;

/**
 *  如果底线两边有空白，设置底线的宽
 *
 *  @param fButtonLine_W
 */
- (void)setFButtonLine_W:(CGFloat)fButtonLine_W;

/**
 *  获取按钮所在父类的位置
 *
 *  @param index 按钮索引
 *
 *  @return 按钮的位置
 */
- (CGRect)getSegmentControlButtonRectWithIndex:(NSInteger)index;

/**
 *  将上一个选中的按钮标记为选中（当某个 segment button 被点击时只响应，按钮本身不被选中时使用）
 */
- (void)selectLastIndexWithOutAction;

/**
 *  显示/隐藏圆点
 *
 *  @param bShow 是否显示
 *  @param index 显示位置
 *  @param color 颜色值
 *  @param x     起始坐标
 */
- (void)showCycleDot:(BOOL)bShow withIndex:(NSInteger)index color:(UIColor *)color cycle_x:(CGFloat)x;

@end
