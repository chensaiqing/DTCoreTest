//
//  BaseNavBarView.m
//  RenRenKaraok
//
//  Created by Jarod Xiao on 12-8-15.
//  Copyright (c) 2012年 PKU. All rights reserved.
//
#import "z_UI.h"
#import "BaseNavBarView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BaseNavBarView

@synthesize rightNavButton,backButton,titilLabel,centreTitleImage,backToParentBtn,centerNavButton,backImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super initWithCoder:decoder];
    if(self) {
        [self doInit];
    }
    
    return self;
}

-(void) doInit {
    self.backgroundColor = [UIColor whiteColor];
//    //导航栏背景图片
    
    backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,self.frame.size.height-1)];
    backImage.backgroundColor = [z_UI colorWithHexString:@"#56c3bc"];
   
    [self addSubview:backImage];
    
    //导航中间标志
    centreTitleImage = [[UIImageView alloc] initWithFrame:CGRectMake(190,20 + NAVIGATIONHEIGHT,11,7)];
    centreTitleImage.image = [UIImage imageNamed:@"jiantou.png"];
   // centreTitleImage.center = self.center;
    [self addSubview:centreTitleImage];
    
    titilLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,0, 200, 44)];
    CGPoint point = self.center;
    CGFloat titleHeight = 0;
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7)
    {
        titleHeight = 10;
    }
    point.y += titleHeight;
    titilLabel.center = point;
    // titilLabel.text = @"口语教练";
    titilLabel.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:17];//[UIFont boldSystemFontOfSize:18];
    titilLabel.adjustsFontSizeToFitWidth = YES;
    //titilLabel.minimumFontSize = 8.0f;
    titilLabel.backgroundColor = [UIColor clearColor];
    titilLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    titilLabel.numberOfLines = 1;
   // titilLabel.shadowColor = [UIColor whiteColor];
    titilLabel.textColor=[z_UI colorWithHexString:@"#098a82"];
    //titilLabel.textColor=[UIColor colorWithRed:160 green:160 blue:160 alpha:1];;
    titilLabel.textAlignment = NSTextAlignmentCenter;
    
//    [[titilLabel layer] setShadowOffset:CGSizeMake(0, 1)];
//    [[titilLabel layer] setShadowRadius:0.2];
//    [[titilLabel layer] setShadowOpacity:1.0];
//    [[titilLabel layer] setShadowColor:[UIColor blackColor].CGColor];
    [self addSubview: titilLabel];
    
    //右侧按钮默认隐藏需要时设置显示
    rightNavButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightNavButton.frame = CGRectMake(260,  NAVIGATIONHEIGHT, 60, 44);
//    rightNavButton.backgroundColor = [UIColor clearColor];
////    [rightNavButton setBackgroundImage:[[UIImage imageNamed:@"navigationBarRightButton.png"] stretchableImageWithLeftCapWidth:15 topCapHeight:15] forState:UIControlStateNormal];

    
    [self addSubview:rightNavButton];
    
    //右侧按钮默认隐藏需要时设置显示
    centerNavButton = [UIButton buttonWithType:UIButtonTypeCustom];
    centerNavButton.frame = CGRectMake(120, 7+ NAVIGATIONHEIGHT, 70, 30);
    centerNavButton.titleLabel.font = [UIFont systemFontOfSize:18];
    centerNavButton.titleLabel.textColor = [UIColor redColor];
    [self addSubview:centerNavButton];
    
    backToParentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backToParentBtn.frame = CGRectMake(-10, 2 + NAVIGATIONHEIGHT, 89, 42);
    [backToParentBtn setImage:[UIImage imageNamed:@"backunpress.png"] forState:UIControlStateNormal];
    [backToParentBtn setImage:[UIImage imageNamed:@"backpress.png"] forState:UIControlStateHighlighted];
    [self addSubview:backToParentBtn];
    
    backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0+ NAVIGATIONHEIGHT, 60, 44);
    [backButton setImage:[UIImage imageNamed:@"LeftSideViewIcon.png"] forState:UIControlStateNormal];
    [self addSubview:backButton];
    
    UIView *topSeperatorView = [[UIView alloc] initWithFrame:CGRectMake(0, NAVIGATIONHEIGHT + 43, self.bounds.size.width, 1)];
    topSeperatorView.backgroundColor = [z_UI colorWithHexString:@"#AAA9A4"];
    [self addSubview:topSeperatorView];
    
    //设置可见
    backToParentBtn.hidden = NO;
    rightNavButton.hidden = YES;
    backButton.hidden = YES;
    centerNavButton.hidden = YES;
    centreTitleImage.hidden = YES;
}

@end
