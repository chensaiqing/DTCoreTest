//
//  Constants.h
//  RenRenKaraok
//
//  Created by Hao Zhang on 12-7-26.
//  Copyright (c) 2012年 PKU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APPSetting.h"

#define MD5KEY    @"91waijiao"

#define k_binded_Weibo @"kok_binded_weibo"
#define k_binded_QQ    @"kok_binded_qq"

#define kAttentionPrivacy @"attention_update_privacy"

#define MOBILE_PLATFORM_URL   @"http://220.181.181.203"
#define APP_WEB_URL          @"http://k.renren.com"

#define K_NOTIFI_LOGIN       @"K_NOTIFI_LOGIN"
#define K_NOTIFI_LOGOUT       @"K_NOTIFI_LOGOUT"
#define K_PASS_OVER           @"K_PASS_OVER"

#define k_Weibo_UserName @"k_Weibo_UserName"
#define k_QQ_UserName    @"k_QQ_UserName"
#define k_NE_UserName    @"k_NE_UserName"

#define KOK_LAST_USERNAME @"kok_last_username"

#define KOK_RR_LAST_USERNAME @"KOK_RR_LAST_USERNAME"


#define KOK_DEFAULT_PIC @"http://fmn.rrimg.com/fmn059/ntcmobile/20121011/1445/original_AUx8_13e4000000831215.jpg"

#define KOK_DEFAULT_PIC_2 @"http://fmn.rrimg.com/fmn058/ntcmobile/20121011/1445/original_y9ew_1423000000851215.jpg"

#define KOK_ICON_URL @"http://fmn.rrimg.com/fmn060/ntcmobile/20121012/1150/original_p7Mg_13f6000000991215.jpg"

#define KOK_JPG @"http://fmn.rrimg.com/fmn058/ntcmobile/20121012/1020/large_b8qH_13d2000000931215.jpg"

typedef enum{
    UserSexAll = 0,
    UserSexMale = 1,
    UserSexFemale
}UserSex;

typedef enum{
    KokUploadStatusNone = -1,
    KokUploadStatusWaiting = 0,
    KokUploadStatusOnCompress,
    KokUploadStatusOnUploading,
    KokUploadStatusOnComplete,
    KokUploadStatusOnFailure,
    KokUploadStatusOnCancling,
    KokUploadStatusOnCancled,
    KokUploadStatusOnSaveComplete,
    KokUploadStatusUnderChecking,
    KokUploadStatusCheckSuc,
    KokUploadStatusCheckFail
}KokUploadStatus;

typedef enum{
    OrigSingerTypeChineseMan = 1,
    OrigSingerTypeChineseLady = 2,
    OrigSingerTypeChineseBands = 4,
    OrigSingerTypeOverSeas = 8
}OrigSingerType;

