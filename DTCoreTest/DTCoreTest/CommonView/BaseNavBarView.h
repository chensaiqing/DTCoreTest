//
//  BaseNavBarView.h
//  RenRenKaraok
//
//  Created by Jarod Xiao on 12-8-15.
//  Copyright (c) 2012年 PKU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNavBarView : UIView
//所有按钮事件需要自定义
@property (nonatomic, strong) UIButton                  *rightNavButton;//右侧按钮默认隐藏,需要时设置显示
@property (nonatomic, strong) UIButton                  *centerNavButton;//中间按钮默认隐藏,需要时设置显示
@property (nonatomic, strong) UIButton                  *backButton;//navbar左侧按钮拉出侧边栏,默认隐藏
@property (nonatomic, strong) UILabel                   *titilLabel;//navbar标题栏，可修改标题,默认隐藏
@property (nonatomic, strong) UIImageView               *centreTitleImage;//标题栏图片,默认可见
@property (nonatomic, strong) UIButton                  *backToParentBtn;//返回按钮,上一层界面,默认可见
@property (nonatomic, strong) UIImageView               *backImage;//导航栏背景图片,默认可见
@end
