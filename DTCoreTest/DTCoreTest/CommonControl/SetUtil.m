//
//  SetUtil.m
//  RenRenMusic
//
//  Created by jianting liu on 12-6-7.
//  Copyright (c) 2012年 renren-inc. All rights reserved.
//

#import "SetUtil.h"

NSString * const ThirdTypeQQ = @"qq";
NSString * const ThirdTypeWeibo = @"sina";

@implementation SetUtil

#pragma mark - 用户信息
+ (void)saveUserInfo:(NSDictionary *)userInfo {
    NSMutableDictionary *dic = [SetUtil checkSet];
    if ([userInfo objectForKey:@"nick_name"]) {
        [dic setObject:[userInfo objectForKey:@"nick_name"] forKey:@"nick_name"];
    }
    if ([userInfo objectForKey:@"email"]) {
        [dic setObject:[userInfo objectForKey:@"email"] forKey:@"email"];
    }
    if ([userInfo objectForKey:@"region_catalog_id"]) {
        [dic setObject:[userInfo objectForKey:@"region_catalog_id"] forKey:@"region_catalog_id"];
    }
    if ([userInfo objectForKey:@"pet_id"]) {
        [dic setObject:[userInfo objectForKey:@"pet_id"] forKey:@"pet_id"];
    }
    if ([userInfo objectForKey:@"pet_status"]) {
        [dic setObject:[userInfo objectForKey:@"pet_status"] forKey:@"pet_status"];
    }
    if ([userInfo objectForKey:@"user_id"]) {
        [dic setObject:[userInfo objectForKey:@"user_id"] forKey:@"user_id"];
    }
    if ([userInfo objectForKey:@"range"]) {
        [dic setObject:[userInfo objectForKey:@"range"] forKey:@"range"];
    }
    
    if ([userInfo objectForKey:@"experience"]) {
        [dic setObject:[userInfo objectForKey:@"experience"] forKey:@"experience"];//经验值
    }
    if ([userInfo objectForKey:@"finish"]) {
        [dic setObject:[userInfo objectForKey:@"finish"] forKey:@"finish"];//总做题数
    }
    if ([userInfo objectForKey:@"rank"]) {
        [dic setObject:[userInfo objectForKey:@"rank"] forKey:@"rank"];//排行榜
    }
    if ([userInfo objectForKey:@"total_friend"]) {
        [dic setObject:[userInfo objectForKey:@"total_friend"] forKey:@"total_friend"];
    }
    if ([userInfo objectForKey:@"total_use"]) {
        [dic setObject:[userInfo objectForKey:@"total_use"] forKey:@"total_use"];//使用天数
    }
    if ([userInfo objectForKey:@"right_rate"]) {
        [dic setObject:[userInfo objectForKey:@"right_rate"] forKey:@"right_rate"];//正确率
    }
    
    [SetUtil saveSet:dic];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"delegateGetUserId" object:nil];
}


//个人信息获取
+ (NSString *)getExperience {
    NSDictionary *item1 = [SetUtil checkSet];
    id experience = [item1 objectForKey:@"experience"];
    if ([experience isKindOfClass:[NSNumber class]]) {
        return [experience stringValue];
    }
    return [item1 objectForKey:@"experience"];
}
+ (NSString *)getFinish {
    NSDictionary *item1 = [SetUtil checkSet];
    id finish = [item1 objectForKey:@"finish"];
    if ([finish isKindOfClass:[NSNumber class]]) {
        return [finish stringValue];
    }
    return [item1 objectForKey:@"finish"];
}
+ (NSString *)getRank {
    NSDictionary *item1 = [SetUtil checkSet];
    id rank = [item1 objectForKey:@"rank"];
    if ([rank isKindOfClass:[NSNumber class]]) {
        return [rank stringValue];
    }
    return [item1 objectForKey:@"rank"];
}
+ (NSString *)getTotalFriend {
    NSDictionary *item1 = [SetUtil checkSet];
    id total_friend = [item1 objectForKey:@"total_friend"];
    if ([total_friend isKindOfClass:[NSNumber class]]) {
        return [total_friend stringValue];
    }
    return [item1 objectForKey:@"total_friend"];
}
+ (NSString *)getTotalUse {
    NSDictionary *item1 = [SetUtil checkSet];
    id total_use = [item1 objectForKey:@"total_use"];
    if ([total_use isKindOfClass:[NSNumber class]]) {
        return [total_use stringValue];
    }
    return [item1 objectForKey:@"total_use"];
}
+ (NSString *)getRightRate {
    NSDictionary *item1 = [SetUtil checkSet];
    id right_rate = [item1 objectForKey:@"right_rate"];
    if ([right_rate isKindOfClass:[NSNumber class]]) {
        return [right_rate stringValue];
    }
    return [item1 objectForKey:@"right_rate"];
}


