//
//  HuiMaionecell.h
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/25.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HuiMaionecell : UITableViewCell<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *greeview;
@property (weak, nonatomic) IBOutlet UILabel *toponelabel;//闹市区
@property (weak, nonatomic) IBOutlet UIView *rightupview;
@property (weak, nonatomic) IBOutlet UIView *rightdownview;
@property (weak, nonatomic) IBOutlet UILabel *downonelable;//品牌街
@property (weak, nonatomic) IBOutlet UIImageView *upimageview;
@property (weak, nonatomic) IBOutlet UIImageView *downimageview;


@end
