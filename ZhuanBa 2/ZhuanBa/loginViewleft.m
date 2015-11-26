//
//  loginViewleft.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/20.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "loginViewleft.h"

@implementation loginViewleft
@synthesize leftfield,leftLable;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        leftLable = [[UILabel alloc]initWithFrame:CGRectMake(5, 0,kScreenWidth/3-20, self.frame.size.height )];
//        leftLable.center = CGPointMake(self.frame.size.height / 2, self.frame.size.height / 2);
//        leftLable.backgroundColor=[UIColor redColor];
        leftLable.textAlignment=NSTextAlignmentCenter;
//        leftLable.font=H4Font;
        
        [self addSubview:leftLable];
        
        leftfield = [[UITextField alloc]initWithFrame:CGRectMake(kScreenWidth/3-20, 0, kScreenWidth-leftLable.frame.size.width, self.frame.size.height)];
        [leftfield setFont:[UIFont fontWithName:KUIFont size:12]];
//        leftfield.backgroundColor=[UIColor greenColor];
        
        leftfield.textColor = [UIColor grayColor];
        [self addSubview:leftfield];
        
    }
    return self;
}

@end
