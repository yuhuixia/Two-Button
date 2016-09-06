//
//  TwoButtonTitle.h
//  XXXX
//
//  Created by 于慧霞 on 16/8/23.
//  Copyright © 2016年 yuhuixia. All rights reserved.
//  

#import <UIKit/UIKit.h>

typedef void(^TwoButtonTitleBlock)(NSInteger index);

@interface TwoButtonTitle : UIView

/**
 *  线移动的动画时间 默认是0.2
 */
@property (nonatomic, assign) CGFloat lineAnimation;

/**
 *  正常状态下, 文字的颜色 默认是黑色
 */
@property (nonatomic, strong) UIColor *normalColor;
/**
 *  选中状态下, 文字的颜色 默认是红色
 */
@property (nonatomic, strong) UIColor *selectedColor;
/**
 *  设置选中
 */
@property (nonatomic, assign) NSInteger selectedIndex;


/**
 *  文字字体 默认是16
 */
@property (nonatomic, assign) UIFont *labelFont;

/**
 *  数据数组
 */
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, copy) TwoButtonTitleBlock buttonBlock;
- (void)setButtonBlock:(TwoButtonTitleBlock)buttonBlock;

//- (instancetype)initWithFrame:(CGRect)frame
//                   titleArray:(NSArray *)titleArray;




@end
