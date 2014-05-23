////
////  DataBaseManager.h
////  FMDBTest2
////
////  Created by kanon on 13-8-6.
////  Copyright (c) 2013年 kanon. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//@interface DataBaseManager : NSObject
//
//+(DataBaseManager *)standardDataBaseManager;
//-(BOOL)initDatabase;
//-(BOOL)closeDatabase;
//////
////////-(BOOL)DBExist;
////////-(void)copyDBToDBPath;
////////-(BOOL)openDB; 
//////
//
//
//
////从Subject获取数据
//- (NSMutableArray *)getSubjectArrayWithSubjectId:(NSString *)subject_id;
//- (NSMutableArray *)getSubjectArrayWithSubjectId:(NSString *)subject_id andParentId:(NSInteger)parentId;
//
//
//
//#pragma mark- 当前项目
//
////写入subject到本地数据库
//-(BOOL)insertSubject:(NSString *)aSubjectID andkid:(NSInteger)akId andName:(NSString *)aName  andFinish_rate:(NSString *)afinish_rate andParentId:(NSInteger)aParentId andQuestionNums:(NSInteger)aQuestionNums ;
//
////搜索本地数据库知识点
//-(NSMutableArray *)getSubjectWithName:(NSString *)aName  andSubjectID:(NSString *)aSubjectID;
//
////搜索知识点name
//-(NSString *)getKnowledgeNameWithkId:(NSInteger )aKid;
//
////搜索知识点的subjectID
//-(NSString *)getsubjectIDWithkId:(NSInteger )aKid;
//
//////获取时间值最大的messageid
////-(NSInteger)getMessageIdMaxTimeWithUserId:(NSString *)aUser_Id;
//
////写入message本地数据库
//-(BOOL)insertMessage:(NSInteger)aMessageId andType:(NSString *)atype andMyUserId:(NSString *)aMyUse_id andUserId:(NSString *)aUse_id andUrl:(NSString *)aUrl andTitle:(NSString *)aTitle andContent:(NSString *)aContent andHadRead:(NSInteger)aHad_Read andTime:(long long int)aTime;
//
////从message数据库读取数据, 如果aTime是-1，则返回最新的数据
//-(NSMutableArray *)readMessageWithTime:(long long int)aTime andCount:(NSInteger)aCount andUserId:(NSString *)aUser_Id;
//
////将消息置为已读的
//-(BOOL)setMessageHadReadWithId:(NSInteger)aMessageId andUserId:(NSString *)aUser_Id;
//
//////搜索本地数据库
////-(NSMutableArray *)getMessageWithKey:(NSString *)aKey andBoolTime:(BOOL)aTime;
//
//
//#pragma mark-  ************************之前的***********************************************
///*
//-(BOOL)updateCatalogWith:(NSInteger)cid andTitle:(NSString *)title andImageUrl:(NSString *)imageUrl andRarUrl:(NSString *)rarUrl andUpdateTime:(long long int)aTime;
//-(NSArray *)getCatalogArray;
//
////-(NSInteger)needUpdate:(NSInteger)cid;
//-(BOOL)setUpdateNo:(NSInteger)cid;
//
//-(BOOL)updateTaskWith:(NSInteger)taskId andCid:(NSInteger)cid andType:(NSInteger)type andTitle:(NSString *)title andSubtitle:(NSString *)subtitle andAnswer:(NSString *)answer andOptions:(NSString *)options andImageUrl:(NSString *)imageUrl andVideoUrl:(NSString *)videoUrl andIsChecked:(BOOL)isChecked andUserName:(NSString *)userName anduserId:(NSInteger)userId andUserUrl:(NSString *)userUrl;
//
//-(BOOL)updateFriendTaskWith:(NSInteger)taskId andCid:(NSInteger)cid andType:(NSInteger)type andTitle:(NSString *)title andSubtitle:(NSString *)subtitle andAnswer:(NSString *)answer andOptions:(NSString *)options andImageUrl:(NSString *)imageUrl andVideoUrl:(NSString *)videoUrl andIsChecked:(BOOL)isChecked andUserName:(NSString *)userName anduserId:(NSInteger)userId andUserUrl:(NSString *)userUrl;
////判断 好友关卡 是否玩过
//-(BOOL)hasFriendPlayWithTaskId:(NSInteger)taskId;
////记录好友的关卡
//-(BOOL)recordFriendCacheWithTaskId:(NSInteger)taskId andToken:(NSString *)token andCid:(NSInteger)cid;
//
////判断该任务是否要更新
//-(NSInteger)needUpdate:(NSInteger)cid;
//
//
////二级列表页用到的获取所有题目，从分类搜索
//
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid;
//
////二级列表页用到的获取所有题目，从分类搜索, 并有offset和count
//
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid andOffset:(NSInteger)offset andCount:(NSInteger)count;
//
////二级列表页用到的获取所有题目，从人员搜索
//
//-(NSArray *)getTaskArrayWithUserId:(NSInteger)uid;
//
////检查是否通过
//-(NSInteger)isPassedWithTaskId:(NSInteger)taskId;
//
////批量请求某个分类下的所有题目
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid andTaskId:(NSInteger)taskId;
//
////批量请求某个往右下下的所有题目
//-(NSArray *)getTaskArrayWithUid:(NSInteger)uid andTaskId:(NSInteger)taskId;
//
//
////判断是否玩过
//-(BOOL)hasPlayWithTaskId:(NSInteger)taskId;
//
//-(BOOL)recordCacheWithTaskId:(NSInteger)taskId andToken:(NSString *)token andCid:(NSInteger)cid;
//
////返回用户已经通过的关数，每到50以上清零
//-(int)userCount:(NSString *)token;
//
////更新用户更新的关数, 是否清零
//-(BOOL)updateUserCount:(NSString *)token andBoolReset:(BOOL)aReset;
//
//
//-(NSArray *)getCacheArray;
//
////改变缓存用户玩的关卡的token值
//-(BOOL)changeCacheTaskToken:(NSString *)token;
//
//-(BOOL)removeCacheTask:(NSInteger)taskId;
//*/
//@end
