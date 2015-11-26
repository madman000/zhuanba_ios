//
//  BaDouVC.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/23.
//  Copyright © 2015年 吴建良. All rights reserved.
//   巴豆城

#import "BaDouVC.h"

@implementation BaDouVC


-(void)viewDidLoad{
    [super viewDidLoad];
    [self navigationBarStyleWithTitle:@"巴豆1" titleColor:[UIColor blackColor]  leftTitle:nil leftImageName:@"img_account_head" leftAction:nil rightTitle:@"注册" rightImageName:nil rightAction:@selector(registeBtnClick)];

}

@end
