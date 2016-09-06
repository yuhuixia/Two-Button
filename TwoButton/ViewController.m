//
//  ViewController.m
//  TwoButton
//
//  Created by 于慧霞 on 16/8/22.
//  Copyright © 2016年 yuhuixia. All rights reserved.
//

#import "ViewController.h"

#import "TwoButtonTitle.h"


#define KSCReenWidth  [UIScreen mainScreen].bounds.size.width
#define KSCReenHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

{
    TwoButtonTitle *twoBtnTitle;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   //    selectView = [[TwoSelectView alloc] initWithFrame:CGRectMake(0, 100, KSCReenWidth,90 ) showArray:array selectBlock:^(NSInteger index) {
//        
//        switch (index) {
//            case 0:{
//                NSLog(@"第一个");
//                break;
//            }
//            case 1:{
//                NSLog(@"第2个");
//                break;
//            }
//            case 2:{
//                NSLog(@"第3个");
//                break;
//            } case 3:{
//                NSLog(@"第4个");
//                break;
//            } case 4:{
//                NSLog(@"第5个");
//                break;
//            } case 5:{
//                NSLog(@"第6个");
//                break;
//            }
//            case 6:{
//                NSLog(@"第7个");
//                break;
//            }
//            case 7:{
//                NSLog(@"第8个");
//                break;
//            } case 8:{
//                NSLog(@"第9个");
//                break;
//            }
//            case 9:{
//                NSLog(@"第10个");
//                break;
//            }
//                
//            default:
//                break;
//        }
//    }];
////    selectView.backgroundColor = [UIColor redColor];
//    
//     [self.view addSubview:selectView];
//    // Do any additional setup after loading the view, typically from a nib.
    [self addTwoTitle];
}
- (void)addTwoTitle
{
    
    twoBtnTitle = [[TwoButtonTitle  alloc] initWithFrame:CGRectMake(40,0+100, KSCReenWidth-40, 80)];
    twoBtnTitle.backgroundColor = [UIColor redColor];
    [self.view addSubview:twoBtnTitle];
    
    NSArray *array = @[@"哈哈哈哈",@"首页",@"3周年",@"中职卡",@"玫瑰花",@"小苹果",@"大苹果",@"哇哈哈",@"爽歪歪",@"水果"];

    
 
    
    


// 赋值

    twoBtnTitle.titleArray = array;
    twoBtnTitle.labelFont = [UIFont boldSystemFontOfSize:14];
    twoBtnTitle.selectedColor = [UIColor orangeColor];
    twoBtnTitle.normalColor = [UIColor blackColor];
    twoBtnTitle.backgroundColor = [UIColor whiteColor];


    // 点击方法
    __block typeof(self)weakSelf = self;
    [twoBtnTitle setButtonBlock:^(NSInteger index) {
        
        NSLog(@"%ld",index);
        
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
