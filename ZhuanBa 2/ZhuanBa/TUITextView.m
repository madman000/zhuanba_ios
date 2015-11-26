//
//  TUITextView.m
//  UDY
//
//  Created by tom on 15/7/1.
//  Copyright (c) 2015年 Tom. All rights reserved.
//

#import "TUITextView.h"
#import "ZhuanBa.h"
//定义Frame
#define kScreenWidth   [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height
@implementation TUITextView
-(id)init
{
    self=[super init];
    if (self) {
        UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, kScreenHeight, 30)];
        [topView setBarStyle:UIBarStyleDefault];
        UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
        
        UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(dismissKeyBoard)];
        NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace,doneButton,nil];
        
        [topView setItems:buttonsArray];
        [self setInputAccessoryView:topView];
        

    }
    return self;
}

-(void)dismissKeyBoard
{
    [self resignFirstResponder];
}
@end
