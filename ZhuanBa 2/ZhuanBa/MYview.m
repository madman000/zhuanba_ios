//
//  MYview.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/26.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "MYview.h"

@implementation MYview
@synthesize leftimageview,uplable,downonelable,downtwolable;

- (id)initWithFrame:(CGRect)frame{
  
    self = [super initWithFrame:frame];
    if (self) {
    
        leftimageview=[[UIImageView alloc] initWithFrame:CGRectMake(5,5, 50 , 50)];
        [self addSubview:leftimageview];
        uplable=[[UILabel alloc] initWithFrame:CGRectMake(leftimageview.frame.size.width+5, 0, 65, 30)];
        uplable.textAlignment=NSTextAlignmentCenter;

        [self addSubview:uplable];
        downonelable=[[UILabel alloc] initWithFrame:CGRectMake(leftimageview.frame.size.width+5, uplable.frame.size.height+1, 68, 30)];
        downonelable.textAlignment=NSTextAlignmentCenter;
        [self addSubview:downonelable];
        
        downtwolable=[[UILabel alloc] initWithFrame:CGRectMake(5,downonelable.frame.size.height+28,120,20)];
        downtwolable.textAlignment=NSTextAlignmentCenter;

        [self addSubview:downtwolable];
        
   
        
    }
    
    return self;
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
