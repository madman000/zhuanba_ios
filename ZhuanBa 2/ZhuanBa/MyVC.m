//
//  MyVC.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/23.
//  Copyright © 2015年 吴建良. All rights reserved.
//    我的

#import "MyVC.h"
#import "MyVCCell.h"
#import "MYview.h"


static NSString *MyVCCellID       = @"MyVCCell";
@interface MyVC ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*myTableview;
@property(nonatomic,strong)NSArray*lefttitleArry;
@property (nonatomic, strong) UIView*headview;
@property (nonatomic, strong) MYview*oneview;
@property (nonatomic, strong) MYview*twoview;
@property (nonatomic, strong) MYview*threeview;






@end
@implementation MyVC


-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.lefttitleArry=[[NSArray alloc] initWithObjects:@"惠买单订单", @"商城订单",@"优惠卷",@"邀请有奖",@"我要开店",nil];
    [self createTableview];
    

    
}

-(void)createTableview{
  
    
    _myTableview=[[UITableView alloc] init];
    
    _myTableview.delegate=self;
    _myTableview.dataSource=self;
    _myTableview.tableHeaderView=[self headview];
      _myTableview.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:_myTableview];
    [_myTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(0, 0,0, 0));
        
        
    }];
    
    
    
}

-(UIView*)headview{
    _headview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
    _headview.backgroundColor=BackColor;
    
    UIView*headupview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    headupview.backgroundColor=[UIColor greenColor];
    [_headview addSubview:headupview];
    
//    头像
    UIImageView*topimageview=[[UIImageView alloc] initWithFrame:CGRectMake(20, 45, 50, 50)];
    topimageview.image=[UIImage imageNamed:@"img_account_head"];
    [headupview addSubview:topimageview];
//    尚未登入
    UILabel*shangweiLable=[[UILabel alloc] initWithFrame:CGRectMake(topimageview.frame.size.width+30, 50, 120, 40)];
//    shangweiLable.backgroundColor=[UIColor redColor];
    shangweiLable.text=@"尚未登录";
    
    [headupview addSubview:shangweiLable];
    
//    二维码
    UIImageView*erWeiimageview=[[UIImageView alloc] initWithFrame:CGRectMake(kScreenWidth-80, 25, 50, 50)];
//    erWeiimageview.backgroundColor=[UIColor redColor];
    erWeiimageview.image=[UIImage imageNamed:@"heradimage"];
    [headupview addSubview:erWeiimageview];
    
    UILabel*erweiLable=[[UILabel alloc] initWithFrame:CGRectMake(kScreenWidth-100,erWeiimageview.frame.size.height+28,  98, 30)];
    erweiLable.text=@"我的推广码";
//    erweiLable.backgroundColor=[UIColor whiteColor];
    [headupview addSubview:erweiLable];
    
    
    UIView*headdowview=[[UIView alloc] initWithFrame:CGRectMake(0, headupview.frame.size.height+1, kScreenWidth, 78)];
    headdowview.backgroundColor=BackColor;
    [_headview addSubview:headdowview];
    
   _oneview=[[MYview alloc] initWithFrame:CGRectMake(0, 0.1, kScreenWidth/3, 78)];
    _oneview.backgroundColor=[UIColor whiteColor];
//    _oneview.leftimageview.backgroundColor=[UIColor redColor];
    _oneview.leftimageview.image=[UIImage imageNamed:@"heradimage"];

    _oneview.uplable.text=@"我的钱包";
 
    _oneview.downonelable.font=H4Font;
     _oneview.uplable.font=H1Font;
    
    _oneview.downonelable.text=@"450d元";
   
 
   
//    _oneview.downonelable.backgroundColor=[UIColor yellowColor];
    [headdowview addSubview:_oneview];
    
    
    
    _twoview=[[MYview alloc] initWithFrame:CGRectMake(_oneview.frame.size.width+1, 0.1, kScreenWidth/3, 78)];
    
     _twoview.uplable.text=@"我的收藏";
    _twoview.leftimageview.image=[UIImage imageNamed:@"heradimage"];
    _twoview.downonelable.text=@"450d元";
   _twoview.downtwolable.text=@"收藏的没电都在这里哦";
    _twoview.downtwolable.font=MiNiFont;
    _twoview.downonelable.font=H4Font;

    _twoview.uplable.font=H1Font;
    _twoview.backgroundColor=[UIColor whiteColor];
    [headdowview addSubview:_twoview];
    
    
    
    _threeview=[[MYview alloc] initWithFrame:CGRectMake(_twoview.frame.size.width+kScreenWidth/3+2, 0.1, kScreenWidth/3, 78)];
         _threeview.uplable.text=@"购物车";
    _threeview.downonelable.text=@"450d元";

    _threeview.downonelable.font=H4Font;

    _threeview.leftimageview.image=[UIImage imageNamed:@"heradimage"];

    _threeview.backgroundColor=[UIColor whiteColor];
    [headdowview addSubview:_threeview];

    
    return _headview;
    
    
}

-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyVCCell *cell = [tableView dequeueReusableCellWithIdentifier:MyVCCellID];
    if (!cell) {
        cell=[[MyVCCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyVCCellID];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    }
    
    if (indexPath.row!=2) {
        cell.rightLable.hidden=YES;
    }
    
    
    cell.leftLable.text=_lefttitleArry[indexPath.row];
    
    cell.rightLable.text=@"2张";
   
    
    return cell;
    
}


@end
