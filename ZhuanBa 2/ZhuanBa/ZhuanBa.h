//
//  ZhuanBa.h
//  ZhuanB
//
//  Created by 劳逸 on 15/10/15.
//  Copyright © 2015年 ellll. All rights reserved.
//

#ifndef ZhuanBa_h
#define ZhuanBa_h


//控制全局字体
#define KUIFont @"FZLanTingHeiS-R-GB"
#define BackColor TomColor(0xefeff4)
//控制全局字体大小 H1
#define H1Font [UIFont systemFontOfSize:16]
//控制全局字体大小 H2
#define H2Font [UIFont systemFontOfSize:14]
//控制全局字体大小 H3
#define H3Font [UIFont systemFontOfSize:13]
//控制全局字体大小 H4
#define H4Font [UIFont systemFontOfSize:12]

#define H5Font [UIFont systemFontOfSize:10]

#define MiNiFont [UIFont systemFontOfSize:9]

//字体
#define FontName @"HelveticaNeue-Light"
#define FontNameBold @"HelveticaNeue-Bold"

//控制全局红色按钮颜色
#define RedColor TomColor(0xe03e3f)
#define navigationHeight (44)



#define GrennColor [UIColor colorWithRed:0.0 green:122.0/255.0 blue:1.0 alpha:1.0]

#define TomColor(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BackColor TomColor(0xefeff4)

#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//定义popViewControllerAnimated
#define kPop [self.navigationController popViewControllerAnimated:YES]

//
//*全局的weakSelf
//*/
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

//iOS 系统版本
#define IOS_IS_AT_LEAST_6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define IOS_IS_AT_LEAST_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define IOS_IS_AT_LEAST_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define iPhone6P ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//判断系统是否是iOS7
#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
/* 屏幕 */
#define deviceHasStateBar 1
#define deviceOrientation 1

#define kScreenHeight (deviceHasStateBar ? (deviceOrientation ? [[UIScreen mainScreen] bounds].size.height - 20 : [[UIScreen mainScreen] bounds].size.width - 20) : (deviceOrientation ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width))

#define TOPHIGHT (64)
#define kScreenWidth (deviceOrientation ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#endif /* ZhuanBa_h */