+(void)saveAnimationYN:(NSString *)animationYN{
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:animationYN forKey:@"animationYorN"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getAnimationYN{
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"animationYorN"];
}
//保存出题范围回来前的buttontag
+ (void)saveChuTiBtnTag:(NSString *)chutiInfo{
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:chutiInfo forKey:@"chutiTag"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getChutiBtnTag{
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"chutiTag"];
}
+ (void)removeChuTiBtnTag{
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic removeObjectForKey:@"chutiTag"];
    [SetUtil saveSet:dic];
}


//保存出题前的section
+ (void)saveChuTiSection:(NSString *)chutiInfo{
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:chutiInfo forKey:@"chutiSection"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getChutiSection{
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"chutiSection"];
}


+ (void)removeUserInfo {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic removeAllObjects];
    [SetUtil saveSet:dic];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"delegateGetUserId" object:nil];
}

+ (void)saveSessionId:(NSString *)sessionId {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:sessionId forKey:@"session_id"];
    [SetUtil saveSet:dic];
}

+ (NSString *)getSessionId {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"session_id"];
}

+ (BOOL)isUserLogined{
    if ([SetUtil getSessionId]) {
        return YES;
    }
    return NO;
}

//保存所在地区信息
+ (void)saveRegionId:(NSString *)regionId {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:regionId forKey:@"region_catalog_id"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getRegionId {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"region_catalog_id"];
}
//+ (NSString *)getRegionInfo {
//    NSDictionary *item1 = [SetUtil checkSet];
//    return [item1 objectForKey:@"region_catalog"];
//}
//+ (void)saveRegionInfo:(NSString *)regionInfo {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:regionInfo forKey:@"region_catalog"];
//    [SetUtil saveSet:dic];
//}

//保存出题范围信息
+ (void)saveChuTiInfo:(NSString *)chutiInfo {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:chutiInfo forKey:@"range"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getChutiInfo {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"range"];
}

//保存宠物id信息
+ (void)savePetId:(NSString *)petId {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:petId forKey:@"pet_id"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getPetId {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"pet_id"];
}

//保存宠物状态
+ (void)savePetStatus:(NSString *)pet_status {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:pet_status forKey:@"pet_status"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getPetStatus {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"pet_status"];
}


//保存邮箱信息
+ (void)saveEmailInfo:(NSString *)emailInfo {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:emailInfo forKey:@"email"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getEmailInfo {
    NSDictionary *item1 = [SetUtil checkSet];
    return [item1 objectForKey:@"email"];
}

#pragma mark - file path
+ (NSString *)setFilePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    return filePath;
}

+ (NSMutableDictionary *)checkSet {
    NSString *filepath = [SetUtil setFilePath];
    NSFileManager *fileManger = [NSFileManager defaultManager];
    if ( ![fileManger fileExistsAtPath:filepath] ) {
        NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:@"www.91waijiao.com",@"IP",nil];
        [dic writeToFile:filepath atomically:YES];
    }
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:filepath];
    return dictionary;
}


+ (void)saveSet:(NSDictionary *)dictionary {
    NSString *filepath = [SetUtil setFilePath];
    [dictionary writeToFile:filepath atomically:YES];
}


+ (NSString *)getUserId {
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[SetUtil setFilePath]];
    return [item1 objectForKey:@"user_id"];
}

+ (void)setUserName:(NSString *)userName {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:userName forKey:@"nick_name"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getUserName{
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[SetUtil setFilePath]];
    return [item1 objectForKey:@"nick_name"];
}



#pragma mark - 基本信息

+ (void)saveThirdUid:(NSString *)third_uid {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:third_uid forKey:@"third_uid"];
    [SetUtil saveSet:dic];
}

+ (NSString *)getThirdUid {
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[SetUtil setFilePath]];
    return [item1 objectForKey:@"third_uid"];
}
+ (void)saveToken:(NSString *)token {
    NSMutableDictionary *dic = [SetUtil checkSet];
    [dic setObject:token forKey:@"token"];
    [SetUtil saveSet:dic];
}
+ (NSString *)getToken {
    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[SetUtil setFilePath]];
    return [item1 objectForKey:@"token"];
}



