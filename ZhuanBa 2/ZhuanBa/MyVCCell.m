//
//  MyVCCell.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/26.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "MyVCCell.h"

@implementation MyVCCell
@synthesize leftLable,rightLable;


- (void)awakeFromNib {
    // Initialization code
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        leftLable=[[UILabel alloc] initWithFrame:CGRectMake(10, 0, 150, self.frame.size.height+16)];
        [self addSubview:leftLable];
        
        rightLable=[[UILabel alloc] initWithFrame:CGRectMake(leftLable.frame.size.width+80, 0, 100, self.frame.size.height+16)];
       rightLable.textAlignment=NSTextAlignmentRight;
      rightLable.textColor=[UIColor redColor];
        [self addSubview:rightLable];
        
        
    }
    return self;
    
}

//-(void)layoutSubviews{
//   int padding = 10;
//     WS(ws);
//    [leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(ws.mas_left).mas_offset(padding);
////        make.top.equalTo(ws.mas_top).mas_offset(-10);  ///
//        make.top.equalTo(self.contentView. mas_top).mas_offset(0);  ///
//
////        make.right.equalTo(ws.rightLable.mas_left).mas_offset(-8);
////        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-10);
//        make.bottom.equalTo(self.contentView.mas_bottom).mas_offset(-15);
//
//        
//        make.width.mas_equalTo(120);
////        make.height.mas_equalTo(40);
//        
//        
//    }];
//    
//    [rightLable mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.mas_top).mas_offset(3);  ///
////        make.right.equalTo(self.mas_right).mas_offset(-20);
//        make.bottom.equalTo(self.mas_bottom).mas_offset(-5);
//        make.width.mas_equalTo(130);
//        make.left.equalTo(ws.leftLable.mas_right).mas_offset(padding);
//
//        
//        
//    }];
//    
//}
//

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
