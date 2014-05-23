////
////  DataBaseManager.m
////  FMDBTest2
////
////  Created by kanon on 13-8-6.
////  Copyright (c) 2013年 kanon. All rights reserved.
////
//
//#import "DataBaseManager.h"
//#import "FMDatabase.h"
//
////#import "KnowledgeMode.h"
//
//
//#define TABLE_MYMESSAGE @"mySubject"   //我的知识点
//
//#define TABLE_MESSAGE @"myMessage"    //我的信息
//static DataBaseManager *defaultManager = nil;
//
//@interface DataBaseManager()
//
//@property(strong ,nonatomic)  FMDatabase *db;
//
//@end
//
//@implementation DataBaseManager
//@synthesize db;
//
//#pragma mark- 单例要处理的问题
//
//+(DataBaseManager *)standardDataBaseManager
//{
//    if(defaultManager == nil)
//    {
//        defaultManager = [[super allocWithZone:NULL] init];
//    }
//    return defaultManager;
//}
//
//+(id)allocWithZone:(NSZone *)zone
//{
//    return [DataBaseManager standardDataBaseManager];
//}
//
//-(id)init
//{
//    self = [super init];
//    if(self)
//    {}
//    return self;
//}
//
//-(void)dealloc
//{
//    [self.db close];
//    self.db = nil;
//}
//
//-(id)copyWithZone:(NSZone *)zone
//{
//    return self;
//}
//
//#pragma mark- 此类的初始化一些方法
//
//-(BOOL)initDatabase //刚进入程序时需要初始化数据库
//{
//    return [defaultManager DBInit];
//}
//
//-(BOOL)closeDatabase
//{
//   return [self.db close];
//}
//
//-(BOOL)DBInit
//{
//    NSString *dbPath = DATABASE_PATH;
//    
//    self.db = [FMDatabase databaseWithPath:dbPath];
//    if(![self.db open])
//    {
//        DLog(@"could not open database");
//        return 0;
//    }
//    BOOL createTable = NO;
//    
//    createTable = [self createTable:TABLE_MYMESSAGE];
//    DLog(@"%@ = %d", TABLE_MYMESSAGE, createTable);
//    
//    createTable = [self createTable:TABLE_MESSAGE];
//    DLog(@"%@ = %d", TABLE_MYMESSAGE, createTable);
//    
//    return createTable;
//}
//
//
//-(BOOL)createTable:(NSString *)tableName
//{
//    FMResultSet *rs = [self.db executeQuery:@"select count(*) as 'count' from sqlite_master where type ='table' and name = ?", tableName];
//    BOOL existTable = NO;
//    while ([rs next])
//    {
//        NSInteger count = [rs intForColumn:@"count"];
//        if(0 == count)
//        {
//            
//            existTable = NO;
//            break;
//        }
//        else
//        {
//            
//            existTable = YES;
//            break;
//        }
//    }
//    BOOL success = NO;
//    if(existTable == NO)
//    {
//        NSString *sql = nil;
//        if([tableName isEqualToString:TABLE_MYMESSAGE])
//        {
//            sql = [NSString stringWithFormat:@"CREATE TABLE %@ (subjectID text NOT NULL, kId integer NOT NULL, name text NOT NULL,  parentId integer NOT NULL, questionNums integer NOT NULL, finish_rate text NOT NULL, PRIMARY KEY(kId,subjectID))", tableName];
//            success = [self.db executeUpdate:sql];
//        }
//        
//        
//        if([tableName isEqualToString:TABLE_MESSAGE])
//        {
//            sql = [NSString stringWithFormat:@"CREATE TABLE %@ (message_id integer NOT NULL,myuser_id text NOT NULL, user_id text NOT NULL, type text NOT NULL, title text NOT NULL, content text NOT NULL, had_read integer NOT NULL, time integer NOT NULL, url text NOT NULL, PRIMARY KEY(message_id, myuser_id))", tableName];
//            success = [self.db executeUpdate:sql];
//        }
//
//        
//    }
//    return success;
//}
//
//
//
//#pragma mark - Subject 学科
////从Subject获取数据
//- (NSMutableArray *)getSubjectArrayWithSubjectId:(NSString *)subject_id {
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where subjectID = %@", TABLE_MYMESSAGE, subject_id];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next]) {
//        NSString *finish_rate   = [rs stringForColumn:@"finish_rate"];
//        NSNumber *kId           = @([rs intForColumn:@"kId"]);
//        NSString *name          = [rs stringForColumn:@"name"];
//        NSNumber *parentId      = @([rs intForColumn:@"parentId"]);
//        NSNumber *questionNums  = @([rs intForColumn:@"questionNums"]);
//        NSDictionary *dict = @{@"finish_rate": finish_rate, @"kId": kId, @"name": name, @"parentId": parentId, @"questionNums": questionNums};
//        [array addObject:dict];
//    }
//    return array;
//}
//
//- (NSMutableArray *)getSubjectArrayWithSubjectId:(NSString *)subject_id andParentId:(NSInteger)parentId {
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where subjectID = %@ and parentId = %d", TABLE_MYMESSAGE, subject_id, parentId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next]) {
//        NSString *finish_rate   = [rs stringForColumn:@"finish_rate"];
//        NSNumber *kId           = @([rs intForColumn:@"kId"]);
//        NSString *name          = [rs stringForColumn:@"name"];
//        NSNumber *parentId      = @([rs intForColumn:@"parentId"]);
//        NSNumber *questionNums  = @([rs intForColumn:@"questionNums"]);
//        NSDictionary *dict = @{@"finish_rate": finish_rate, @"kId": kId, @"name": name, @"parentId": parentId, @"questionNums": questionNums};
//        [array addObject:dict];
//    }
//    return array;
//}
//
//
//
////判断subject是否存在
//-(BOOL)existSubjectWithKId:(NSInteger)aKId andSubjectID:(NSString *)aSubjectID
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where kId = %d and subjectID = '%@' ",  TABLE_MYMESSAGE, aKId,aSubjectID];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0?NO:YES);
//}
//
//
////写入subject到本地数据库
//-(BOOL)insertSubject:(NSString *)aSubjectID andkid:(NSInteger)akId andName:(NSString *)aName  andFinish_rate:(NSString *)afinish_rate andParentId:(NSInteger)aParentId andQuestionNums:(NSInteger)aQuestionNums {
//    
//    BOOL exist = [self existSubjectWithKId:akId andSubjectID:aSubjectID];
//    
//    if(exist)
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set name = '%@', finish_rate = '%@', parentId = %d,questionNums = %d where kId = %d and subjectID = '%@' ", TABLE_MYMESSAGE, aName, afinish_rate, aParentId, aQuestionNums,akId,aSubjectID];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values('%@', %d, '%@', '%@', %d, %d)", TABLE_MYMESSAGE, aSubjectID,akId, aName, afinish_rate, aParentId, aQuestionNums];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//}
//
//
////搜索本地数据库知识点
//-(NSMutableArray *)getSubjectWithName:(NSString *)aName  andSubjectID:(NSString *)aSubjectID{
//    NSMutableArray *array = [NSMutableArray array];
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where name like '%%%@%%' and subjectID = '%@' order by kId desc",  TABLE_MYMESSAGE, aName,aSubjectID];
//
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    while ([rs next])
//    {
//        NSString *finish_rate = [rs stringForColumn:@"finish_rate"];
//        NSNumber *kId = [NSNumber numberWithInteger:[rs intForColumn:@"kId"] ];
//        NSString *name = [rs stringForColumn:@"name"];
//        NSNumber *parentId = [NSNumber numberWithInteger:[rs intForColumn:@"parentId"]];
//        NSNumber *questionNums = [NSNumber numberWithLongLong:[rs intForColumn:@"questionNums"]];
//        
//        NSDictionary *dict = @{@"finish_rate":finish_rate, @"kId":kId, @"name":name, @"parentId":parentId, @"questionNums":questionNums};
//        [array addObject:dict];
//    }
//    return array;
//}
//
//
////搜索知识点name
//-(NSString *)getKnowledgeNameWithkId:(NSInteger )aKid{
//    NSString *name = [NSString string];
//
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where kId = %d ",  TABLE_MYMESSAGE, aKid];
//    
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    while ([rs next])
//    {
//        NSString *aname = [rs stringForColumn:@"name"];
//        
//        name = aname;
//    }
//    return name;
//}
////搜索知识点的subjectID
//-(NSString *)getsubjectIDWithkId:(NSInteger )aKid{
//    NSString *subject = [NSString string];
//    
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where kId = %d ",  TABLE_MYMESSAGE, aKid];
//    
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    while ([rs next])
//    {
//        NSString *subjectID = [rs stringForColumn:@"subjectID"];
//        
//        subject = subjectID;
//    }
//    return subject;
//}
////#pragma mark- 若复制DB
////-(BOOL)DBExist
////{
////    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
////    NSString *documentDirectory = [paths objectAtIndex:0];
////    
////    NSString *voicePath = [documentDirectory stringByAppendingPathComponent:@"Voice"];
////    BOOL isDirectory = YES;
////    if(![[NSFileManager defaultManager] fileExistsAtPath:voicePath isDirectory:&isDirectory])
////    {
////        [[NSFileManager defaultManager] createDirectoryAtPath:voicePath withIntermediateDirectories:NO attributes:nil error:nil];
////    }
////    NSString *dbPath = [voicePath stringByAppendingPathComponent:@"userLesson.sqlite"];
////    if([[NSFileManager defaultManager] fileExistsAtPath:dbPath])
////    {
////        return YES;
////    }
////    else
////    {
////        return NO;
////    }
////}
////
////-(void)copyDBToDBPath
////{
////    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"userLesson" ofType:@"sqlite"];
////    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
////    NSString *documentDirectory = [paths objectAtIndex:0];
////    NSString *voicePath = [documentDirectory stringByAppendingPathComponent:@"Voice"];
////    NSString *dbPath = [voicePath stringByAppendingPathComponent:@"userLesson.sqlite"];
////    [[NSFileManager defaultManager] copyItemAtPath:path1 toPath:dbPath error:nil];
////}
////
////-(BOOL)openDB
////{
////    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
////    NSString *documentDirectory = [paths objectAtIndex:0];
////    NSString *voicePath = [documentDirectory stringByAppendingPathComponent:@"Voice"];
////    NSString *dbPath = [voicePath stringByAppendingPathComponent:@"userLesson.sqlite"];
////    self.db = [FMDatabase databaseWithPath:dbPath];
////    if(![self.db open])
////    {
////        DLog(@"could not open database");
////        return NO;
////    }
////    else
////        return YES;
////}
//
//
//#pragma mark- 现在的项目，表_myMessage
//
////-(NSInteger)getMessageIdMaxTimeWithUserId:(NSString *)aUser_Id
////{
////    NSString *sqlString = [NSString stringWithFormat:@"select message_id from %@ where user_id = '%@' order by time desc",  TABLE_MYMESSAGE, aUser_Id];
////    FMResultSet *rs = [self.db executeQuery:sqlString];
////    NSInteger messageId = -1;
////    while ([rs next])
////    {
////        messageId = [rs intForColumn:@"message_id"];
////        break;
////    }
////    return messageId;
////}
//
//-(BOOL)existMessageWithMessageId:(NSInteger)aMessage_Id andUserId:(NSString *)aUser_Id
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where message_id = %d and myuser_id = '%@'",  TABLE_MESSAGE, aMessage_Id, aUser_Id];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0?NO:YES);
//}
//
//-(BOOL)insertMessage:(NSInteger)aMessageId andType:(NSString *)atype andMyUserId:(NSString *)aMyUse_id andUserId:(NSString *)aUse_id andUrl:(NSString *)aUrl andTitle:(NSString *)aTitle andContent:(NSString *)aContent andHadRead:(NSInteger)aHad_Read andTime:(long long int)aTime
//{
//    BOOL exist = [self existMessageWithMessageId:aMessageId andUserId:aUse_id];
//    
////    NSDate *date = [NSDate dateWithTimeIntervalSince1970:aTime];
////    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
////    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
////    NSString *currentDateStr = [dateFormatter stringFromDate:date];
//    
//    if(exist)
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set type = '%@',title = '%@', url = '%@', content = '%@', had_read = %d,user_id = '%@', time = %lld where message_id = %d and myuser_id = '%@'", TABLE_MESSAGE, atype,aTitle, aUrl, aContent, aHad_Read,aUse_id,aTime, aMessageId, aMyUse_id];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values(%d, '%@','%@', '%@', '%@', '%@', %d, %lld, '%@')", TABLE_MESSAGE, aMessageId, aMyUse_id,aUse_id, atype, aTitle, aContent, aHad_Read,aTime, aUrl];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//}
//
////从message数据库读取数据
//-(NSMutableArray *)readMessageWithTime:(long long int)aTime andCount:(NSInteger)aCount andUserId:(NSString *)aUser_Id
//{
//    NSMutableArray *array = [NSMutableArray array];
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where myuser_id = '%@' order by time desc",  TABLE_MESSAGE, aUser_Id];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger localCount = 0;
//    while ([rs next])
//    {
//        long long int time = [rs longLongIntForColumn:@"time"];
//        if(aTime == -1 || time < aTime)
//        {
//            NSNumber *messageId = [NSNumber numberWithInteger:[rs intForColumn:@"message_id"] ];
//            NSString *type = [rs stringForColumn:@"type"];
//            NSString *title = [rs stringForColumn:@"title"];
//            NSString *user_id = [rs stringForColumn:@"user_id"];
//            NSString *content = [rs stringForColumn:@"content"];
//            NSString *url = [rs stringForColumn:@"url"];
//            NSNumber *had_read = [NSNumber numberWithInteger:[rs intForColumn:@"had_read"]];
//            NSNumber *time = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"time"]];
//            
//            NSDictionary *dict = @{@"message_id":messageId, @"type":type, @"title":title, @"content":content,@"url":url, @"had_read":had_read, @"time":time,@"user_id":user_id};
//            [array addObject:dict];
//            localCount++;
//            if(localCount >= aCount)
//                break;
//        }
//    }
//    return array;
//}
//
////将消息置为已读的
//-(BOOL)setMessageHadReadWithId:(NSInteger)aMessageId andUserId:(NSString *)aUser_Id
//{
//    if([self existMessageWithMessageId:aMessageId andUserId:(NSString *)aUser_Id])
//    {
//        NSString *sql = [NSString stringWithFormat:@"update %@ set had_read = 1 where message_id = %d and myuser_id = '%@'", TABLE_MESSAGE, aMessageId, aUser_Id];
//        BOOL success = [self.db executeUpdate:sql];
//        return success;
//    }
//    else
//        return NO;
//}
//
//////搜索本地数据库
////-(NSMutableArray *)getMessageWithKey:(NSString *)aKey andBoolTime:(BOOL)aTime
////{
////    NSMutableArray *array = [NSMutableArray array];
////    NSString *sqlString = nil;
////    if(aTime)
////    {
////        sqlString = [NSString stringWithFormat:@"select * from %@ where date like '%%%@%%' order by time desc", TABLE_MESSAGE, aKey];
////    }
////    else
////    {
////        sqlString = [NSString stringWithFormat:@"select * from %@ where sendee like '%%%@%%' or sender like '%%%@%%' or content like '%%%@%%' order by time desc", TABLE_MYMESSAGE, aKey, aKey, aKey];
////    }
////    FMResultSet *rs = [self.db executeQuery:sqlString];
////    while ([rs next])
////    {
////        NSNumber *messageId = [NSNumber numberWithInteger:[rs intForColumn:@"message_id"] ];
////        NSString *sender = [rs stringForColumn:@"sender"];
////        NSString *sendee = [rs stringForColumn:@"sendee"];
////        NSString *content = [rs stringForColumn:@"content"];
////        NSNumber *had_read = [NSNumber numberWithInteger:[rs intForColumn:@"had_read"]];
////        NSNumber *time = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"time"]];
////        
////        NSDictionary *dict = @{@"message_id":messageId, @"sender":sender, @"sendee":sendee, @"content":content, @"had_read":had_read, @"time":time};
////        [array addObject:dict];
////    }
////    return array;
////}
//
//#pragma mark-  ************************之前的***********************************************
//
//
///*
//
//-(BOOL)existCatalogWith:(NSInteger)cid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where cid = %d", TABLE_CATALOG, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0? NO:YES);
//}
//
//-(long long int)updateTime:(NSInteger)cid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select update_time from %@ where cid = %d", TABLE_CATALOG, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    long long int update_time = 0;
//    while ([rs next])
//    {
//        update_time = [rs longLongIntForColumn:@"update_time"];
//    }
//    return update_time;
//}
//
//-(NSInteger)needUpdate:(NSInteger)cid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select need_update from %@ where cid = %d", TABLE_CATALOG, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger needUpdate = 0;
//    while ([rs next])
//    {
//        needUpdate = [rs intForColumn:@"need_update"];
//    }
//    return needUpdate;
//}
//
//-(BOOL)setUpdateNo:(NSInteger)cid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"update %@ set need_update = 0 where cid = %d", TABLE_CATALOG, cid];
//    BOOL success = [self.db executeUpdate:sqlString];
//    return success;
//}
//
//
//
//#pragma mark-  任务表
//
//-(BOOL)updateCatalogWith:(NSInteger)cid andTitle:(NSString *)title andImageUrl:(NSString *)imageUrl andRarUrl:(NSString *)rarUrl andUpdateTime:(long long int)aTime
//{
//    if([self existCatalogWith:cid])
//    {
//        NSInteger update = 0;
//        if(aTime > [self updateTime:cid])
//            update = 1;
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set title = '%@', image_url = '%@', rar_url = '%@', update_time = %lld, need_update = %d where cid = %d", TABLE_CATALOG, title, imageUrl, rarUrl, aTime, update, cid];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values(%d, '%@', '%@', '%@', %lld, 0)", TABLE_CATALOG, cid, title, imageUrl, rarUrl, aTime];
//        BOOL success = [self.db executeUpdate:sqlString];
//      return success;
//    }
//
//}
//
//-(NSArray *)getCatalogArray
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@", TABLE_CATALOG];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next])
//    {
//        NSNumber *cid = [NSNumber numberWithInt:[rs intForColumn:@"cid"]];
//        NSString *title = [rs stringForColumn:@"title"];
//        NSString *image_url = [rs stringForColumn:@"image_url"];
//        NSString *rar_url = [rs stringForColumn:@"image_url"];
//        NSNumber *update_time = [NSNumber numberWithLongLong:[rs longLongIntForColumn:@"update_time"]];
//        NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"need_update"]];
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:cid, @"cid", title, @"title", image_url, @"image_url", rar_url, @"rar_url", update_time, @"update_time", need_update, @"need_update", nil];
//        [array addObject:dict];
//    }
//    return array;
//}
//
//#pragma mark- friend task 表
//-(BOOL)updateFriendCatalogWith:(NSInteger)cid andTitle:(NSString *)title andImageUrl:(NSString *)imageUrl andRarUrl:(NSString *)rarUrl andUpdateTime:(long long int)aTime
//{
//    if([self existCatalogWith:cid])
//    {
//        NSInteger update = 0;
//        if(aTime > [self updateTime:cid])
//            update = 1;
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set title = '%@', image_url = '%@', rar_url = '%@', update_time = %lld, need_update = %d where cid = %d", TABLE_CATALOG, title, imageUrl, rarUrl, aTime, update, cid];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//    
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values(%d, '%@', '%@', '%@', %lld, 0)", TABLE_CATALOG, cid, title, imageUrl, rarUrl, aTime];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//
//}
//
//#pragma mark-  好友任务表
//
//-(BOOL)existFriendTaskWith:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where id = %d", TABLE_MYFRIENDTASK, taskId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0? NO:YES);
//}
//
//-(BOOL)updateFriendTaskWith:(NSInteger)taskId andCid:(NSInteger)cid andType:(NSInteger)type andTitle:(NSString *)title andSubtitle:(NSString *)subtitle andAnswer:(NSString *)answer andOptions:(NSString *)options andImageUrl:(NSString *)imageUrl andVideoUrl:(NSString *)videoUrl andIsChecked:(BOOL)isChecked andUserName:(NSString *)userName anduserId:(NSInteger)userId andUserUrl:(NSString *)userUrl
//{
//    if(subtitle == nil)
//        subtitle = @"";
//    if(options == nil)
//        options = @"";
//    if(videoUrl == nil)
//        videoUrl = @"";
//    if(imageUrl == nil)
//        imageUrl = @"";
//    if([self existFriendTaskWith:taskId])
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set cid = %d, type = %d, title = '%@', subtitle = '%@', answer = '%@', options = '%@', image_url = '%@', video_url = '%@', is_checked = %d, task_owner_avatar = '%@',task_owner_nick_name = '%@', task_owner_uid = %d where id = %d", TABLE_MYFRIENDTASK, cid, type, title, subtitle, answer, options, imageUrl, videoUrl, isChecked, userUrl, userName, userId,taskId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//    
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values(%d, %d, %d, '%@', '%@', '%@', '%@', '%@', '%@', %d, 0, '%@', '%@', %d)", TABLE_MYFRIENDTASK, taskId, cid, type, title, subtitle, answer, options, imageUrl, videoUrl, isChecked, userUrl, userName, userId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//}
//
////判断 好友关卡 是否玩过
//-(BOOL)hasFriendPlayWithTaskId:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select is_passed from %@ where id = %d", TABLE_MYFRIENDTASK, taskId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    int n = 0;
//    while ([rs next])
//    {
//        n = [rs intForColumn:@"is_passed"];
//    }
//    return (n == 0?NO:YES);
//}
//
////记录好友的关卡
//-(BOOL)recordFriendCacheWithTaskId:(NSInteger)taskId andToken:(NSString *)token andCid:(NSInteger)cid
//{
//    if([self hasFriendPlayWithTaskId:taskId])
//        return YES;
//    
//    NSString *sql = [NSString stringWithFormat:@"update %@ set is_passed = 1 where id = %d and cid = %d", TABLE_MYFRIENDTASK, taskId, cid];
//    BOOL suc = [self.db executeUpdate:sql];
//    DLog(@"%d", suc);
//    
//    if([self existCacheWith:taskId andToken:token])
//    {
//        return YES;
//    }
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values('%@', %d)", TABLE_CACHE, token, taskId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        
//        success = [self updateUserCount:token andBoolReset:NO];
//        return success;
//    }
//}
//
//#pragma mark task表的操作
//
//-(BOOL)existTaskWith:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where id = %d", TABLE_TASK, taskId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0? NO:YES);
//}
//
//-(BOOL)updateTaskWith:(NSInteger)taskId andCid:(NSInteger)cid andType:(NSInteger)type andTitle:(NSString *)title andSubtitle:(NSString *)subtitle andAnswer:(NSString *)answer andOptions:(NSString *)options andImageUrl:(NSString *)imageUrl andVideoUrl:(NSString *)videoUrl andIsChecked:(BOOL)isChecked andUserName:(NSString *)userName anduserId:(NSInteger)userId andUserUrl:(NSString *)userUrl
//{
//    if(subtitle == nil)
//        subtitle = @"";
//    if(options == nil)
//        options = @"";
//    if(videoUrl == nil)
//        videoUrl = @"";
//    if(imageUrl == nil)
//        imageUrl = @"";
//    if([self existTaskWith:taskId])
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"update %@ set cid = %d, type = %d, title = '%@', subtitle = '%@', answer = '%@', options = '%@', image_url = '%@', video_url = '%@', is_checked = %d, task_owner_avatar = '%@',task_owner_nick_name = '%@', task_owner_uid = %d where id = %d", TABLE_TASK, cid, type, title, subtitle, answer, options, imageUrl, videoUrl, isChecked, userUrl, userName, userId,taskId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//    
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values(%d, %d, %d, '%@', '%@', '%@', '%@', '%@', '%@', %d, 0, '%@', '%@', %d)", TABLE_TASK, taskId, cid, type, title, subtitle, answer, options, imageUrl, videoUrl, isChecked, userUrl, userName, userId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        return success;
//    }
//}
//
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where cid = %d order by id", TABLE_TASK, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next])
//    {
//        NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//        NSNumber *pcid = [NSNumber numberWithInteger:[rs intForColumn:@"cid"]];
//        NSNumber *type = [NSNumber numberWithInt:[rs intForColumn:@"type"]];
//        NSString *title = [rs stringForColumn:@"title"];
//        NSString *subtitle = [rs stringForColumn:@"subtitle"];
//        if(subtitle == nil)
//            subtitle = @"";
//        NSString *answer = [rs stringForColumn:@"answer"];
//        NSString *option = [rs stringForColumn:@"options"];
//        if(option == nil)
//            option = @"";
//        NSString *image_url = [rs stringForColumn:@"image_url"];
//        if(image_url == nil)
//            image_url = @"";
//        NSString *video_url = [rs stringForColumn:@"video_url"];
//        if(video_url == nil)
//            video_url = @"";
//        NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"is_checked"]];
//        
//        NSNumber *is_passed = [NSNumber numberWithInt:[rs intForColumn:@"is_passed" ]];
//        
////        task_owner_avatar varchar(512), task_owner_nick_name varchar(512), task_owner_uid integer
//        NSString *task_owner_avatar = [rs stringForColumn:@"task_owner_avatar"];
//        
//        if(task_owner_avatar == nil)
//            task_owner_avatar = @"";
//        
//        NSString *task_owner_nick_name = [rs stringForColumn:@"task_owner_nick_name"];
//        
//        if(task_owner_nick_name == nil)
//            task_owner_nick_name = @"";
//        
//        NSNumber *task_owner_uid = [NSNumber numberWithInt:[rs intForColumn:@"task_owner_uid"]];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", pcid, @"cid", type, @"type", title, @"title", subtitle, @"subtitle", answer, @"answer", option, @"option", image_url, @"image_url", video_url, @"video_url", need_update, @"need_update", is_passed, @"is_passed", task_owner_avatar, @"task_owner_avatar", task_owner_nick_name, @"task_owner_nick_name", task_owner_uid, @"task_owner_uid", nil];
//        [array addObject:dict];
//    }
//    return array;
//}
//
////二级列表页用到的获取所有题目，从分类搜索, 并有offset和count
//
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid andOffset:(NSInteger)offset andCount:(NSInteger)count
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where cid = %d order by id", TABLE_TASK, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    int n = 0;
//    int myCount = 0;
//    while ([rs next])
//    {
//        n++;
//        if(n <= offset)
//            continue;
//        NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//        NSNumber *pcid = [NSNumber numberWithInteger:[rs intForColumn:@"cid"]];
//        NSNumber *type = [NSNumber numberWithInt:[rs intForColumn:@"type"]];
//        NSString *title = [rs stringForColumn:@"title"];
//        NSString *subtitle = [rs stringForColumn:@"subtitle"];
//        if(subtitle == nil)
//            subtitle = @"";
//        NSString *answer = [rs stringForColumn:@"answer"];
//        NSString *option = [rs stringForColumn:@"options"];
//        if(option == nil)
//            option = @"";
//        NSString *image_url = [rs stringForColumn:@"image_url"];
//        if(image_url == nil)
//            image_url = @"";
//        NSString *video_url = [rs stringForColumn:@"video_url"];
//        if(video_url == nil)
//            video_url = @"";
//        NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"is_checked"]];
//        
//        NSNumber *is_passed = [NSNumber numberWithInt:[rs intForColumn:@"is_passed" ]];
//        
//        //        task_owner_avatar varchar(512), task_owner_nick_name varchar(512), task_owner_uid integer
//        NSString *task_owner_avatar = [rs stringForColumn:@"task_owner_avatar"];
//        
//        if(task_owner_avatar == nil)
//            task_owner_avatar = @"";
//        
//        NSString *task_owner_nick_name = [rs stringForColumn:@"task_owner_nick_name"];
//        
//        if(task_owner_nick_name == nil)
//            task_owner_nick_name = @"";
//        
//        NSNumber *task_owner_uid = [NSNumber numberWithInt:[rs intForColumn:@"task_owner_uid"]];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", pcid, @"cid", type, @"type", title, @"title", subtitle, @"subtitle", answer, @"answer", option, @"option", image_url, @"image_url", video_url, @"video_url", need_update, @"need_update", is_passed, @"is_passed", task_owner_avatar, @"task_owner_avatar", task_owner_nick_name, @"task_owner_nick_name", task_owner_uid, @"task_owner_uid", nil];
//        [array addObject:dict];
//        myCount++;
//        if(myCount >= count)
//            break;
//    }
//    return array;
//}
//
////二级列表页用到的获取所有题目，从人员搜索
//
//-(NSArray *)getTaskArrayWithUserId:(NSInteger)uid
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where task_owner_uid = %d order by id", TABLE_MYFRIENDTASK, uid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next])
//    {
//        NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//        NSNumber *pcid = [NSNumber numberWithInteger:[rs intForColumn:@"cid"]];
//        NSNumber *type = [NSNumber numberWithInt:[rs intForColumn:@"type"]];
//        NSString *title = [rs stringForColumn:@"title"];
//        NSString *subtitle = [rs stringForColumn:@"subtitle"];
//        if(subtitle == nil)
//            subtitle = @"";
//        NSString *answer = [rs stringForColumn:@"answer"];
//        NSString *option = [rs stringForColumn:@"options"];
//        if(option == nil)
//            option = @"";
//        NSString *image_url = [rs stringForColumn:@"image_url"];
//        if(image_url == nil)
//            image_url = @"";
//        NSString *video_url = [rs stringForColumn:@"video_url"];
//        if(video_url == nil)
//            video_url = @"";
//        NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"is_checked"]];
//        
//        NSNumber *is_passed = [NSNumber numberWithInt:[rs intForColumn:@"is_passed" ]];
//        
//        NSString *task_owner_avatar = [rs stringForColumn:@"task_owner_avatar"];
//        
//        if(task_owner_avatar == nil)
//            task_owner_avatar = @"";
//        
//        NSString *task_owner_nick_name = [rs stringForColumn:@"task_owner_nick_name"];
//        
//        if(task_owner_nick_name == nil)
//            task_owner_nick_name = @"";
//        
//        NSNumber *task_owner_uid = [NSNumber numberWithInt:[rs intForColumn:@"task_owner_uid"]];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", pcid, @"cid", type, @"type", title, @"title", subtitle, @"subtitle", answer, @"answer", option, @"option", image_url, @"image_url", video_url, @"video_url", need_update, @"need_update", is_passed, @"is_passed", task_owner_avatar, @"task_owner_avatar", task_owner_nick_name, @"task_owner_nick_name", task_owner_uid, @"task_owner_uid", nil];
//        [array addObject:dict];
//    }
//    return array;
//}
//
////检查是否通过
//-(NSInteger)isPassedWithTaskId:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select is_passed from %@ where id = %d", TABLE_TASK, taskId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger is_passed = 0;
//    while ([rs next])
//    {
//        is_passed = [rs intForColumn:@"is_passed"];
//    }
//    return is_passed;
//}
//
//-(NSArray *)getTaskArrayWithCid:(NSInteger)cid andTaskId:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where cid = %d order by id asc", TABLE_TASK, cid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        NSInteger tid = [rs intForColumn:@"id"];
//        if(tid > taskId)
//        {
//            NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//            NSNumber *pcid = [NSNumber numberWithInteger:[rs intForColumn:@"cid"]];
//            NSNumber *type = [NSNumber numberWithInt:[rs intForColumn:@"type"]];
//            NSString *title = [rs stringForColumn:@"title"];
//            NSString *subtitle = [rs stringForColumn:@"subtitle"];
//            if(subtitle == nil)
//                subtitle = @"";
//            NSString *answer = [rs stringForColumn:@"answer"];
//            NSString *option = [rs stringForColumn:@"options"];
//            if(option == nil)
//                option = @"";
//            NSString *image_url = [rs stringForColumn:@"image_url"];
//            if(image_url == nil)
//                image_url = @"";
//            NSString *video_url = [rs stringForColumn:@"video_url"];
//            if(video_url == nil)
//                video_url = @"";
//            NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"is_checked"]];
//            
//            NSNumber *is_passed = [NSNumber numberWithInt:[rs intForColumn:@"is_passed" ]];
//
//            
//            NSString *task_owner_avatar = [rs stringForColumn:@"task_owner_avatar"];
//            
//            if(task_owner_avatar == nil)
//                task_owner_avatar = @"";
//            
//            NSString *task_owner_nick_name = [rs stringForColumn:@"task_owner_nick_name"];
//            
//            if(task_owner_nick_name == nil)
//                task_owner_nick_name = @"";
//            
//            NSNumber *task_owner_uid = [NSNumber numberWithInt:[rs intForColumn:@"task_owner_uid"]];
//            
//            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", pcid, @"cid", type, @"type", title, @"title", subtitle, @"subtitle", answer, @"answer", option, @"option", image_url, @"image_url", video_url, @"video_url", need_update, @"need_update", is_passed, @"is_passed", task_owner_avatar, @"task_owner_avatar", task_owner_nick_name, @"task_owner_nick_name", task_owner_uid, @"task_owner_uid", nil];
//            [array addObject:dict];
//            count++;
//            if(count == 50)
//                break;
//        }
//    }
//    return array;
//
//}
//
////批量请求某个网友下下的所有题目
//-(NSArray *)getTaskArrayWithUid:(NSInteger)uid andTaskId:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@ where task_owner_uid = %d order by id asc", TABLE_MYFRIENDTASK, uid];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        NSInteger tid = [rs intForColumn:@"id"];
//        if(tid > taskId)
//        {
//            NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//            NSNumber *pcid = [NSNumber numberWithInteger:[rs intForColumn:@"cid"]];
//            NSNumber *type = [NSNumber numberWithInt:[rs intForColumn:@"type"]];
//            NSString *title = [rs stringForColumn:@"title"];
//            NSString *subtitle = [rs stringForColumn:@"subtitle"];
//            if(subtitle == nil)
//                subtitle = @"";
//            NSString *answer = [rs stringForColumn:@"answer"];
//            NSString *option = [rs stringForColumn:@"options"];
//            if(option == nil)
//                option = @"";
//            NSString *image_url = [rs stringForColumn:@"image_url"];
//            if(image_url == nil)
//                image_url = @"";
//            NSString *video_url = [rs stringForColumn:@"video_url"];
//            if(video_url == nil)
//                video_url = @"";
//            NSNumber *need_update = [NSNumber numberWithInt:[rs intForColumn:@"is_checked"]];
//            
//            NSNumber *is_passed = [NSNumber numberWithInt:[rs intForColumn:@"is_passed" ]];
//            
//            
//            NSString *task_owner_avatar = [rs stringForColumn:@"task_owner_avatar"];
//            
//            if(task_owner_avatar == nil)
//                task_owner_avatar = @"";
//            
//            NSString *task_owner_nick_name = [rs stringForColumn:@"task_owner_nick_name"];
//            
//            if(task_owner_nick_name == nil)
//                task_owner_nick_name = @"";
//            
//            NSNumber *task_owner_uid = [NSNumber numberWithInt:[rs intForColumn:@"task_owner_uid"]];
//            
//            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", pcid, @"cid", type, @"type", title, @"title", subtitle, @"subtitle", answer, @"answer", option, @"option", image_url, @"image_url", video_url, @"video_url", need_update, @"need_update", is_passed, @"is_passed", task_owner_avatar, @"task_owner_avatar", task_owner_nick_name, @"task_owner_nick_name", task_owner_uid, @"task_owner_uid", nil];
//            [array addObject:dict];
//            count++;
//            if(count == 50)
//                break;
//        }
//    }
//    return array;
//}
//
//-(BOOL)existCacheWith:(NSInteger)taskId andToken:(NSString *)token
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where id = %d and token = %@", TABLE_CACHE, taskId, token];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0? NO:YES);
//}
//
////判断是否玩过
//-(BOOL)hasPlayWithTaskId:(NSInteger)taskId
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select is_passed from %@ where id = %d", TABLE_TASK, taskId];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    int n = 0;
//    while ([rs next])
//    {
//        n = [rs intForColumn:@"is_passed"];
//    }
//    return (n == 0?NO:YES);
//}
//
//-(BOOL)recordCacheWithTaskId:(NSInteger)taskId andToken:(NSString *)token andCid:(NSInteger)cid
//{
//    if([self hasPlayWithTaskId:taskId])
//        return YES;
//    
//    NSString *sql = [NSString stringWithFormat:@"update %@ set is_passed = 1 where id = %d and cid = %d", TABLE_TASK, taskId, cid];
//    BOOL suc = [self.db executeUpdate:sql];
//    DLog(@"%d", suc);
//    
//    if([self existCacheWith:taskId andToken:token])
//    {
//        return YES;
//    }
//    else
//    {
//        NSString *sqlString = [NSString stringWithFormat:@"insert into %@ values('%@', %d)", TABLE_CACHE, token, taskId];
//        BOOL success = [self.db executeUpdate:sqlString];
//        
//        success = [self updateUserCount:token andBoolReset:NO];
//        return success;
//    }
//}
//
//-(BOOL)existTableCount:(NSString *)token
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select count(*) as 'count' from %@ where token = '%@'", TABLE_COUNT, token];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSInteger count = 0;
//    while ([rs next])
//    {
//        count = [rs intForColumn:@"count"];
//    }
//    return (count == 0? NO:YES);
//}
//
//-(int)userCount:(NSString *)token
//{
//    NSString *sql = [NSString stringWithFormat:@"select count from %@ where token = '%@'", TABLE_COUNT, token];
//    FMResultSet *rs = [self.db executeQuery:sql];
//    int n = 0;
//    while ([rs next])
//    {
//        n = [rs intForColumn:@"count"];
//    }
//    return n;
//}
//
//-(BOOL)updateUserCount:(NSString *)token andBoolReset:(BOOL)aReset
//{
//    if(![self existTableCount:token])
//    {
//        NSString *sql = [NSString stringWithFormat:@"insert into %@ values('%@', 0)", TABLE_COUNT, token];
//        BOOL suc = [self.db executeUpdate:sql];
//        DLog(@"%d", suc);
//    }
//    
//    int count = 0;
//    if(aReset)
//        count = -1;
//    else
//        count = [self userCount:token];
//    NSString *sql = [NSString stringWithFormat:@"update %@ set count = %d where token = '%@'", TABLE_COUNT, count+1, token];
//    BOOL suc = [self.db executeUpdate:sql];
//    return suc;
//}
//
//-(NSArray *)getCacheArray
//{
//    NSString *sqlString = [NSString stringWithFormat:@"select * from %@", TABLE_CACHE];
//    FMResultSet *rs = [self.db executeQuery:sqlString];
//    NSMutableArray *array = [NSMutableArray array];
//    while ([rs next])
//    {
//        NSNumber *taskId = [NSNumber numberWithInt:[rs intForColumn:@"id"]];
//        NSString *token = [rs stringForColumn:@"token"];
//        
//        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:taskId, @"taskId", token, @"token", nil];
//        [array addObject:dict];
//    }
//    return array;
//}
//
////改变缓存用户玩的关卡的token值
//-(BOOL)changeCacheTaskToken:(NSString *)token
//{
//    NSString *sql = [NSString stringWithFormat:@"update %@ set token = '%@' where token = '-1'", TABLE_CACHE, token];
//    BOOL suc = [self.db executeUpdate:sql];
//    
//    sql = [NSString stringWithFormat:@"update %@ set token = '%@' where token = '-1'", TABLE_COUNT, token];
//    suc = [self.db executeUpdate:sql];
//    
//    return suc;
//}
//
//-(BOOL)removeCacheTask:(NSInteger)taskId
//{
//    NSString *sql = [NSString stringWithFormat:@"delete from %@ where id = %d", TABLE_CACHE,taskId];
//    BOOL delete = [self.db executeUpdate:sql];
//    return delete;
//}
// */
//@end