//+ (void)setUserAccount:(NSString *)aAccount andUserPassword:(NSString *)aPassword {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    if(aAccount != nil)
//        [dic setObject:aAccount forKey:@"account"];
//    [dic setObject:aPassword forKey:@"password"];
//    [SetUtil saveSet:dic];
//}
//
//
//#pragma mark - 第三方账户
//+ (void)setXingxing:(NSNumber *)xingxing{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:xingxing forKey:@"xingxing"];
//    [SetUtil saveSet:dic];
//}
//
//+ (NSNumber *)getXingxing{
//    NSDictionary *item1 = [NSDictionary dictionaryWithContentsOfFile:[SetUtil setFilePath]];
//    return [item1 objectForKey:@"xingxing"];
//}
//
//+ (NSString *)getHeadImge {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    return [dic objectForKey:@"icon"];
//}
//
//+ (void)setHeadImge:(NSString *)headImage {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:headImage forKey:@"icon"];
//    [SetUtil saveSet:dic];
//}
//
//
//#pragma mark - token
//+ (void)saveAccessToken:(NSString *)accessToken{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    DLog(@"%@",dic);
//    [dic setObject:accessToken forKey:@"access_token"];
//    [SetUtil saveSet:dic];
//}
//
//+ (NSString *)getAccessToken{
//    NSDictionary *item1 = [SetUtil checkSet];
//    return [item1 objectForKey:@"access_token"];
//}
//
//+ (void)saveDeviceToken:(NSString *)deviceToken {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:deviceToken forKey:@"k_device_token"];
//    [SetUtil saveSet:dic];
//}
//
//+ (NSString *)getDeviceToken {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    return   [dic objectForKey:@"k_device_token"];
//}
//
//+ (BOOL)isRegDeviceToken {
//    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
//    if (![defauls stringForKey:@"is_reg_devicetoken"]){
//        return NO;
//    }
//    else {
//        return [defauls boolForKey:@"is_reg_devicetoken"];
//    }
//}
//
//+ (void)regedDeviceToken {
//    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
//    [defauls setBool:YES forKey:@"is_reg_devicetoken"];
//    [defauls synchronize];
//}
//
//+ (void)unregDeviceToken {
//    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
//    [defauls setBool:NO forKey:@"is_reg_devicetoken"];
//    [defauls synchronize];
//}
//
//
//#pragma mark - 绑定信息
//+ (void)bindedQQ:(NSString *)qqToken{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:qqToken forKey:@"bind_qq_token"];
//    [SetUtil saveSet:dic];
//}
//
//+ (void)bindedWeibo:(NSString *)weiboToken{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:weiboToken forKey:@"bind_weibo_token"];
//    [SetUtil saveSet:dic];
//}
//
//+ (BOOL)isBindedQQ{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    id value = [dic objectForKey:@"bind_qq_token"];
//    return value != nil;
//}
//+ (BOOL)isBindedWeibo{
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    id value = [dic objectForKey:@"bind_weibo_token"];
//    return value != nil;
//}
//
//
//#pragma mark - 缓存数据
//+ (void)setCacheData:(NSString *)cachedata {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:cachedata forKey:@"cachedata"];
//    [SetUtil saveSet:dic];
//}
//
//+ (NSString *)getCachedata {
//    NSDictionary *item1 = [SetUtil checkSet];
//    return [item1 objectForKey:@"cachedata"];
//}
//
//+ (void)setImgCacheData:(NSMutableArray *)imgArr {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic setObject:imgArr forKey:@"imgArr"];
//    [SetUtil saveSet:dic];
//}
//
//+ (NSMutableArray *)getImgCacheData {
//    NSDictionary *item1 = [SetUtil checkSet];
//    return [item1 objectForKey:@"imgArr"];
//}
//
//+ (void)removeCacheData {
//    NSMutableDictionary *dic = [SetUtil checkSet];
//    [dic removeObjectForKey:@"cachedata"];
//    [dic removeObjectForKey:@"imgArr"];
//    //    NSString *imageDocPath = [DOCUMENT_PATH stringByAppendingString:@"/ImageCacheFile"];
//    //    [[NSFileManager defaultManager] removeItemAtPath:imageDocPath error:nil];
//    [SetUtil saveSet:dic];
//}
//
//
//
//+ (NSString*)dateToStringWithDate:(NSDate *)date {
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    return [dateFormatter stringFromDate:date];
//}
//
//+ (NSDate *)stringToDateWithDateString:(NSString *)dateString {
//    NSDateFormatter *dateFormatter= [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
//    return [NSDate dateWithTimeInterval:28800 sinceDate:[dateFormatter dateFromString:dateString]];
//}

@end
