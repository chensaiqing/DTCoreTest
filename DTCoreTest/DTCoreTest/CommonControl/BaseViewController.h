//
//  BaseViewController.h
//  RenRenKaraok
//
//  Created by Jarod Xiao on 12-7-27.
//  Copyright (c) 2012年 PKU. All rights reserved.
//


//对于基类的navbar或者button，只需要继承之后置为可见，并且直接修改文字或者背景图片，其他属性自动继承基类。
#import <UIKit/UIKit.h>
#import "BaseNavBarView.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong) BaseNavBarView            *navBar;//订制导航栏默认隐藏

@property (nonatomic, strong) UIView *coverView;

-(void)initBarView;

- (void)backToParentBtnPressed;

@end
