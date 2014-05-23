//
//  KOKAppDelegate.h
//  RenRenKaraok
//
//  Created by Jarod Xiao on 12-7-11.
//  Copyright (c) 2012年 PKU. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef DEBUG
#define BASE_API_URL @"http://168.63.214.100:8000"
#else
#define BASE_API_URL @"http://168.63.214.100:8000"
#endif

//#define TIZI_API_URL @"http://192.168.11.129"
//
//#define TUIJIAN_URL @"http://txwt.app.91waijiao.com"
#define TuiJian @"/recommend_app/list.do?"



#define APP_ID                      @"0728104849"
#define kREQUEST_MAPPING            @"requestMapping"
#define UMENG_APPKEY                @"537ab96e56240b836304d347"
#define UDKey_GUIDE_VERSION         @"guide_version"
#define LOGIN_REFRESH_TOPIC         @"login_refresh_topic"   //当登陆后要及时获取最新数据

#define LOGIN_OR_LOGOUT             @"login_or_logout"//在另外一个设备上登录，session被重置了,  退出登录
#define OPEN_LEFT_SIDE              @"leftSide"

#define CHANGE_DATA                 @"changedata"
#define FIRST_COME                  @"firstcome"

#define HOME_PATH NSHomeDirectory()
#define DOCUMENT_PATH   [HOME_PATH stringByAppendingPathComponent:@"Documents"]
#define LIBRARY_PATH    [HOME_PATH stringByAppendingPathComponent:@"Library/Caches"]
#define SUBJECT_PATH    [DOCUMENT_PATH stringByAppendingPathComponent:@"subject.plist"]
#define DATABASE_PATH   [DOCUMENT_PATH stringByAppendingPathComponent:@"mySubject.sqlite"]
#define VIDEO_PATH      [DOCUMENT_PATH stringByAppendingPathComponent:@"MySubject"]


//设置系统bundle
#define SYS_MYBUNDLE_NAME @"system.bundle"
#define PRIVATE_BUNDLE_NAME @"private.bundle"
#define SYS_MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: SYS_MYBUNDLE_NAME]
#define PRIVATE_MYBUNDLE_PATH [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: PRIVATE_BUNDLE_NAME]
#define SYS_MYBUNDLE [NSBundle bundleWithPath: SYS_MYBUNDLE_PATH]
#define PRIVATE_MYBUNDLE [NSBundle bundleWithPath: PRIVATE_MYBUNDLE_PATH]

//设置系统
#define APPLICATION_FRAME [[UIScreen mainScreen] applicationFrame]
#define APPLICATION_FRAME_X APPLICATION_FRAME.origin.x
#define APPLICATION_FRAME_Y APPLICATION_FRAME.origin.y
#define APPLICATION_FRAME_W APPLICATION_FRAME.size.width
#define APPLICATION_FRAME_H APPLICATION_FRAME.size.height

//自定宏
#define RGBCOLORA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define RGBCOLOR(r,g,b) RGBCOLORA(r,g,b,1)

//侧边栏Cell选中
#define CELLCOLOR [UIColor colorWithRed:106/255.0 green:200/255.0 blue:246/255.0 alpha:1.0f]

//深灰色
#define DARKGRAYCOLOR [UIColor colorWithRed:111/255.0 green:111/255.0 blue:111/255.0 alpha:1.0f]


// ==================================================================
// 为适应iphone屏幕高度,iphone4 960px,iphone5 1136px
// 定义屏幕高度常量和设备识别常量
// ==================================================================
#define DeviceScreenHeight                        [[UIScreen mainScreen] bounds].size.height
#define DeviceScreenWidth                         [[UIScreen mainScreen] bounds].size.width
#define IS_IPHONE_5            ([UIScreen instancesRespondToSelector:  @selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define SystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define VERSION_GET    [[UIDevice currentDevice].systemVersion doubleValue]  //判定系统版本

#define IELTS_TIMEOUT_WIFI      10.0
#define IELTS_TIMEOUT_WWAN      20.0
#define kTabBarHeight 59

#define NAVIGATIONHEIGHT ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7?20:0)
#define IS_IOS_7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7?YES:NO)



