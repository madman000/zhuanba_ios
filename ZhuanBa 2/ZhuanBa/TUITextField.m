//
//  TUITextField.m
//  UDH
//
//  Created by tom on 15/6/5.
//  Copyright (c) 2015年 UDH. All rights reserved.
//

#import "TUITextField.h"
//定义Frame
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

@implementation TUITextField

-(id)init
{
    self=[super init];
    if (self) {
        
       self.clearButtonMode = UITextFieldViewModeWhileEditing;
        UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , 30)];
        [topView setBarStyle:UIBarStyleDefault];
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
         UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
         NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
        
        [topView setItems:buttonsArray];
        [self setInputAccessoryView:topView];
        
        self.adjustsFontSizeToFitWidth = YES;
        self.minimumFontSize= 7;
    }
    return self;
}

-(void)dismissKeyBoard
{
    [self resignFirstResponder];
}
@end
