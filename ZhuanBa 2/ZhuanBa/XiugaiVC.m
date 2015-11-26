//
//  XiugaiVC.m
//  ZhuanBa
//
//  Created by 吴建良 on 15/11/20.
//  Copyright © 2015年 吴建良. All rights reserved.
//修改密码

#import "XiugaiVC.h"
#import "loginViewleft.h"

@interface XiugaiVC ()<UITextFieldDelegate>
@property(nonatomic,strong)UITableView*xiugaitableview;
@property(nonatomic,strong)loginViewleft*oneView;
@property(nonatomic,strong)loginViewleft*twoView;
@property(nonatomic,strong)loginViewleft*thereeView;
@property(nonatomic,strong)UIButton*loginBtn;







@end

@implementation XiugaiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self navigationBarStyleWithTitle:@"修改密码" titleColor:[UIColor blackColor]  leftTitle:@"返回"leftImageName:nil leftAction:@selector(onback) rightTitle:nil rightImageName:nil rightAction:nil];
    
    _oneView = [[loginViewleft alloc]initWithFrame:CGRectMake(0,40,kScreenWidth,60)];
    
    [_oneView.leftfield  setPlaceholder:@"6－32位字符"];
    _oneView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _oneView.leftLable.text=@"当前密码";
    
    _oneView.leftfield.delegate=self;
    _oneView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_oneView];
    
    _twoView = [[loginViewleft alloc]initWithFrame:CGRectMake(0,_oneView.center.y+32,kScreenWidth,60)];
    
    [_twoView.leftfield  setPlaceholder:@"6－32位字符"];
    _twoView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _twoView.leftLable.text=@"新密码";
    
    _twoView.leftfield.delegate=self;
    _twoView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_twoView];
    
    _thereeView = [[loginViewleft alloc]initWithFrame:CGRectMake(0,_twoView.center.y+32,kScreenWidth,60)];
    
    [_thereeView.leftfield  setPlaceholder:@"6－32位字符"];
    _thereeView.leftfield.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    _thereeView.leftLable.text=@"确认新密码";
    
    _thereeView.leftfield.delegate=self;
    _thereeView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_thereeView];
     [self.view addSubview:self.loginBtn];
    
    

}


- (UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBtn.frame = CGRectMake(15, self.thereeView.center.x+80 , kScreenWidth - 30, 44);
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
