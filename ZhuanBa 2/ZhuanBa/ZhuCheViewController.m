//
//  ZhuCheViewController.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/20.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "ZhuCheViewController.h"
#import "loginView.h"
#import "SheZhipassViewController.h"

@interface ZhuCheViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) loginView *phoneView;
@property (nonatomic, strong) loginView *yanzhengView;
//注册按钮
@property (nonatomic, strong) UIButton *loginBtn;

@end

@implementation ZhuCheViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view. backgroundColor =BackColor;
    [self navigationBarStyleWithTitle:@"注册" titleColor:[UIColor blackColor]  leftTitle:@"返回"leftImageName:nil leftAction:@selector(onback) rightTitle:nil rightImageName:nil rightAction:nil];
    [self createUI];
    
}

-(void)createUI{
    
    
    _phoneView = [[loginView alloc]initWithFrame:CGRectMake(0,40,kScreenWidth,60)];
    
    [_phoneView.leftfield  setPlaceholder:@"请输入您的手机号"];
    _phoneView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [_phoneView.rightimage setImage:[UIImage imageNamed:@"iphone"]];
    _phoneView.leftfield.delegate=self;
    _phoneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_phoneView];
    
    
    
    
    _yanzhengView = [[loginView alloc]initWithFrame:CGRectMake(0, _phoneView.center.y+32,kScreenWidth,60)];
    
    [_yanzhengView.leftfield  setPlaceholder:@"请输入收到的验证码"];
    
    [_yanzhengView.rightimage setImage:[UIImage imageNamed:@"iphone"]];
    _yanzhengView.leftfield.delegate=self;
    _yanzhengView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_yanzhengView];

    //    温馨提示
    
    UIButton*appcionBtn=[[UIButton alloc] initWithFrame:CGRectMake(12, self.yanzhengView.frame.origin.y+100, 14, 14)];
    appcionBtn.backgroundColor=[UIColor whiteColor];
    [appcionBtn setTitle:@"i" forState:UIControlStateNormal];
    appcionBtn.titleLabel.font=MiNiFont;
    appcionBtn.layer.cornerRadius = 7.0;
    appcionBtn.layer.borderWidth = 0.1;
    [appcionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:appcionBtn];
    
    UILabel*appcionLable=[[UILabel alloc] initWithFrame:CGRectMake(appcionBtn.frame.size.width+18, self.yanzhengView.frame.origin.y+90, 300, 30)];
    appcionLable.text=@"未注册过的手机将自动创建为转吧用户!";
    appcionLable.font=[UIFont systemFontOfSize:12];
    appcionLable.textColor=[UIColor grayColor];
    
    
    [self.view addSubview:appcionLable];
    
    [self.view addSubview:self.loginBtn];
    
    UILabel*textLable=[[UILabel alloc] initWithFrame:CGRectMake(40, self.loginBtn.frame.origin.y+100, kScreenWidth-60, 30)];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"说明:登录/注册说明您已经同意《转吧用户协议》"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(15,8)];
    textLable.attributedText=str;
    
    textLable.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:textLable];

    
  
}


- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.yanzhengView.frame.origin.y+120 , kScreenWidth - 30, 44);
        _loginBtn.backgroundColor = [UIColor orangeColor];
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(zhuchebtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}


-(void)zhuchebtn{

    SheZhipassViewController*vc=[[SheZhipassViewController alloc] init];
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
