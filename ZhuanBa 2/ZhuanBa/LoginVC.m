//
//  LoginVC.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/19.
//  Copyright © 2015年 吴建良. All rights reserved.
//

#import "LoginVC.h"
#import "FactoryManager.h"
#import "loginView.h"
#import "ZhuCheViewController.h"
#import "YanzhenViewController.h"
#import "MainViewController.h"

#define CELL_NUMBERS 6
#define CELL_HEIGHT 80

@interface LoginVC ()<UITextFieldDelegate>


@property(nonatomic,strong)UIButton*shoujihaoKBTN;//手机号快捷登入
@property(nonatomic,strong)UIButton*zhanghaoBTN;//账号密码登入

@property (nonatomic, strong) loginView *phoneView;
//定时器
@property (nonatomic,strong) NSTimer *timer;

@property (strong,nonatomic) UIAlertController *alertController;




//登录按钮
@property (nonatomic, strong) UIButton *loginBtn;


@property (nonatomic, strong) loginView *yanzhengView;
@property(nonatomic,strong) UIButton*threeBtn;
@property(nonatomic,strong) UIView*downview;


@property (assign,nonatomic) NSInteger second;

//获取验证码
@property (nonatomic, strong) UIButton *getVertifyBtn;


@property (strong, nonatomic) MainViewController *mainController;





@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.second = 4;
    [self createUI];
    
}



-(void)createUI{
    
        self.view. backgroundColor =BackColor;
    [self navigationBarStyleWithTitle:@"登录" titleColor:[UIColor blackColor]  leftTitle:nil leftImageName:@"img_account_head" leftAction:nil rightTitle:@"注册" rightImageName:nil rightAction:@selector(registeBtnClick)];
    
   
    
    
    self.alertController = [UIAlertController alertControllerWithTitle:nil message:@"我知道了" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [ self.alertController addAction:cancelAction];
    [ self.alertController addAction:okAction];
    
//    [self presentViewController:alertController animated:YES completion:nil];

    
 
    [self createFrame];


  
}

-(void)createFrame{
    _shoujihaoKBTN=[[UIButton alloc] init];
    _shoujihaoKBTN.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:_shoujihaoKBTN];
    
    
    _shoujihaoKBTN.titleLabel.font = H2Font;

    [_shoujihaoKBTN setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
    [_shoujihaoKBTN setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [_shoujihaoKBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(@50);
        make.width.mas_equalTo(kScreenWidth/2);
    }];
    
        
    _zhanghaoBTN=[[UIButton alloc] init];
    _zhanghaoBTN.backgroundColor=[UIColor whiteColor];
     _zhanghaoBTN.titleLabel.font = H2Font;
    
    [_zhanghaoBTN setTitle:@"账号密码登录" forState:UIControlStateNormal];
    [_zhanghaoBTN setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    [self.view addSubview:_zhanghaoBTN];
    
    [_zhanghaoBTN mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(_shoujihaoKBTN);
        make.width.mas_equalTo(kScreenWidth/2-2);
        make.left.equalTo(_shoujihaoKBTN.mas_right).with.offset(2);
        
    }];
    
    

    _phoneView = [[loginView alloc]initWithFrame:CGRectMake(0, _zhanghaoBTN.frame.size.height+65,kScreenWidth,60)];

    [_phoneView.leftfield  setPlaceholder:@"请输入您的手机号"];
    _phoneView.leftfield.backgroundColor=[UIColor redColor];
    _phoneView.leftfield.tag=121;
    
        _phoneView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
 
    [_phoneView.rightimage setImage:[UIImage imageNamed:@"iphone"]];
    _phoneView.leftfield.delegate=self;
    _phoneView.backgroundColor=[UIColor whiteColor];
    [_phoneView addSubview:self.getVertifyBtn];
    
    [self.view addSubview:_phoneView];
    
    


    _yanzhengView = [[loginView alloc]initWithFrame:CGRectMake(0, _phoneView.frame.size.height+67,kScreenWidth,60)];
    
    [_yanzhengView.leftfield  setPlaceholder:@"请输入收到的验证码"];
    _yanzhengView.leftfield.tag=122;
    
    
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
//
    
    UILabel*textLable=[[UILabel alloc] initWithFrame:CGRectMake(50, self.loginBtn.frame.origin.y+100, kScreenWidth-60, 30)];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"说明:登录/注册说明您已经同意《转吧用户协议》"];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(15,8)];
    textLable.attributedText=str;

    textLable.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:textLable];
    
    
    
    self.threeBtn=[[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2-80, textLable.center.y+20,kScreenWidth/2-20 , 30)];
    [self.threeBtn setTitle:@"第三方账号登录^" forState:UIControlStateNormal];
    self.threeBtn.backgroundColor=[UIColor grayColor];
    [self.threeBtn addTarget:self action:@selector(onbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.threeBtn];
    
    
  
}

