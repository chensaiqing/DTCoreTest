//
//  NewUserHelper.m
//  IELTSAnswer
//
//  Created by YuShuHui on 13-7-30.
//  Copyright (c) 2013年 肖锦博. All rights reserved.
//

#import "NewUserHelper.h"

@implementation NewUserHelper


+(void)showHelperInViewController:(UIView *)theView  withImageString:(NSString *)imageStr{
    UIView *view = theView;
    
    UIView *marksView = [[UIView alloc] initWithFrame:view.bounds];
    marksView.alpha = 0;
    marksView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    marksView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.0];
    [view addSubview:marksView];
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideMarks:)];
    [marksView addGestureRecognizer:gesture];
    
    UIImage *image = [UIImage imageNamed:imageStr];
    UIImageView *imgView = [[UIImageView alloc] initWithImage:image];
    if (IS_IPHONE_5) {
        imgView.frame = CGRectMake(0, 0, 320, 568);
    }else{
        imgView.frame = CGRectMake(0, 0, 320, 480);
    }
    
    imgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
    [marksView addSubview:imgView];
    
    [UIView animateWithDuration:0.3
                     animations:^{
                         marksView.alpha = 1.0;
                     }];
}

+(void)hideMarks:(UITapGestureRecognizer *)gesture{
    UIView *view = gesture.view;
    [UIView animateWithDuration:0.3
                     animations:^{
                         view.alpha = 0.0;
                     }completion:^(BOOL finished) {
                         [view removeFromSuperview];
                     }];

                  
}



@end
