//
//  MainViewController.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/23.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "MainViewController.h"
#import "HuiMaiVC.h"
#import "BaDouVC.h"
#import "MyVC.h"

@interface MainViewController (){

    HuiMaiVC*huimaiVc;
    BaDouVC*badouVc;
    MyVC*myVc;
     NSArray*titles;
    
}

@end

@implementation MainViewController

-(void)viewDidLoad{
    
    
    [super viewDidLoad];
    
    huimaiVc=[[HuiMaiVC alloc] init];
    badouVc=[[BaDouVC alloc] init];
    myVc=[[MyVC alloc] init];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:huimaiVc,badouVc,myVc, nil];

    huimaiVc.tabBarItem.tag=0;
    badouVc.tabBarItem.tag    = 1;
    
    myVc.tabBarItem.tag = 2;
    
    titles = [NSArray arrayWithObjects:@"惠买单",@"巴豆城",@"我的",nil];

    [self setupSubviews:viewControllers];
    
    self.tabBarController.selectedIndex = 0;
    
    self.title = [titles objectAtIndex:0];
    
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    
    
    if (item.tag == 0){
        
        self.title = @"惠买单";
        
            self.navigationController.navigationBarHidden = YES;
//        NSLog(@"%ld",(long)item.tag);
        
        
    }
    else if (item.tag == 1){
        self.title = @"巴豆城";
        self.navigationController.navigationBarHidden = NO;
          [self navigationBarStyleWithTitle:@"巴豆城" titleColor:[UIColor blackColor]  leftTitle:nil leftImageName:nil leftAction:nil rightTitle:nil rightImageName:nil rightAction:nil];

// NSLog(@"%ld",(long)item.tag);
        //
        
        
    }
    else if (item.tag == 2){
        self.title = @"我的";
        self.navigationController.navigationBarHidden = NO;
        
        [self navigationBarStyleWithTitle:@"我的" titleColor:[UIColor blackColor]  leftTitle:nil leftImageName:nil leftAction:nil rightTitle:nil rightImageName:nil rightAction:nil];


//        NSLog(@"%ld",(long)item.tag);
        
    }
    
    
    
}


- (void)setupSubviews:(NSArray *)viewControllers
{
    NSArray *imagearrsel=  [NSArray arrayWithObjects:@"newshouyesel",@"xiaoxisel",@"newlianxirensel", nil];
    
    NSArray *imagearr = [NSArray arrayWithObjects:@"newshouye",@"xiaoxi",@"newlianxiren",nil];
    
    NSInteger i = 0;
    for (BaseViewController *viewController in viewControllers) {
        
        [viewController setTitle:[titles objectAtIndex:viewController.tabBarItem.tag]];
        id  view  = [viewController.tabBarItem initWithTitle:[titles objectAtIndex:viewController.tabBarItem.tag] image:[[UIImage imageNamed:[imagearr objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:[imagearrsel objectAtIndex:i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [self unSelectedTapTabBarItems:view];
        [self selectedTapTabBarItems:view];
        
    }
    
    
    self.viewControllers = viewControllers;
    
    
}
    

-(void)unSelectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10], UITextAttributeFont,[UIColor grayColor],UITextAttributeTextColor,
                                        nil] forState:UIControlStateNormal];
    
}

-(void)selectedTapTabBarItems:(UITabBarItem *)tabBarItem
{
    [tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont systemFontOfSize:10],
                                        UITextAttributeFont,RedColor,UITextAttributeTextColor,
                                        nil] forState:UIControlStateSelected];
}
    

@end
