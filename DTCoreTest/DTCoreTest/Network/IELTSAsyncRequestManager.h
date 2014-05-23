//
//  IELTSAsyncRequestManager.h
//  IELTSAnswer
//
//  Created by 肖锦博 on 13-7-20.
//  Copyright (c) 2013年 肖锦博. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"
#import "API_URL.h"

@interface IELTSAsyncRequestManager : NSObject

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

+ (IELTSAsyncRequestManager *)shareManager;

- (void)cancelAllOperations;


#pragma mark - block 处理方式
//邮箱注册
- (void)registeredWithAccount:(NSString *)account andName:(NSString *)name andPassword:(NSString *)password completion:(void(^)(id objects, BOOL isSuccess))callback;
//登陆
- (void)loginUserWithAccount:(NSString *)account andPassword:(NSString *)password completion:(void(^)(id objects, BOOL isSuccess))callback;

//第三方账号登录
- (void)registerThirdAccountPlatform:(NSString *)platform completion:(void(^)(id objects, BOOL isSuccess))callback;
//提交邮箱信息
- (void)emailWithEmail:(NSString *)email andOauth:(NSString *)oauth_id completion:(void(^)(id objects, BOOL isSuccess))callback;

//获取个人信息
- (void)fetchUserInfoCompletion:(void(^)(id objects, BOOL isSuccess))callback;
//其他用户信息
- (void)fetchOtherUserInfoWithUserId:(NSString *)user_id completion:(void(^)(id objects, BOOL isSuccess))callback;


//添加战友
- (void)addComradeWithUserId:(NSString *)userId completion:(void(^)(id objects, BOOL isSuccess))callback;
//移除战友
- (void)deleteComradeWithUserId:(NSString *)userId completion:(void(^)(id objects, BOOL isSuccess))callback;

//更换宠物
- (void)changePetWithPetId:(NSString *)pet_id completion:(void(^)(id objects, BOOL isSuccess))callback;



//搜索战友
- (void)searchComradeWithQuery:(NSString *)query completion:(void(^)(id objects, BOOL isSuccess))callback;
//战友排行榜, Type:1表示周排行榜，2表示月排名
- (void)rankComradeWithType:(NSNumber *)type andRow:(NSNumber *)row andOffset:(NSNumber *)offset completion:(void(^)(id objects, BOOL isSuccess))callback;
//获取学霸推荐列表
- (void)getTopstudentListWithCompletion:(void(^)(id objects, BOOL isSuccess))callback;

//设置出题范围
- (void)settingQuestionRangeWithRange:(NSString *)range completion:(void(^)(id objects, BOOL isSuccess))callback;


//设置地区学科信息
- (void)settingSubjectWithRegionCatalogId:(NSString *)region_catalog_id completion:(void(^)(id objects, BOOL isSuccess))callback;


//提交练习
- (void)commitPracticeRightDetail:(NSString *)aRightDetail UserAnswer:(NSString *)aUserAnswer Collect:(NSString*)aCollect RightCount:(NSString *)aRightCount WrongCount:(NSString *)aWrongCount Experience:(NSString *)aExperience SubjectID:(NSString *)subjectID PracticeName:(NSString *)aPracticeName QuestionNum:(NSString *)aQuestionNum IsPass:(NSString *)aIsPass completion:(void(^)(id objects, BOOL isSuccess))callback;

//获取题目解析
-(void)checkAnalysisWithQuestion_ids:(NSString *)aQuestion_ids completion:(void(^)(id objects, BOOL isSuccess))callback;


//获取我的练习
- (void)getMyPracticeListWithSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;
//错题本和收藏夹
- (void)getBookListDatagetBookType:(NSString *)atype Offset:(NSNumber *)aOffset andNum:(NSNumber *)aNum SubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;
//历史练习
- (void)getHistoryListOffset:(NSNumber *)aOffset andNum:(NSNumber *)aNum SubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;

//答题卡列表
- (void)fetchQuestionHistoryWithSubjectId:(NSString *)subject_id andTime:(NSString *)time andType:(NSString *)type andPracticeId:(NSString *)practice_id completion:(void(^)(id objects, BOOL isSuccess))callback;
//获取历史试题(question_ids 题目Id组成的串,以","分割)
- (void)fetchQuestionHistoryWithQuestionIds:(NSString *)question_ids completion:(void(^)(id objects, BOOL isSuccess))callback;


//获取最新消息
- (void)fetchMessageListWithCompletion:(void(^)(id objects, BOOL isSuccess))callback;
//将消息置为被读状态
- (void)postMessageReadWithMessageID:(NSNumber *)messageID completion:(void(^)(id objects, BOOL isSuccess))callback;
//未读消息数
- (void)newMessageCountCompletion:(void(^)(id objects, BOOL isSuccess))callback;


//获取学科分类
- (void)getSubjectsWithSessionID:(NSString *)sessionID completion:(void(^)(id objects, BOOL isSuccess))callback;

//获取用户学科首页
- (void)getUserSubjectIndexWithSessionID:(NSString *)sessionID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;

//根据知识点出题
- (void)getQuestionListByKidWithSessionID:(NSString *)sessionID andKnowledgeID:(NSString *)knowledgeID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;

//根据学科出题
- (void)getQuestionListBysubjectIdWithSessionID:(NSString *)sessionID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback;

//举报
- (void)feedbackQuestionWithSubjectId:(NSString *)subject_id andQuestionId:(NSString *)question_id andArticleID:(NSNumber *)article_id andPhone:(NSString *)phone andContent:(NSString *)content completion:(void(^)(id objects, BOOL isSuccess))callback;

#pragma mark - 其他
//推荐
- (void)appTuijianCompletion:(void(^)(id objects, BOOL isSuccess))callback;

//错误信息反馈
- (void)showProgressHUDWith:(NSError *)error;

- (NSMutableString *)changeDictionaryToString:(NSDictionary *)parameter;//输出http请求地址用

@end
