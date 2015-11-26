//
//  HuiMaionecell.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/25.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "HuiMaionecell.h"

@implementation HuiMaionecell

- (void)awakeFromNib {
    // Initialization code
    self.rightupview.userInteractionEnabled=YES;
    self.rightdownview.userInteractionEnabled=YES;
    
 
    
    
}

-(void)handelTap:(UIGestureRecognizer*)sender{
 
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
