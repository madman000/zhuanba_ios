//
//  HuiMaiVC.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/23.
//  Copyright © 2015年 吴建良. All rights reserved.
//   惠买单

#import "HuiMaiVC.h"
#import "BMAdScrollView.h"
#import "XXFAdHeadlineView.h"
#import "HeaderButton.h"
#import "HuiMaionecell.h"
#import "HuiMaitwocell.h"
#import "HuiMaithreecell.h"


static NSString *HomeAssetTableViewCellID       = @"HuimaioneCell";

@interface HuiMaiVC ()<UITableViewDataSource,UITableViewDelegate,XXFAdHeadlineViewDelegate,UIGestureRecognizerDelegate>
@property(nonatomic,strong)UITableView*tableview;
@property (nonatomic, strong) UIView*headview;
@property (nonatomic, strong) BMAdScrollView*bmadScrollView;
@property (nonatomic, strong) UIView             *topBackGroudView;
@property (nonatomic, strong) UIImageView        *unloginImgView;

//广告image
@property (nonatomic, strong)   NSMutableArray     *images;

@end

@implementation HuiMaiVC

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:NO];
    self.navigationController.navigationBarHidden = YES;
  
    
}
-(void)viewDidLoad{
    [super viewDidLoad];
    
    
    UIView*view1=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    view1.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:view1];
    
    
    
    _tableview=[[UITableView alloc] init];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.backgroundColor=BackColor;
    _tableview.tableHeaderView=self.headview;
    //隐藏滚动条
     _tableview.separatorStyle = NO;
    
    _tableview.showsVerticalScrollIndicator =NO;
  
    
    
    [self.view addSubview:_tableview];
    
    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 0,5, 0));
        
        
    }];
    
    
    
    

}

-(UIView*)headview{
    
    _headview=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 210)];
    
    _headview.backgroundColor=BackColor;
    NSMutableArray * arr = [NSMutableArray array];
    [arr addObject:@"bg1"];
    [arr addObject:@"bg1"];
    [arr addObject:@"bg1"];
 
    
    XXFAdHeadlineView * xxview = [[XXFAdHeadlineView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 120)];
    xxview.delegate = self;
    [xxview setSlideImgArr:arr Interval:3];
   
    
    [_headview addSubview:xxview];
    
    NSArray*BTNnames=@[@"全部分类",@"我的吧币",@"购物车",@"商城订单"];
    NSArray *imgArray= @[@"goods1", @"goods1", @"goods1", @"goods1"];
    
    for (int i=0; i<BTNnames.count; i++) {
        
        int row = i/4;
        int col = i%4;
        
        CGRect rect = CGRectMake(col*kScreenWidth/4, 120+row*90*kScreenWidth/375,kScreenWidth/4, 85*kScreenWidth/375);
        HeaderButton *button = [HeaderButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100+i;
        button.backgroundColor=[UIColor whiteColor];
        
        
        [button.buttonName setText:BTNnames[i]];
      
        [button.buttonImage setImage:[UIImage imageNamed:[imgArray objectAtIndex:i]]];
  
        button.buttonName.textColor=[UIColor blackColor];
        
        button.buttonName.font=H4Font;
 
        
        
        button.frame = rect;
        [button addTarget:self action:@selector(onButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_headview addSubview:button];
        
    }
    return _headview;

    
}


-(void)onButtonClick:(UIButton*)sender{
 
    NSLog(@"%ld",(long)sender.tag);

}


//图片点击事件

- (void)tapClick:(int)tag
{
    NSLog(@"%d",tag);
    
}




-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView* myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, 10)];
//    
//    myView.backgroundColor = [UIColor redColor];
//    
//    return myView;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    
//    return 10;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  
    if (0 == indexPath.row) {
        return 160;
    }else if (1 == indexPath.row) {
        return 211;
    }
    else if (2==indexPath.row){
        return 190;
        
    }else{
     
        return 211;
        
    }
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    static NSString*cellid=@"cellid";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
//    }
//    cell.textLabel.text=@"dd33";
//    return cell;


//
//
    if (indexPath.row==0) {
        static NSString*HomeAssetTableViewCellID=@"oneTableViewCell";
        
        HuiMaionecell *onecell = [tableView dequeueReusableCellWithIdentifier:HomeAssetTableViewCellID];
        
          onecell.selectionStyle =UITableViewCellSelectionStyleNone;
        
        if (!onecell) {
            onecell = [[[NSBundle mainBundle] loadNibNamed:@"HuiMaionecell" owner:self options:nil] lastObject];
        }
        
        UITapGestureRecognizer *tapupGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handeuplTap:)];
        tapupGes.delegate=self;
        
        [onecell.rightupview addGestureRecognizer:tapupGes];
        
        
        UITapGestureRecognizer *tapdowGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handedowlTap:)];
        tapdowGes.delegate=self;
        
        [onecell.rightdownview addGestureRecognizer:tapdowGes];
        
        
        return onecell;
    }
    
//  else if (indexPath.row==1){
//    
//        static NSString*HuiMaithreecellid=@"HuiMaithreecell";
//        
//        HuiMaithreecell *onecell = [tableView dequeueReusableCellWithIdentifier:HuiMaithreecellid];
//        
//        
//        if (!onecell) {
//            onecell = [[[NSBundle mainBundle] loadNibNamed:@"HuiMaithreecell" owner:self options:nil] lastObject];
//        }
//        
//        
//        
//        
//        return onecell;
//        
//
//        
//       
//    }
    else if (indexPath.row==2){
        
        static NSString*HuiMaithreecellid=@"HuiMaitwocell";
        
        HuiMaitwocell *twocell = [tableView dequeueReusableCellWithIdentifier:HuiMaithreecellid];
        
        
        if (!twocell) {
            twocell = [[[NSBundle mainBundle] loadNibNamed:@"HuiMaitwocell" owner:self options:nil] lastObject];
        }
        
        
        
        
        return twocell;
        
        
    }
    

    else{
        static NSString*HuiMaithreecellid=@"HuiMaithreecell";
        
        HuiMaithreecell *onecell = [tableView dequeueReusableCellWithIdentifier:HuiMaithreecellid];
        
        
        if (!onecell) {
            onecell = [[[NSBundle mainBundle] loadNibNamed:@"HuiMaithreecell" owner:self options:nil] lastObject];
        }
        
        
        
        
        return onecell;
    }
    
//

    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)handeuplTap:(UIGestureRecognizer*)sender{
    NSLog(@"点击背景shang");
}


-(void)handedowlTap:(UIGestureRecognizer*)sender{
 NSLog(@"点击背景xia");
}
//-(void)

@end
