//
//  SetUtil.h
//  RenRenMusic
//
//  Created by jianting liu on 12-6-7.
//  Copyright (c) 2012年 renren-inc. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const ThirdTypeQQ;
extern NSString * const ThirdTypeWeibo;


@interface SetUtil : NSObject
//保存是否开启动画
+(void)saveAnimationYN:(NSString *)animationYN;
+ (NSString *)getAnimationYN;
#pragma mark - 用户信息

//保存出题范围回来前的buttontag
+ (void)saveChuTiBtnTag:(NSString *)chutiInfo;
+ (NSString *)getChutiBtnTag;
+ (void)removeChuTiBtnTag;


////个人信息获取
+ (NSString *)getExperience;
+ (NSString *)getFinish;
+ (NSString *)getRank;
+ (NSString *)getTotalFriend;
+ (NSString *)getTotalUse;
+ (NSString *)getRightRate;


//保存出题前的section
+ (void)saveChuTiSection:(NSString *)chutiInfo;
+ (NSString *)getChutiSection;


+ (void)saveUserInfo:(NSDictionary *)userInfo;
+ (void)removeUserInfo;

+ (void)saveSessionId:(NSString *)sessionId;
+ (NSString *)getSessionId;

+ (BOOL)isUserLogined;

//保存所在地区信息
+ (void)saveRegionId:(NSString *)regionId;
+ (NSString *)getRegionId;
//+ (NSString *)getRegionInfo;
//+ (void)saveRegionInfo:(NSString *)regionInfo;

//保存出题范围信息
+ (void)saveChuTiInfo:(NSString *)chutiInfo;
+ (NSString *)getChutiInfo;

//保存宠物id信息
+ (void)savePetId:(NSString *)petId;
+ (NSString *)getPetId;

//保存宠物状态
+ (void)savePetStatus:(NSString *)pet_status;
+ (NSString *)getPetStatus;

//保存邮箱信息
+ (void)saveEmailInfo:(NSString *)emailInfo;
+ (NSString *)getEmailInfo;


#pragma mark - file path
+ (NSString *)setFilePath;
+ (NSMutableDictionary *)checkSet;
+ (void)saveSet:(NSDictionary *)dictionary;

+ (NSString *)getUserId;
+ (void)setUserName:(NSString *)userName;
+ (NSString *)getUserName;


#pragma mark - 第三方账户
+ (void)saveThirdUid:(NSString *)third_uid;
+ (NSString *)getThirdUid;
+ (void)saveToken:(NSString *)token;
+ (NSString *)getToken;

//+ (void)setXingxing:(NSNumber *)xingxing;
//+ (NSNumber *)getXingxing;
//+ (NSString *)getHeadImge;
//+ (void)setHeadImge:(NSString *)headImage;
//
//
//#pragma mark - token
//+ (void)saveAccessToken:(NSString *)accessToken;
//+ (NSString *)getAccessToken;
//
//
//+ (void)saveDeviceToken:(NSString *)deviceToken;
//+ (NSString *)getDeviceToken;
//+ (BOOL)isRegDeviceToken;
//+ (void)regedDeviceToken;
//+ (void)unregDeviceToken;
//
//
//#pragma mark - 绑定信息
//+ (void)bindedQQ:(NSString *)qqToken;
//+ (void)bindedWeibo:(NSString *)weiboToken;
//+ (BOOL)isBindedQQ;
//+ (BOOL)isBindedWeibo;
//
//
//#pragma mark - 缓存数据
//+ (void)setCacheData:(NSString *)cachedata;
//+ (NSString *)getCachedata;
//+ (void)setImgCacheData:(NSMutableArray *)imgArr;
//+ (NSMutableArray *)getImgCacheData;
//+ (void)removeCacheData;
//
//
////把NSDate型的转换NSString型
//+ (NSString*)dateToStringWithDate:(NSDate *)date;
////把NSString转为NSDate
//+ (NSDate *)stringToDateWithDateString:(NSString *)dateString;
//


@end
