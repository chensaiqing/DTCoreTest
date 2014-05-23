////
////  UniversalMethod.m
////  WordGuessingFrenzy
////
////  Created by kanon on 13-8-31.
////  Copyright (c) 2013年 kanon. All rights reserved.
////
//
//#import "UniversalMethod.h"
//#import "AppDelegate.h"
////#import "OLImage.h"
////#import "OLImageView.h"
////#import "YLGIFImage.h"
////#import "YLImageView.h"
//#import "SubjectMode.h"
//#import "KnowledgeMode.h"
//
//
//#define DATABASE [DataBaseManager standardDataBaseManager]
//
//@implementation UniversalMethod
//
////+(void)showWaitingView
////{
////    UIApplication *application = [UIApplication sharedApplication];
////    AppDelegate *aDelegate = (AppDelegate *)application.delegate;
////    UIWindow *win = aDelegate.window;
////    
////    CGFloat height = (IS_IPHONE_5) ? 568 : 480;
////    UIView *fullScreen = [[UIView alloc] initWithFrame:CGRectMake(0, 20 + 44, 320, height - 20 - 44)];
////    fullScreen.backgroundColor = [UIColor clearColor];
////    fullScreen.tag = 101;
////    [win addSubview:fullScreen];
////    
////    
////    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
////    view.backgroundColor = [UIColor clearColor];
////    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 40, 120, 120)];
////    imageView.backgroundColor = [UIColor blackColor];
////    imageView.layer.cornerRadius = 15;
////    imageView.layer.masksToBounds = YES;
////    imageView.alpha = 0.8;
////    [view addSubview:imageView];
////    
////    YLGIFImage *image = (YLGIFImage *)[YLGIFImage imageNamed:@"loading.gif"];
////    YLImageView *animationImageView = [[YLImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width / 4, image.size.height / 4)];
////    animationImageView.image = image;
////    animationImageView.center = view.center;
////    [view addSubview:animationImageView];
////    
////    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(40, animationImageView.frame.origin.y + animationImageView.frame.size.height - 5, 120, 30)];
////    label.text =  @"加载中";
////    label.backgroundColor = [UIColor clearColor];
////    label.textAlignment = NSTextAlignmentCenter;
////    label.textColor = [UIColor whiteColor];
////    [view addSubview:label];
////    
////    view.center = CGPointMake(win.center.x, win.center.y - 33);
////    [fullScreen addSubview:view];
////    
////}
////
////+(void)hiddenWaitingView
////{
////    UIApplication *application = [UIApplication sharedApplication];
////    AppDelegate *aDelegate = (AppDelegate *)application.delegate;
////    UIWindow *win = aDelegate.window;
////    for(UIView *view in [win subviews])
////    {
////        if(view.tag == 101)
////        {
////            [view removeFromSuperview];
////        }
////    }
////}
//
//
////每次进入时先从本地读取库读取，第一次进入时没有数据，走网络
//+ (NSMutableArray *)subjectArrayFromLocalWithSubjectID:(NSString *)subject_id {
//    NSMutableArray *array = [NSMutableArray array];
//    NSMutableArray *array1 = [[DataBaseManager standardDataBaseManager] getSubjectArrayWithSubjectId:subject_id];
//    for (NSDictionary *dict in array1) {
//        SubjectMode *item = (SubjectMode *)[SubjectMode objectForDictionary:dict];
//        if (item.parentId == 0) {
//            [array addObject:item];
//        }
//    }
//    
//    for (SubjectMode *item in array) {
//        NSMutableArray *array2 = [NSMutableArray array];
//        NSMutableArray *array3 = [[DataBaseManager standardDataBaseManager] getSubjectArrayWithSubjectId:subject_id andParentId:item.kId];
//        if (array3.count > 0) {
//            for (NSDictionary *dict in array3) {
//                SubjectMode *item = (SubjectMode *)[SubjectMode objectForDictionary:dict];
//                [array2 addObject:item];
//            }
//        }
//        item.sub_knowledge = array2;
//    }
//    DLog(@"count = %d", array.count);
//    
//    return array;
//}
//
//
//
////网络获取数据后写入本地数据库并返回model的格式
//+(NSMutableArray *)subjectArrayFromNetworkArray:(NSArray *)aArray  andSubjectID:(NSString *)aSubjectID{
//    NSMutableArray *array = [NSMutableArray array];
//    for(NSDictionary *dict in aArray)
//    {
//        SubjectMode *item = (SubjectMode *)[SubjectMode objectForDictionary:dict];
//        [DATABASE insertSubject:aSubjectID andkid:item.kId andName:item.name andFinish_rate:item.finish_rate andParentId:item.parentId andQuestionNums:item.questionNums];
//        
//        NSMutableArray *array1 = item.sub_knowledge;
//        
//        if ([array1 count]==0) {
//            
//        }else{
//            for (KnowledgeMode *item1 in array1) {
//                [DATABASE insertSubject:aSubjectID andkid:item1.kId andName:item1.name andFinish_rate:item1.finish_rate andParentId:item1.parentId andQuestionNums:item1.questionNums];
//            }
//        }
//        
//        [array addObject:item];
//    }
//    return array;
//}
//
//
//
//
////搜索接口
//+(NSMutableArray *)getSubjectWithName:(NSString *)aName andSubjectID:(NSString *)aSubjectID{
//    
//    NSMutableArray *array1 = [DATABASE getSubjectWithName:aName andSubjectID:aSubjectID];
//    NSMutableArray *array2 = [NSMutableArray array];
//    for(NSDictionary *dict in array1)
//    {
//        KnowledgeMode *item = (KnowledgeMode *)[KnowledgeMode objectForDictionary:dict];
//        [array2 addObject:item];
//    }
//    return array2;
//    
//}
//
////搜索知识点name接口
//+(NSString *)getKnowledgeWithKId:(NSInteger )aKId{
//    NSString *name = [DATABASE getKnowledgeNameWithkId:aKId];
//    return name;
//}
//
//
////搜索知识点的subjectID
//+(NSString *)getsubjectIDWithkId:(NSInteger )aKId{
//    NSString *subjectID = [DATABASE getsubjectIDWithkId:aKId];
//    return subjectID;
//}
//
//////获取所有消息中最大的时间id
////+(NSInteger)userMaxTimeMessageIdWithUserId:(NSString *)aUser_Id
////{
////    return [DATABASE getMessageIdMaxTimeWithUserId:aUser_Id];
////}
//
////网络获取数据后写入本地数据库并返回model的格式
//+(NSMutableArray *)MessageArrayFromNetworkArray:(NSArray *)aArray andUserId:(NSString *)aUser_id
//{
//    NSMutableArray *array = [NSMutableArray array];
//    for(NSDictionary *dict in aArray)
//    {
//        MessageListItem *item = (MessageListItem *)[MessageListItem objectForDictionary:dict];
////        [DATABASE insertMessage:[item.message_id integerValue] andUserId:aUser_id andSender:item.sender andSendee:item.sendee andContent:item.content andHadRead:[item.had_read integerValue] andTime:[item.time longLongValue]];
//
//        [DATABASE insertMessage:[item.message_id integerValue] andType:item.type andMyUserId:aUser_id andUserId:item.user_id andUrl:item.url andTitle:item.title andContent:item.content andHadRead:[item.had_read integerValue] andTime:[item.time longLongValue]];
//        
//        [array addObject:item];
//    }
//    return array;
//}
//
////从本地数据库读取以前的消息, 小于某个时间，以及个数
//+(NSMutableArray *)MessageArrayFromLocalTime:(NSNumber *)aTime andCount:(NSInteger)aCount andUserId:(NSString *)aUser_id
//{
//    NSMutableArray *array1 = [DATABASE readMessageWithTime:[aTime longLongValue] andCount:aCount andUserId:aUser_id];
//    NSMutableArray *array2 = [NSMutableArray array];
//    for(NSDictionary *dict in array1)
//    {
//        MessageListItem *item = (MessageListItem *)[MessageListItem objectForDictionary:dict];
//        [array2 addObject:item];
//    }
//    return array2;
//}
//
////将消息置为已读的，本地的
//+(BOOL)MessageSetHadReadWithId:(NSNumber *)aMessageId andUserId:(NSString *)aUser_id
//{
//    return [DATABASE setMessageHadReadWithId:[aMessageId integerValue] andUserId:aUser_id];
//}
//
////+(BOOL)isMatchTime:(NSString *)aKey
////{
////    NSString *regex = @"^([1][7-9][0-9][0-9]|[2][0][0-9][0-9])(\\-)([0][1-9]|[1][0-2])(\\-)([0-2][1-9]|[3][0-1])$";
////    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
////    BOOL isMatch = [pred evaluateWithObject:aKey];
////    return isMatch;
////}
////
//////搜索接口
////+(NSMutableArray *)messageWithKey:(NSString *)aKey
////{
////    BOOL isMatch = [UniversalMethod isMatchTime:aKey];
////    
////    if(isMatch == NO)
////    {
////        NSArray *array = [aKey componentsSeparatedByString:@"-"];
////        if(array && [array count] == 3)
////        {
////            NSString *str1 = [array objectAtIndex:1];
////            if([str1 length] < 2)
////            {
////                str1 = [NSString stringWithFormat:@"0%@", str1];
////            }
////            
////            NSString *str2 = [array objectAtIndex:2];
////            if([str2 length] < 2)
////            {
////                str2 = [NSString stringWithFormat:@"0%@", str2];
////            }
////            
////            aKey = [NSString stringWithFormat:@"%@-%@-%@", [array objectAtIndex:0],  str1, str2];
////            
////            isMatch = [UniversalMethod isMatchTime:aKey];
////        }
////    }
////    
////    
////    NSMutableArray *array1 = [DATABASE getMessageWithKey:aKey andBoolTime:isMatch];
////    NSMutableArray *array2 = [NSMutableArray array];
////    for(NSDictionary *dict in array1)
////    {
////        MessageListItem *item = (MessageListItem *)[MessageListItem objectForDictionary:dict];
////        [array2 addObject:item];
////    }
////    return array2;
////}
//
////+(void)HiddenTabBar
////{
////    AnswerQuestionAppDelegate *appDelegate = (AnswerQuestionAppDelegate *)[UIApplication sharedApplication].delegate;
////    [appDelegate hiddenTabBar];
////}
////
////+(void)ShowTabBar
////{
////    AnswerQuestionAppDelegate *appDelegate = (AnswerQuestionAppDelegate *)[UIApplication sharedApplication].delegate;
////    [appDelegate showTabBar];
////}
////
////+(void)writeTaskToDataBase:(NSArray *)aArray andLevel:(NSInteger)level
////{
////    for(NSDictionary *dict in aArray)
////    {
////        TaskModel *aTask = (TaskModel *)[TaskModel objectForDictionary:dict];
////        DataBaseManager *dataBase = [DataBaseManager standardDataBaseManager];
////        [dataBase updateTaskId:aTask.taskId andLevelId:aTask.level_id andOriginal_sentence:aTask.original_sentence andTranslate_sentence:aTask.translate_sentence andPartition_sentence:aTask.partition_sentence andPartition_word:aTask.partition_word andAlternative_word:aTask.alternative_word andLevel:aTask.level];
////    }
////}
////
//////获取所有单词
////+(NSArray *)getAllWordArrayWithTask:(TaskModel *)aTask
////{
////    NSArray *array1 = [aTask.partition_word componentsSeparatedByString:@","];
////    NSArray *array2 = [aTask.alternative_word componentsSeparatedByString:@","];
////    NSMutableArray *array = [NSMutableArray arrayWithArray:array2];
////    for(NSString *string in array1)
////    {
////        [array addObject:string];
////    }
////    NSMutableArray *changeArray = [NSMutableArray array];
////    while ([array count] != 0)
////    {
////        int m = arc4random() % [array count];
////        NSString *str = [array objectAtIndex:m];
////        [changeArray addObject:str];
////        [array removeObjectAtIndex:m];
////    }
////    return changeArray;
////}
////
//////拆分填空单词
////+(NSArray *)getTastWordStatusWithTask:(TaskModel *)aTask
////{
////    
////    NSMutableArray *aWordArray = [NSMutableArray array];
////    
////    NSArray *array1 = [aTask.original_sentence componentsSeparatedByString:@" "];
////    NSArray *array2 = [aTask.partition_sentence componentsSeparatedByString:@" "];
////    if([array1 count] != [array2 count])
////    {
////        DLog(@"句子有问题");
////        return array2;
////    }
////    for(int i = 0; i < [array1 count]; i++)
////    {
////        NSString *str1 = [array1 objectAtIndex:i];
////        NSString *str2 = [array2 objectAtIndex:i];
////        if([str1 isEqualToString:str2])
////        {
////            WordItem *word = [[WordItem alloc] init];
////            word.wordStr = str1;
////            word.visibleIndex = 0;
////            [aWordArray addObject:word];
////            [word release];
////        }
////        else
////        {
////            if([str2 isEqualToString:@"#"])
////            {
////                WordItem *word = [[WordItem alloc] init];
////                word.wordStr = str1;
////                word.visibleIndex = 1;
////                [aWordArray addObject:word];
////                [word release];
////            }
////            else
////            {
////                NSRange range = [str2 rangeOfString:@"#"];
////                if(range.location == 0)
////                {
////                    NSString *str = [str2 substringFromIndex:range.length];
////                    WordItem *word1 = [[WordItem alloc] init];
////                    word1.wordStr = [str1 stringByReplacingOccurrencesOfString:str withString:@""];
////                    word1.visibleIndex = 1;
////                    [aWordArray addObject:word1];
////                    [word1 release];
////                    
////                    WordItem *word2 = [[WordItem alloc] init];
////                    word2.wordStr = str;
////                    word2.visibleIndex = 0;
////                    [aWordArray addObject:word2];
////                    [word2 release];
////                }
////            }
////        }
////    }
////    return aWordArray;
////}
////
////+(NSArray *)taskArrayWithArray:(NSArray *)aArray andLevel:(NSInteger)level
////{
////    [UniversalMethod writeTaskToDataBase:aArray andLevel:level];
////    
////    NSMutableArray *array = [NSMutableArray array];
////    for(NSDictionary *dict in aArray)
////    {
////        TaskModel *aTask = (TaskModel *)[TaskModel objectForDictionary:dict];
////
////        aTask.allWordArray = [UniversalMethod getAllWordArrayWithTask:aTask];
////         aTask.wordArray = [UniversalMethod getTastWordStatusWithTask:aTask];
////        [array addObject:aTask];
////    }
////    return array;
////}
////
////+(NSDictionary *)offsetWithUserId:(NSString *)userId andLevel:(NSInteger)aLevel;
////{
////    NSInteger count = [[DataBaseManager standardDataBaseManager] taskOffsetWithUserId:userId andLevel: aLevel];
////    NSInteger successCount = [[DataBaseManager standardDataBaseManager] taskSuccessCountWithUserId:userId];
////    NSInteger gold = [[DataBaseManager standardDataBaseManager] taskGoldWithUserId:userId];
////    
////    NSDictionary *dcit = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInteger:count], @"offset", [NSNumber numberWithInteger:successCount], @"successCount",  [NSNumber numberWithInteger:gold], @"gold", nil];
////    return dcit;
////}
////
////+(NSInteger)onlyOffsetWithUserId:(NSString *)userId andLevel:(NSInteger)aLevel
////{
////    NSInteger count = [[DataBaseManager standardDataBaseManager] taskOffsetWithUserId:userId andLevel: aLevel];
////    return count;
////}
////
////+(NSArray *)taskArrayWithLevelFromLocal:(NSInteger)level andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount;
////{
////    NSArray *array = [[DataBaseManager standardDataBaseManager] taskArrayWithLevel:level andOffset:aOffect andCount:aCount];
////    return array;
////}
////
////+(BOOL)passTask:(NSNumber *)taskId andUserID:(NSString *)aUserID andLevel:(NSInteger)aLevel LevelOneMaxId:(NSNumber *)aLevelOneId andLevelTwoMaxId:(NSNumber *)aLevelTwoId andLevelThreeMaxId:(NSNumber *)aLevelThreeId andSuccessCount:(NSInteger)aCount andTotalGold:(NSInteger)aGold andHelpCount:(NSInteger)helpCount
////{
////   return [[DataBaseManager standardDataBaseManager] updateLevelOneMaxId:aLevelOneId andLevelTwoMaxId:aLevelTwoId andLevelThreeMaxId:aLevelThreeId andUserId:aUserID andLevel:aLevel andTaskId:taskId andCount:aCount andGold:aGold andHelpCount:helpCount];
////}
////
////+(NSArray *)myPassTastArray:(NSArray *)aArray andUserId:(NSString *)userId
////{
////    NSMutableArray *array = [NSMutableArray array];
////    for(NSDictionary *dict in aArray)
////    {
////        TaskModel *aTask = (TaskModel *)[TaskModel objectForDictionary:dict];
////        DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////        [database updateUserId:userId andTaskId:aTask.taskId andHelpTime:aTask.help_time andOriginal_sentence:aTask.original_sentence andTranslate_sentence:aTask.translate_sentence andLevel_id:aTask.level_id andLevel:aTask.level andHelp_id:aTask.help_id];
//////        NSDictionary *dict = [database getTaskEnglishAndChinese:aTask.taskId];
//////        aTask.original_sentence = [dict objectForKey:@"original_sentence"];
//////        aTask.translate_sentence = [dict objectForKey:@"translate_sentence"];
////        [array addObject:aTask];
////    }
////    return array;
////}
////
//////从本地获取通过的句子
////+(NSArray *)myPassTastArrayFromLocalHadPass:(NSString *)userId andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount;
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    NSArray *array = [database getTaskIdWithUserId:userId andHelp_time:@"0" andOffset:[aOffect integerValue] andCount:aCount];
//////    for(TaskModel *item in array)
//////    {
//////        NSDictionary *dict = [database getTaskEnglishAndChinese:item.taskId];
//////        item.original_sentence = [dict objectForKey:@"original_sentence"];
//////        item.translate_sentence = [dict objectForKey:@"translate_sentence"];
//////    }
////    return array;
////}
//////从本地获取未通过的句子
////+(NSArray *)myPassTastArrayFromLocalNoPass:(NSString *)userId andOffset:(NSNumber *)aOffect andCount:(NSInteger)aCount
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    NSArray *array = [database getTaskIdWithUserId:userId andHelp_time:@"-1" andOffset:[aOffect integerValue] andCount:aCount];
//////    for(TaskModel *item in array)
//////    {
//////        NSDictionary *dict = [database getTaskEnglishAndChinese:item.taskId];
//////        item.original_sentence = [dict objectForKey:@"original_sentence"];
//////        item.translate_sentence = [dict objectForKey:@"translate_sentence"];
//////    }
////    return array;
////}
//////从本地获取已经通过的关卡，需要传入难易度，偏移值，以及aCount
////+(NSArray *)getTaskNavigationWithLevel:(NSNumber *)aLevel andUserId:(NSString *)userId andOffset:(NSInteger)aOffset andCount:(NSInteger)aCount
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    NSArray *array = [database getTaskNavigationWithLevel:aLevel andUserId:userId andOffset:aOffset andCount:aCount];
////    
////    
////    return array;
////}
////+(NSArray *)myLevelTastArray:(NSArray *)aArray andUserId:(NSString *)userId
////{
////    NSMutableArray *array = [NSMutableArray array];
////    for(NSDictionary *dict in aArray)
////    {
////        TaskModel *aTask = (TaskModel *)[TaskModel objectForDictionary:dict];
////        DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////       [database updatelevelUserId:userId andTaskId:aTask.taskId Level:aTask.level andLevelId:aTask.level_id andHelpTime:aTask.help_time andOriginal_sentence:aTask.original_sentence andTranslate_sentence:aTask.translate_sentence];
////        
////        [array addObject:aTask];
////    }
////    return array;
////
////}
//////+(BOOL)insertLevelUserId:(NSString *)userId andTaskId:(NSNumber *)taskId Level:(NSNumber *)aLevel andLevelId:(NSNumber *)level_id andHelpTime:(NSNumber *)help_time andOriginal_sentence:(NSString *)aOriginal_sentence andTranslate_sentence:(NSString *)aTranslate_sentence
//////{
//////     DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
//////    return [database updatelevelUserId:userId andTaskId:taskId Level:aLevel andLevelId:level_id andHelpTime:help_time andOriginal_sentence:aOriginal_sentence andTranslate_sentence:aTranslate_sentence];
//////}
////
////+(BOOL)deleteTaskNavigationLevel:(NSNumber *)aLevel
////{
////     DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database deleteTaskNavigationLevel:aLevel];
////}
////
////+(BOOL )wordArrayWithArray:(NSArray *)aArray
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    for(NSDictionary *dict in aArray)
////    {
////        WordModel *aModel = (WordModel *)[WordModel objectForDictionary:dict];
////        [database updateWordWithWordId:aModel.wordId andWord:aModel.word andTranslate:aModel.translate];
////    }
////    return YES;
////}
////
//////+(BOOL)wordHasExist
//////{
//////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
//////    return [database wordHasInData];
//////}
////
////+(NSInteger)wordCount
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database wordLocalCount];
////}
////
////+(NSString *)wordId
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database wordGetId];
////}
////
////+(NSString *)translateWithEnglishWord:(NSString *)word
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return  [database translateWithWord:word];
////}
////
////+(BOOL)changeUserId:(NSString *)userId
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database changeUserId:userId];
////}
////
////+(BOOL)deleteUserId:(NSString *)userId
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database deleteTempData:userId];
////}
////
////+(BOOL)copyNavigationDataUserNotLogin
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database copyDataToNavigation];
////}
////
////+(BOOL)needUpdateTempData:(NSString *)userId
////{
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database existTempData:userId];
////}
////
//////连胜总榜-加入数据库
////+(BOOL)insertPassUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore
////{
////    
////    DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    
////    return [database insertRankPassUserid:aUserId andName:aName andGender:agender andAvatar:avatar andzscore:aScore];
////}
//////连胜总榜-查询数据库
////+(NSArray *)RankPassSQLArray
////{
////     DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database PassSQLArray];
////}
//////连胜总榜-删除数据库
////+(BOOL)deleteRankPassSQL
////{
////     DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database deleteRankPass];
////}
////
//////昨日连胜总榜-加入数据库
////+(BOOL)insertYesterdayUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database insertYesterdayRankPassUserid:aUserId andName:aName andGender:agender andAvatar:avatar andzscore:aScore];
////    
////}
//////昨日连胜总榜-查询数据库
////+(NSArray *)RankYesterdaySQLArray
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database YesterdaySQLArray];
////    
////}
//////昨日连胜总榜-删除数据库
////+(BOOL)deleteRankYesterdaySQL
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database deleteRankYesterday];
////    
////}
////
//////昨日通关总榜-加入数据库
////+(BOOL)insertContinuousUserid:(NSNumber *)aUserId andName:(NSString *)aName andGender:(NSNumber *)agender andAvatar:(NSString *)avatar andzscore:(NSString *)aScore
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database insertRankContinuousUserid:aUserId andName:aName andGender:agender andAvatar:avatar andzscore:aScore];
////}
//////昨日通关总榜-查询数据库
////+(NSArray *)RankContinuousSQLArray
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database ContinuousSQLArray];
////}
//////昨日通关总榜-删除数据库
////+(BOOL)deleteRankContinuousSQL
////{
////      DataBaseManager *database =  [DataBaseManager standardDataBaseManager];
////    return [database deleteRankContinuous];
////}
//@end
