//
//  BaseViewController.m
//  RenRenKaraok
//
//  Created by Jarod Xiao on 12-7-27.
//  Copyright (c) 2012年 PKU. All rights reserved.
//

#import "BaseViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "IELTSAsyncRequestManager.h"

@interface BaseViewController ()

@end


@implementation BaseViewController
@synthesize navBar;

#pragma mark - View lifecycle
- (void)initBarView {
    navBar= [[BaseNavBarView alloc]initWithFrame:CGRectMake(0, 0, 320, NAVIGATIONHEIGHT+ 44)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    [self initBarView];
    
    if (IS_IOS_7) {
        UIView *statusView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
        statusView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:statusView];
    }

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark Button Actions
- (void)backToParentBtnPressed {
    [[IELTSAsyncRequestManager shareManager] cancelAllOperations];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
