//
//  PopoverView.h
//  ArrowView
//
//  Created by guojiang on 4/9/14.
//  Copyright (c) 2014年 LINAICAI. All rights reserved.
//


#import <UIKit/UIKit.h>
/**
 * 弹出视图
 */
@interface PopoverView : UIView

-(id)initWithPoint:(CGPoint)point titles:(NSArray *)titles images:(NSArray *)images;
-(void)show;
-(void)dismiss;
-(void)dismiss:(BOOL)animated;

@property (nonatomic, copy) UIColor *borderColor;
@property (nonatomic, copy) void (^selectRowAtIndex)(NSInteger index);

@end
