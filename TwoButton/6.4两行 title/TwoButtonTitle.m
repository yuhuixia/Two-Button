//
//  TwoButtonTitle.m
//  XXXX
//
//  Created by 于慧霞 on 16/8/23.
//  Copyright © 2016年 yuhuixia. All rights reserved.
//

#import "TwoButtonTitle.h"

//#import "UIButton+WebCache.h"
#define LABELLINEHEIGHT  3  //下面 label 的高度 3
@interface TwoButtonTitle ()
/**
 *  标识选中状态线的高度
 */
@property (nonatomic, assign) CGFloat lineHeight;
/**
 *  标识选中状态线的宽度
 */
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIView *lineView;
/**
 *  标识选中状态线的颜色 默认是黑色
 */
@property (nonatomic, strong) UIColor *lineColor;


@property (nonatomic, strong) UIButton *button;
@end
@implementation TwoButtonTitle


- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
     [self sendSubviewToBack:_lineView];
          }
    return self;
}
- (void)setTitleArray:(NSArray *)titleArray{
   
     _titleArray = titleArray;
    // 刷新
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    if (titleArray == nil) {
        return;
    }

    

    self.backgroundColor = [UIColor whiteColor];
     CGRect frame = self.bounds;
    NSInteger count = titleArray.count;
    CGFloat width = frame.size.width / 5;
    _lineWidth= width;
    
    CGFloat height = frame.size.height/2;
    
    _lineHeight = height;
    
    for (int i = 0; i < count; i++) {
        
        NSInteger index = i % 5;// 每行五个
        NSInteger page = i / 5; // 两行
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
#pragma mark - 这段代码是项目中用到的 具体数据
//        NSDictionary *dict = titleArray[i];
//        NSString *title = dict[@"name"];
//        NSString *imgUrl = dict[@"app_img"];
//
//        [button setTitle:title forState:(UIControlStateNormal)];
//        button.titleLabel.font = [UIFont systemFontOfSize:14];
//        [[SDWebImageManager sharedManager] downloadImageWithURL: [NSURL URLWithString:imgUrl] options:SDWebImageRetryFailed progress:nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
//            
//            if (image && finished) {
//                
//                [button sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:(UIControlStateNormal)];
//                [button sd_setImageWithURL:[NSURL URLWithString:imgUrl] forState:(UIControlStateHighlighted)];
//                [button setTitle:@"" forState:(UIControlStateNormal)];
//                [button.imageView setContentMode:UIViewContentModeScaleAspectFill];
//                
//            }
//        }];
        
        //
        [button setTitle:titleArray[i] forState:(UIControlStateNormal)];
        
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(width *index, page *_lineHeight, width, _lineHeight-LABELLINEHEIGHT);
        [self addSubview:button];
        self.button = button;
        button.tag = 100 + i;
        button.backgroundColor = [UIColor whiteColor];
        
        if (i == 0) {
            _selectedIndex = 0;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
    
        // 添加短线
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, _lineHeight - LABELLINEHEIGHT, _lineWidth, LABELLINEHEIGHT)];
        _lineView.backgroundColor = [UIColor redColor];
        [self addSubview:_lineView];
        [self sendSubviewToBack:_lineView];
   
    
}

- (void)clickButton:(UIButton *)button
{
    [self selectButtonColorWithIndex:button.tag - 100];
    if (self.buttonBlock) {
        self.buttonBlock(button.tag - 100);
    }
}


- (void)selectButtonColorWithIndex:(NSInteger)index
{
    _selectedIndex = index;
    UIColor *normalColor = self.normalColor ? self.normalColor : [UIColor blackColor];
    UIColor *selectColor = self.selectedColor ? self.selectedColor : [UIColor redColor];
    for (int i = 0; i < _titleArray.count; i++) {
        UIButton *theButton = (UIButton *)[self viewWithTag:i + 100];
        UIFont *font = [UIFont systemFontOfSize:16];
        font = _labelFont ? _labelFont : font;
        theButton.titleLabel.font = font;
        if (i == index) {
            [theButton setTitleColor:selectColor forState:UIControlStateNormal];
            [self lineAnimationWithIndex:i];
        } else {
            [theButton setTitleColor:normalColor forState:UIControlStateNormal];
        }
    }
}

- (void)lineAnimationWithIndex:(NSInteger)index
{
    NSInteger indexcount = index % 5;// 每行五个
    NSInteger page = index / 5;
    CGFloat lineHeight =  3;

    CGFloat lineDuration = _lineAnimation ? _lineAnimation : 0.2;
    
    
    //如果是换行的时候，动画改为fade
    if (_lineView.frame.origin.y != page*_lineHeight+_lineHeight-3) {
        CATransition *transition = [CATransition animation];
        transition.duration = .2;
        transition.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
        transition.type = kCATransitionFade;
        [self.layer addAnimation:transition forKey:nil];
        _lineView.frame=CGRectMake(_lineWidth*indexcount, page*_lineHeight+_lineHeight - lineHeight, _lineWidth,LABELLINEHEIGHT);
    }else{
        [UIView animateWithDuration:lineDuration animations:^{
            
            _lineView.frame=CGRectMake(_lineWidth*indexcount, page*_lineHeight+_lineHeight - lineHeight, _lineWidth,LABELLINEHEIGHT);
            
        }];
    }
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    _lineView.backgroundColor = lineColor;
}
- (void)setNormalColor:(UIColor *)normalColor
{
    _normalColor = normalColor;
    [self selectButtonColorWithIndex:_selectedIndex];
}
- (void)setSelectedColor:(UIColor *)selectedColor
{
    _selectedColor = selectedColor;
    [self selectButtonColorWithIndex:_selectedIndex];
}
- (void)setSelectedIndex:(NSInteger)selectedIndex
{
    if (selectedIndex >= _titleArray.count) {
        return;
    }
    if (selectedIndex == _selectedIndex) {
        return;
    }
    [self selectButtonColorWithIndex:selectedIndex];
}
- (void)setLabelFont:(UIFont *)labelFont
{
    _labelFont = labelFont;
    [self selectButtonColorWithIndex:_selectedIndex];
}


@end