-(void)onbutton:(UIButton*)sender{
    
    

}

- (UIButton *)getVertifyBtn {
    if (!_getVertifyBtn) {
        _getVertifyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_getVertifyBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getVertifyBtn.titleLabel.font = [UIFont systemFontOfSize:14.5];
        [_getVertifyBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [_getVertifyBtn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [_getVertifyBtn addTarget:self action:@selector(getVertifyBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _getVertifyBtn.layer.cornerRadius = 10;
        _getVertifyBtn.layer.masksToBounds = YES;
        
          [_getVertifyBtn.layer setBorderColor:[[UIColor orangeColor] CGColor]];
        
        [_getVertifyBtn.layer setBorderWidth:2];//设置边界的宽度
    }
    
    _getVertifyBtn.frame=CGRectMake(_phoneView.leftfield.center.x+110, 10, (kScreenWidth - 40 - 20)*1.0/4 +20, 40);
    
    
 
    _getVertifyBtn.backgroundColor = [UIColor whiteColor];
    
    return _getVertifyBtn;
}


//发送验证码
-(void)getVertifyBtnClick{

    UITextField *phoneTF = (UITextField *)[self.phoneView viewWithTag:121];

    if ([self isMobileNumber:phoneTF.text]) {
        
     
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFireMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        
     
      
        
    }
    else
    {
        self.alertController.message = @"手机号码输入错误";
            [self presentViewController:self.alertController animated:YES completion:nil];

    }

    
}


- (void)timerFireMethod {
    
    if (self.second == 1) {
        [self.timer invalidate];
        [self canGetVerifyCode];
    }else{
        self.second--;
        [self gettingVerifyCode];
    }
    
}


//倒计时开启状态
-(void)gettingVerifyCode{
    
    self.getVertifyBtn.enabled = NO;
    NSString *title = [NSString stringWithFormat:@"%lds后可重发",(long)self.second];
    [self.getVertifyBtn setTitle:title forState:UIControlStateNormal];
}
//倒计时关闭状态
-(void)canGetVerifyCode{
    
    self.second = 60;
    self.getVertifyBtn.enabled = YES;
    [self.getVertifyBtn setTitle:@"重新获取" forState:UIControlStateNormal];
}

- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.yanzhengView.frame.origin.y+120 , kScreenWidth - 30, 44);
        _loginBtn.backgroundColor = [UIColor orangeColor];
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
}

//NSString *originTel = @"13722223333";
//NSString *tel = [originTel stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
//登入
-(void)loginBtnClick{
//    UINavigationController *nav = nil;
//    _mainController = [[MainViewController alloc] init];
//    nav = [[UINavigationController alloc] initWithRootViewController:_mainController];
//    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0)) {
//        //        self.edgesForExtendedLayout=UIRectEdgeNone;
//        nav.navigationController.navigationBar.translucent = NO;
//    }
//
    
        _mainController = [[MainViewController alloc] init];

    [[[[UIApplication sharedApplication] delegate] window] setRootViewController:[[UINavigationController alloc] initWithRootViewController:_mainController]];
    



 
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    
//    [textField resignFirstResponder];
//    
//    if (textField == self.phoneNumberTF) {
//        [self.yanzhengViewTF becomeFirstResponder];
//    }
//    
//    return YES;
//}




//注册界面
-(void)registeBtnClick{
    
    ZhuCheViewController*vc=[[ZhuCheViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];

}



//手机号码判断
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    NSString * regex = @"1[0-9]{10}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    BOOL isMatch = [pred evaluateWithObject:mobileNum];
    return isMatch;
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
