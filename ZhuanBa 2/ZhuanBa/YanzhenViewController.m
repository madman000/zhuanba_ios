//
//  YanzhenViewController.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/20.
//  Copyright © 2015年 吴建良. All rights reserved.
//   原手机号验证

#import "YanzhenViewController.h"
#import "loginViewleft.h"

@interface YanzhenViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)loginViewleft*oneView;
@property(nonatomic,strong)UIButton*loginBtn;

//获取验证码
@property (nonatomic, strong) UIButton *getVertifyBtn;

@property(nonatomic,strong)UILabel*textLable;

@property(nonatomic,strong)UILabel*appcionLable;




@end

@implementation YanzhenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBarStyleWithTitle:@"原手机号验证" titleColor:[UIColor blackColor]  leftTitle:@"返回"leftImageName:nil leftAction:@selector(onback) rightTitle:nil rightImageName:nil rightAction:nil];

    
_appcionLable=[[UILabel alloc] initWithFrame:CGRectMake(10 ,20, kScreenWidth, 40)];
    _appcionLable.text=@"如需要更换账号登录手机号，需先进行原手机号验证!";
    _appcionLable.font=[UIFont systemFontOfSize:12];
    _appcionLable.textColor=[UIColor grayColor];
//    appcionLable.backgroundColor=[UIColor greenColor];
    
    [self.view addSubview:_appcionLable];
    
    
    _textLable=[[UILabel alloc] initWithFrame:CGRectMake(10 ,_appcionLable.center.y+20, kScreenWidth-120, 40)];
    _textLable.text=@"验证保密手机:1234556566565";
//    textLable.font=[UIFont systemFontOfSize:14];
    _textLable.textColor=[UIColor blackColor];
//    _textLable.backgroundColor=[UIColor redColor];
    
    [self.view addSubview:_textLable];
    
    
    
    _oneView = [[loginViewleft alloc]initWithFrame:CGRectMake(0,_textLable.center.y+40,kScreenWidth,60)];
    
    [_oneView.leftfield  setPlaceholder:@"请输入收到的验证码"];
    _oneView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneView.leftLable.text=@"验证码";
    
    _oneView.leftfield.delegate=self;
    _oneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_oneView];
    
    
    
    
    
//    //    温馨提示
    
    UIButton*appcionBtn=[[UIButton alloc] initWithFrame:CGRectMake(12,_oneView.center.x+50, 14, 14)];
    appcionBtn.backgroundColor=[UIColor whiteColor];
    [appcionBtn setTitle:@"i" forState:UIControlStateNormal];
    appcionBtn.titleLabel.font=MiNiFont;
    appcionBtn.layer.cornerRadius = 7.0;
    appcionBtn.layer.borderWidth = 0.1;
    [appcionBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:appcionBtn];
//
    UILabel*appcionteLable=[[UILabel alloc] initWithFrame:CGRectMake(appcionBtn.frame.size.width+18, _oneView.center.x+43, kScreenWidth-100, 30)];
    appcionteLable.text=@"未注册过的手机将自动创建为转吧用户!";
    appcionteLable.font=[UIFont systemFontOfSize:12];
    appcionteLable.textColor=[UIColor grayColor];
    
    
    [self.view addSubview:appcionteLable];
    
    [self.view addSubview:self.loginBtn];
    
    [self.view addSubview:self.getVertifyBtn];
    


    
    
    
}


- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.oneView.center.x+80 , kScreenWidth - 30, 44);
        _loginBtn.backgroundColor = [UIColor orangeColor];
        _loginBtn.layer.cornerRadius = 4;
        _loginBtn.layer.masksToBounds = YES;
        [_loginBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(queren) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _loginBtn;
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
    
    _getVertifyBtn.frame=CGRectMake(_textLable.center.x+130, _appcionLable.center.y+20, (kScreenWidth - 40 - 20)*1.0/4 +20, 40);
    
    
    
    _getVertifyBtn.backgroundColor = [UIColor whiteColor];
    
    return _getVertifyBtn;
}

-(void)getVertifyBtnClick{
 
    
}


-(void)queren{

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
