//
//  ViewController.m
//  HJButton
//
//  Created by Sam皇子 on 17/3/21.
//  Copyright © 2017年 Sam皇子. All rights reserved.
//

#import "ViewController.h"
#import "SegmentControlView.h"

static NSInteger const Firstview = 10001;///< 第一个切换tag
static NSInteger const Secondview      = 10002;///< 第二个切换tag
static NSInteger const Thirdview      = 10003;///< 第二个切换tag
static NSInteger const Fourview      = 10004;///< 第二个切换tag

@interface ViewController ()
{
    SegmentControlView *FirstControlView;
    SegmentControlView *SecondControlView;
    SegmentControlView *ThirdControlView;
    SegmentControlView *FourControlView;
    SegmentControlView *VerticalControlView;
    NSArray *Array;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Array = [NSArray arrayWithObjects:@"头条",@"新闻",@"军事",@"历史",@"单身", nil];
    self.view.backgroundColor= [UIColor whiteColor];
    CGFloat fPadWidth = 0.5f;   //seg中间分隔线宽度
    CGFloat buttonLine_W = 0;
    FirstControlView = [[SegmentControlView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60) ItemsArray:Array SegmentedControlType:KDS_SegmentedControlType_Horizontal PadWidth:fPadWidth PadColor:[UIColor clearColor] KdsDelegate:self LastButtonWidth:0 markLineHeightOrWitdh:2.0f];
    FirstControlView.tag=Firstview;
    [FirstControlView setSegmentControlLastButtonPoint:KDS_SegButPointType_Down];
    FirstControlView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [FirstControlView setSegmentControlButtonType:KDS_SegmentButtonType_Normal];
    [FirstControlView setSegmentControlButtonBackColor:[UIColor blueColor]
                               ButtonNormalBackColor:[UIColor brownColor]];
    FirstControlView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:FirstControlView];
    
    
    SecondControlView = [[SegmentControlView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 60) ItemsArray:Array SegmentedControlType:KDS_SegmentedControlType_Horizontal PadWidth:fPadWidth PadColor:[UIColor clearColor] KdsDelegate:self LastButtonWidth:0 markLineHeightOrWitdh:2.0f];
    SecondControlView.autoresizingMask = UIViewAutoresizingFlexibleWidth;

    [SecondControlView setSegmentControlButtonType:KDS_SegmentButtonType_BottonTriangle];
    [SecondControlView setSegmentControlButtonBackColor:[UIColor redColor]
                                  ButtonNormalBackColor:[UIColor brownColor]];
    SecondControlView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:SecondControlView];
    
    ThirdControlView = [[SegmentControlView alloc] initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 60) ItemsArray:Array SegmentedControlType:KDS_SegmentedControlType_Horizontal PadWidth:fPadWidth PadColor:[UIColor clearColor] KdsDelegate:self LastButtonWidth:0 markLineHeightOrWitdh:2.0f];
    ThirdControlView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [ThirdControlView setSegmentControlButtonType:KDS_SegmentButtonType_BottonLine];
    [ThirdControlView setSegmentControlButtonBackColor:[UIColor redColor]
                                  ButtonNormalBackColor:[UIColor brownColor]];
    ThirdControlView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:ThirdControlView];
    
    FourControlView = [[SegmentControlView alloc] initWithFrame:CGRectMake(0, 450, self.view.frame.size.width, 60) ItemsArray:Array SegmentedControlType:KDS_SegmentedControlType_Horizontal PadWidth:fPadWidth PadColor:[UIColor clearColor] KdsDelegate:self LastButtonWidth:0 markLineHeightOrWitdh:2.0f];
    FourControlView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [FourControlView setSegmentControlButtonType:KDS_SegmentButtonType_RightTriangle];
    [FourControlView setSegmentControlButtonBackColor:[UIColor redColor]
                                 ButtonNormalBackColor:[UIColor brownColor]];
    FourControlView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:FourControlView];
    
    CGRect frame = CGRectMake(100, 520, FourControlView.frame.size.width/5, 200);
    
    VerticalControlView = [[SegmentControlView alloc] initWithFrame:frame
                                                      ItemsArray:Array
                                            SegmentedControlType:KDS_SegmentedControlType_Vertical
                                                        PadWidth:fPadWidth
                                                        PadColor:self.view.backgroundColor
                                                     KdsDelegate:self
                                                 LastButtonWidth:0.0f
                                           markLineHeightOrWitdh:2.0f];
    VerticalControlView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [VerticalControlView setSegmentControlButtonBackColor:[UIColor redColor]
                                 ButtonNormalBackColor:[UIColor brownColor]];
    VerticalControlView.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:VerticalControlView];

    
}

- (void)_KLineSegmentViewClickedWithIndex:(NSInteger)index
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
