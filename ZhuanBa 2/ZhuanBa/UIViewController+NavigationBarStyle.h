//
//  UIViewController+NavigationBarStyle.h
//  TXHConductFinancialTransactions
//
//  Created by wwt on 15/11/3.
//  Copyright (c) 2015年 rongyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBarStyle)
@property(nonatomic,strong) UIButton *rightBtn;
@property(nonatomic,strong) UIButton *righTwotBtn;
//类别设置NavBar样式(如果不需要传nil即可)
- (void)navigationBarStyleWithTitle:(NSString *)titleStr titleColor:(UIColor *)titleColor leftTitle:(NSString *)leftTitle leftImageName:(NSString *)leftImageName leftAction:(SEL)leftAction rightTitle:(NSString *)rightTitle rightImageName:(NSString *)rightImageName rightAction:(SEL)rightAction;




- (void)navigationBarStyleWithTitle:(NSString *)titleStr titleColor:(UIColor *)titleColor leftTitle:(NSString *)leftTitle leftImageName:(NSString *)leftImageName leftAction:(SEL)leftAction rightTitle:(NSString *)rightTitle rightImageName:(NSString *)rightImageName rightAction:(SEL)rightAction rightTwoTitle:(NSString*)rigthTwoTitle rightTwoImagename:(NSString*)rightTwoImageName TworightAction:(SEL)TrightAction;


//设置导航栏透明
- (void)clearNavigationBar;

@end
