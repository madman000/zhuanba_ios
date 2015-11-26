//
//  UIViewController+NavigationBarStyle.m
//  TXHConductFinancialTransactions
//
//  Created by wwt on 15/11/3.
//  Copyright (c) 2015年 rongyu. All rights reserved.
//

#import "UIViewController+NavigationBarStyle.h"
#import "FactoryManager.h"

//@synthesize rightBtn,righTwotBtn;
@implementation UIViewController (NavigationBarStyle)



- (void)navigationBarStyleWithTitle:(NSString *)titleStr titleColor:(UIColor *)titleColor leftTitle:(NSString *)leftTitle leftImageName:(NSString *)leftImageName leftAction:(SEL)leftAction rightTitle:(NSString *)rightTitle rightImageName:(NSString *)rightImageName rightAction:(SEL)rightAction{
    
    //设置标题
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100 ,100)];
    titleLabel.text = titleStr;
    titleLabel.textColor = titleColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
//        titleLabel.backgroundColor=[UIColor redColor];

    titleLabel.font = [UIFont fontWithName:FontName size:18];
    self.navigationItem.titleView = titleLabel;
//    titleLabel.backgroundColor=[UIColor redColor];
//    [self.view addSubview:titleLabel];
    

    
    //设置左右button
    
    if (leftTitle && !leftImageName) {
        
        UIButton *leftBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 50, 30) text:leftTitle textColor:[UIColor orangeColor]];
        [leftBtn addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
        
        //如果左是纯文本
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
    }else if (!leftTitle && leftImageName){
        
        UIButton *leftBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(-5, 0, 40, 30) text:nil textColor:nil];
        [leftBtn setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [leftBtn addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
        
        //如果左是纯图片
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
    }
    
    if (rightTitle && !rightImageName) {
        
        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 40, 30) text:rightTitle textColor:[UIColor orangeColor]];
        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        
    }else if (!rightTitle && rightImageName) {
        
        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 40, 30) text:nil textColor:nil];
        [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        
    }
    
    
    
}


-(void)navigationBarStyleWithTitle:(NSString *)titleStr titleColor:(UIColor *)titleColor leftTitle:(NSString *)leftTitle leftImageName:(NSString *)leftImageName leftAction:(SEL)leftAction rightTitle:(NSString *)rightTitle rightImageName:(NSString *)rightImageName rightAction:(SEL)rightAction rightTwoTitle:(NSString *)rigthTwoTitle rightTwoImagename:(NSString *)rightTwoImageName TworightAction:(SEL)TrightAction{
 
    //设置标题
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100 ,100)];
    titleLabel.text = titleStr;
    titleLabel.textColor = titleColor;
    titleLabel.textAlignment = NSTextAlignmentCenter;
   
    
    titleLabel.font = [UIFont fontWithName:FontName size:18];
    self.navigationItem.titleView = titleLabel;
  
    
    
    
    //设置左右button
    
    if (leftTitle && !leftImageName) {
        
        UIButton *leftBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 50, 30) text:leftTitle textColor:[UIColor orangeColor]];
        [leftBtn addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
        
        //如果左是纯文本
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
//        self.rightBtn=leftBtn;
        
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtn];

        
    }else if (!leftTitle && leftImageName){
        
        UIButton *leftBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(-5, 0, 40, 30) text:nil textColor:nil];
        [leftBtn setImage:[UIImage imageNamed:leftImageName] forState:UIControlStateNormal];
        leftBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [leftBtn addTarget:self action:leftAction forControlEvents:UIControlEventTouchUpInside];
        
        //如果左是纯图片
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
        
        
    }
    
    
    
    
    if ((rightTitle && !rightImageName)||(rigthTwoTitle && !rightTwoImageName)){
        
        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0,20, 20,20) text:rightTitle textColor:[UIColor orangeColor]];
        
        rightBtn.backgroundColor=[UIColor greenColor];
        
        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
        
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        
//        
//        UIButton *tworightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 20,20) text:rightTitle textColor:[UIColor orangeColor]];
//
//        tworightBtn.backgroundColor=[UIColor redColor];
//        
//        [tworightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
//        
//        
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:tworightBtn];
//        
//         self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:rightBtn , nil];
        
//        
//        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 40, 30) text:rightTitle textColor:[UIColor orangeColor]];
//        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//            self.navigationItem.rightBarButtonItems= [NSArray arrayWithObjects:rightBtn, nil];
        
       
        
    }else if (!rightTitle && rightImageName) {
        
        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 20, 20) text:nil textColor:nil];
        [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
        rightBtn.backgroundColor=[UIColor redColor];
        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
        
    }
    
    
//    
//    if (rigthTwoTitle && !rightTwoImageName) {
//        
//        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 40, 30) text:rightTitle textColor:[UIColor orangeColor]];
//        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//        
//        
//        
//    }else if (!rigthTwoTitle && rightTwoImageName) {
//        
//        UIButton *rightBtn = [[FactoryManager shareManager] createBtnWithFrame:CGRectMake(0, 0, 40, 30) text:nil textColor:nil];
//        [rightBtn setImage:[UIImage imageNamed:rightImageName] forState:UIControlStateNormal];
//        rightBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
//        [rightBtn addTarget:self action:rightAction forControlEvents:UIControlEventTouchUpInside];
//        
//        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
//        
//    }
}



- (void)clearNavigationBar {
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    [self.navigationController.navigationBar setTranslucent:YES];
    
    //navigationController与navigationBar之间的横线置空
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_account"] forBarMetrics:UIBarMetricsDefault];
//    if ([[[UIDevice currentDevice] systemVersion] integerValue] >= 7.0) {
//        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"test"]
//                                                      forBarMetrics:UIBarMetricsDefault];
//    }
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
//    bg_account@2x
//    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
//        [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
//        [[UINavigationBar appearance] setTitleTextAttributes:
//         [NSDictionary dictionaryWithObjectsAndKeys:TomColor(0x333333), NSForegroundColorAttributeName, [UIFont fontWithName:@ "HelveticaNeue-CondensedBlack" size:17], NSFontAttributeName, nil]];
//    }
//    
    

}

@end
