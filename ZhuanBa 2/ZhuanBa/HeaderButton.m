//
//  HeaderButton.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/10/23.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "HeaderButton.h"

@implementation HeaderButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 创建Label和图片
        [self createImage];
    }
    return self;
}

#pragma mark - 初始化图片和文字控件
- (void)createImage
{
    
    
    
    self.buttonImage = [[UIImageView alloc] initWithFrame:CGRectMake(25, 10, 35, 50*kScreenWidth/375-15)];
    [self addSubview:_buttonImage];
    
//    self.buttonName = [[UILabel alloc] initWithFrame:CGRectMake(0, _buttonImage.frame.size.height + 7, self.frame.size.width, self.frame.size.height / 5)];
    
     self.buttonName = [[UILabel alloc] initWithFrame:CGRectMake(0, self.buttonImage.frame.size.height+15, kScreenWidth/4-2  , 85*kScreenWidth/375-50*kScreenWidth/375)];
    [_buttonName setFont:[UIFont fontWithName:KUIFont size:4]];
    _buttonName.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_buttonName];
    
}



@end
