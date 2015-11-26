//
//  SheZhipassViewController.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/20.
//  Copyright © 2015年 吴建良. All rights reserved.
//设置密码

#import "SheZhipassViewController.h"
#import "loginView.h"
#import "XiugaiVC.h"
@interface SheZhipassViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) loginView *phoneView;
@property (nonatomic,strong)UIButton*loginBtn;



@end

@implementation SheZhipassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBarStyleWithTitle:@"设置密码" titleColor:[UIColor blackColor]  leftTitle:@"返回"leftImageName:nil leftAction:@selector(onback) rightTitle:nil rightImageName:nil rightAction:nil];

    _phoneView = [[loginView alloc]initWithFrame:CGRectMake(0,40,kScreenWidth,60)];
    
    [_phoneView.leftfield  setPlaceholder:@"请重新设置登录密码"];
    _phoneView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [_phoneView.rightimage setImage:[UIImage imageNamed:@"iphone"]];
    _phoneView.leftfield.delegate=self;
    _phoneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_phoneView];
    
    
    //    温馨提示
    
    UIButton*appcionBtn=[[UIButton alloc] initWithFrame:CGRectMake(12, self.phoneView.frame.origin.y+90, 14, 14)];
    appcionBtn.backgroundColor=[UIColor whiteColor];
    [appcionBtn setTitle:@"i" forState:UIControlStateNormal];
    appcionBtn.titleLabel.font=MiNiFont;
    appcionBtn.layer.cornerRadius = 7.0;
    appcionBtn.layer.borderWidth = 0.1;
    [appcionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:appcionBtn];
    
    UILabel*appcionLable=[[UILabel alloc] initWithFrame:CGRectMake(appcionBtn.frame.size.width+18, self.phoneView.frame.origin.y+80, 300, 30)];
    appcionLable.text=@"密码长度至少6个字符，最多32个字符";
    appcionLable.font=[UIFont systemFontOfSize:12];
    appcionLable.textColor=[UIColor grayColor];
    
    
    [self.view addSubview:appcionLable];
    
    [self.view addSubview:self.loginBtn];

    
    
    
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.phoneView.frame.origin.y+120 , kScreenWidth - 30, 44);
        _loginBtn.backgroundColor = [UIColor orangeColor];
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(queren) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}


-(void)queren{
    
    XiugaiVC*vc=[[XiugaiVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

    
}


-(void)onback{
    
    kPop;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
