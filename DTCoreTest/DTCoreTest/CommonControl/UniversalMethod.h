//
//  UniversalMethod.h
//  WordGuessingFrenzy
//
//  Created by kanon on 13-8-31.
//  Copyright (c) 2013年 kanon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataBaseManager.h"
//#import "MessageListItem.h"

@interface UniversalMethod : NSObject

+(void)showWaitingView;

+(void)hiddenWaitingView;


//每次进入时先从本地读取库读取，第一次进入时没有数据，走网络
+ (NSMutableArray *)subjectArrayFromLocalWithSubjectID:(NSString *)subject_id;



//网络获取数据后写入本地数据库并返回model的格式
+(NSMutableArray *)subjectArrayFromNetworkArray:(NSArray *)aArray andSubjectID:(NSString *)aSubjectID;

//搜索接口
+(NSMutableArray *)getSubjectWithName:(NSString *)aName andSubjectID:(NSString *)aSubjectID;


//搜索知识点name接口
+(NSString *)getKnowledgeWithKId:(NSInteger )aKId;


//搜索知识点的subjectID
+(NSString *)getsubjectIDWithkId:(NSInteger )aKId;

////获取所有消息中最大的时间id，即最新的数据
//+(NSInteger)userMaxTimeMessageIdWithUserId:(NSString *)aUser_Id;

//网络获取数据后写入本地数据库并返回model的格式
+(NSMutableArray *)MessageArrayFromNetworkArray:(NSArray *)aArray andUserId:(NSString *)aUser_id;

//从本地数据库读取以前的消息, 小于某个时间，以及个数
+(NSMutableArray *)MessageArrayFromLocalTime:(NSNumber *)aTime andCount:(NSInteger)aCount andUserId:(NSString *)aUser_id;

//将消息置为已读的，本地的
+(BOOL)MessageSetHadReadWithId:(NSNumber *)aMessageId andUserId:(NSString *)aUser_id;

////搜索接口
//+(NSMutableArray *)messageWithKey:(NSString *)aKey;





//+(void)HiddenTabBar;
//
//+(void)ShowTabBar;
//
////从服务器获取句子的数据后进行转换
//+(NSArray *)taskArrayWithArray:(NSArray *)aArray andLevel:(NSInteger)level;
////从本地获取offset和连胜successCount和total金币数
//+(NSDictionary *)offsetWithUserId:(NSString *)userId andLevel:(NSInteger)aLevel;
////只获取offset
//+(NSInteger)onlyOffsetWithUserId:(NSString *)userId andLevel:(NSInteger)aLevel;
////从本地获取句子
//+(NSArray *)taskArrayWithLevelFromLocal:(NSInteger)level andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount;
////每通过一关，写入到数据库
//+(BOOL)passTask:(NSNumber *)taskId andUserID:(NSString *)aUserID andLevel:(NSInteger)aLevel LevelOneMaxId:(NSNumber *)aLevelOneId andLevelTwoMaxId:(NSNumber *)aLevelTwoId andLevelThreeMaxId:(NSNumber *)aLevelThreeId andSuccessCount:(NSInteger)aCount andTotalGold:(NSInteger)aGold andHelpCount:(NSInteger)helpCount;
//
////从服务器获取通过不通过的句子进行转换
//+(NSArray *)myPassTastArray:(NSArray *)aArray andUserId:(NSString *)userId;
////从本地获取通过的句子
//+(NSArray *)myPassTastArrayFromLocalHadPass:(NSString *)userId andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount;
////从本地获取未通过的句子
//+(NSArray *)myPassTastArrayFromLocalNoPass:(NSString *)userId andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount;
//
////关卡导航的接口
//+(NSArray *)getTaskNavigationWithLevel:(NSNumber *)aLevel andUserId:(NSString *)userId andOffset:(NSInteger)aOffset andCount:(NSInteger)aCount;
//
//+(NSArray *)myLevelTastArray:(NSArray *)aArray andUserId:(NSString *)userId;
//
////+(BOOL)insertLevelUserId:(NSString *)userId andTaskId:(NSNumber *)taskId Level:(NSNumber *)aLevel andLevelId:(NSNumber *)level_id andHelpTime:(NSNumber *)help_time andOriginal_sentence:(NSString *)aOriginal_sentence andTranslate_sentence:(NSString *)aTranslate_sentence;
//
//+(BOOL)deleteTaskNavigationLevel:(NSNumber *)aLevel;
//
////获取所有单词
//+(NSArray *)getAllWordArrayWithTask:(TaskModel *)aTask;
//
////拆分填空单词
//+(NSArray *)getTastWordStatusWithTask:(TaskModel *)aTask;
//
////从服务器获取的所有的单词存储到数据库
//+(BOOL)wordArrayWithArray:(NSArray *)aArray;
////获取本地单词的个数
//+(NSInteger)wordCount;
////获取最后一个单词id
//+(NSString *)wordId;
////从数据库获取某个单词的意思
//+(NSString *)translateWithEnglishWord:(NSString *)word;
//
////将临时数据改成登陆用户的数据
//+(BOOL)changeUserId:(NSString *)userId;
//
//+(BOOL)deleteUserId:(NSString *)userId;
//
//+(BOOL)copyNavigationDataUserNotLogin;
//
////判断是否有临时数据需要上传
//+(BOOL)needUpdateTempData:(NSString *)userId;
//
///*
// *****
//    排行榜
// *****
// */
////连胜总榜-加入数据库
//+(BOOL)insertPassUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore;
////连胜总榜-查询数据库
//+(NSArray *)RankPassSQLArray;
////连胜总榜-删除数据库
//+(BOOL)deleteRankPassSQL;
//
//
////昨日连胜总榜-加入数据库
//+(BOOL)insertYesterdayUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore;
////昨日连胜总榜-查询数据库
//+(NSArray *)RankYesterdaySQLArray;
////昨日连胜总榜-删除数据库
//+(BOOL)deleteRankYesterdaySQL;
//
//
////昨日通关总榜-加入数据库
//+(BOOL)insertContinuousUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore;
////昨日通关总榜-查询数据库
//+(NSArray *)RankContinuousSQLArray;
////昨日通关总榜-删除数据库
//+(BOOL)deleteRankContinuousSQL;
//
@end
