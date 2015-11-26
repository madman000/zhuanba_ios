//
//  loginView.m
//  UDY
//
//  Created by Tom on 14-12-31.
//  Copyright (c) 2014年 Tom. All rights reserved.
//

#import "loginView.h"

@implementation loginView

@synthesize rightimage,leftfield;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        rightimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.height / 2, self.frame.size.height / 2)];
        rightimage.center = CGPointMake(self.frame.size.height / 2, self.frame.size.height / 2);
        [self addSubview:rightimage];
        
        leftfield = [[UITextField alloc]initWithFrame:CGRectMake(self.frame.size.height, 0, self.frame.size.width - self.frame.size.height*3+15, self.frame.size.height)];
        [leftfield setFont:[UIFont fontWithName:KUIFont size:13]];
       
        leftfield.textColor = [UIColor grayColor];
        [self addSubview:leftfield];
        
    }
    return self;
}


@end
