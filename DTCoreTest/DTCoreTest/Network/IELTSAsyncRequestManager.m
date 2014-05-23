//
//  IELTSAsyncRequestManager.m
//  IELTSAnswer
//
//

#import "IELTSAsyncRequestManager.h"
#import "AFNetworkActivityIndicatorManager.h"

@interface IELTSAsyncRequestManager() <UIAlertViewDelegate>

@end


@implementation IELTSAsyncRequestManager

+ (IELTSAsyncRequestManager *)shareManager{
    static IELTSAsyncRequestManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[IELTSAsyncRequestManager alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        self.manager = [AFHTTPRequestOperationManager manager];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    }
    return self;
}

- (void)cancelAllOperations {
    [self.manager.operationQueue cancelAllOperations];
}


#pragma mark - 用户注册登陆模块
//邮箱注册
- (void)registeredWithAccount:(NSString *)account andName:(NSString *)name andPassword:(NSString *)password completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"username": account, @"name": name, @"password": password};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqUserRegistered];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//登陆
- (void)loginUserWithAccount:(NSString *)account andPassword:(NSString *)password completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"username": account, @"password": password};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqUserLogin];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//第三方账号登录
- (void)registerThirdAccountPlatform:(NSString *)platform completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"third_uid": [SetUtil getThirdUid], @"token": [SetUtil getToken], @"name": [SetUtil getUserName], @"third_code": platform};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqThirdUserLogin];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//第三方账号登录后提交邮箱信息
- (void)emailWithEmail:(NSString *)email andOauth:(NSString *)oauth_id completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"username": email, @"name": [SetUtil getUserName], @"oauth_id": oauth_id};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqUserNameEmail];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}





//获取个人信息
- (void)fetchUserInfoCompletion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqUserInfo];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}
//其他用户信息
- (void)fetchOtherUserInfoWithUserId:(NSString *)user_id completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"user_id": user_id};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqUserInfo];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}


//添加战友
- (void)addComradeWithUserId:(NSString *)userId completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"user_id": userId};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqAddComrade];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}
//移除战友
- (void)deleteComradeWithUserId:(NSString *)userId completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"user_id": userId};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqdeleteComrade];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//更换宠物
- (void)changePetWithPetId:(NSString *)pet_id completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"pet_id": pet_id};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqChangePet];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}



//搜索战友
- (void)searchComradeWithQuery:(NSString *)query completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"query": query};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqSearchComrade];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}

//战友排行榜
- (void)rankComradeWithType:(NSNumber *)type andRow:(NSNumber *)row andOffset:(NSNumber *)offset completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"type": type, @"rows": row, @"offset":offset};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqRankComrade];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}

//获取学霸推荐列表
- (void)getTopstudentListWithCompletion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqTopstudentList];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}


//设置出题范围
- (void)settingQuestionRangeWithRange:(NSString *)range completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"range": range};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqQuestionRange];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}



//设置地区学科信息
- (void)settingSubjectWithRegionCatalogId:(NSString *)region_catalog_id completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"region_catalog_id": region_catalog_id};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqSetRegionCatalog];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

#pragma mark - 学科首页接口


//获取学科分类
- (void)getSubjectsWithSessionID:(NSString *)sessionID completion:(void(^)(id objects, BOOL isSuccess))callback{
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqSubject];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//获取用户学科首页
- (void)getUserSubjectIndexWithSessionID:(NSString *)sessionID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"subject_id": subjectID};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqUserSubject];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//根据知识点出题
- (void)getQuestionListByKidWithSessionID:(NSString *)sessionID andKnowledgeID:(NSString *)knowledgeID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"knowledge_id": knowledgeID,@"subject_id": subjectID,@"location_id": [SetUtil getRegionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqQuestionListKid];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}

//根据学科出题

- (void)getQuestionListBysubjectIdWithSessionID:(NSString *)sessionID andSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"subject_id": subjectID,@"location_id": [SetUtil getRegionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@", BASE_API_URL, rqQuestionListSubject];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}



#pragma mark - 刷题模块


#pragma mark - 提交练习
- (void)commitPracticeRightDetail:(NSString *)aRightDetail UserAnswer:(NSString *)aUserAnswer Collect:(NSString*)aCollect RightCount:(NSString *)aRightCount WrongCount:(NSString *)aWrongCount Experience:(NSString *)aExperience SubjectID:(NSString *)subjectID PracticeName:(NSString *)aPracticeName QuestionNum:(NSString *)aQuestionNum IsPass:(NSString *)aIsPass completion:(void(^)(id objects, BOOL isSuccess))callback{
    
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"right_detail": aRightDetail, @"user_answer": aUserAnswer, @"collect": aCollect, @"right_count": aRightCount, @"wrong_count": aWrongCount, @"experience": aExperience, @"subject_id": subjectID, @"practice_name": aPracticeName,@"question_num": aQuestionNum,@"is_pass": aIsPass};
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqCommitPractice];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
    
}

//获取题目解析
-(void)checkAnalysisWithQuestion_ids:(NSString *)aQuestion_ids completion:(void(^)(id objects, BOOL isSuccess))callback
{
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"question_ids":aQuestion_ids};
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqQuestionAnalysis];
    
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}


#pragma mark - 获取我的练习
- (void)getMyPracticeListWithSubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId], @"subject_id": subjectID};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqMyPractice];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}
#pragma mark - 错题本和收藏夹
- (void)getBookListDatagetBookType:(NSString *)atype Offset:(NSNumber *)aOffset andNum:(NSNumber *)aNum SubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    
    NSDictionary *parameter = @{@"bookType": atype,@"offset": aOffset,@"num": aNum,@"session_id": [SetUtil getSessionId], @"subject_id": subjectID};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqBookList];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
    
}
#pragma mark - 历史练习
- (void)getHistoryListOffset:(NSNumber *)aOffset andNum:(NSNumber *)aNum SubjectID:(NSString *)subjectID completion:(void(^)(id objects, BOOL isSuccess))callback{
    NSDictionary *parameter = @{@"offset": aOffset,@"num": aNum,@"session_id": [SetUtil getSessionId], @"subject_id": subjectID};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqHistoryList];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}

#pragma mark - 答题卡列表 (type: 1表示错题本, 2表示收藏夹, 3表示练习记录)
- (void)fetchQuestionHistoryWithSubjectId:(NSString *)subject_id andTime:(NSString *)time andType:(NSString *)type andPracticeId:(NSString *)practice_id completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"subject_id": subject_id, @"time": time, @"session_id": [SetUtil getSessionId], @"type": type, @"practice_id": practice_id};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqAnswerCard];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}
#pragma mark - 获取历史试题(question_ids 题目Id组成的串,以","分割)
- (void)fetchQuestionHistoryWithQuestionIds:(NSString *)question_ids completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"question_ids": question_ids, @"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqQuestionHistory];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}

#pragma mark - 获取消息列表
- (void)fetchMessageListWithCompletion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqMessageList];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}

#pragma mark - 将消息置为被读状态
- (void)postMessageReadWithMessageID:(NSNumber *)messageID completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"message_id": messageID, @"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqChangeMessageStatus];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}
- (void)newMessageCountCompletion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter = @{@"session_id": [SetUtil getSessionId]};
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,raNewMessageCount];
    [self sendGetMethod:urlString andParameters:parameter completion:callback];
}


#pragma mark - 举报
- (void)feedbackQuestionWithSubjectId:(NSString *)subject_id andQuestionId:(NSString *)question_id andArticleID:(NSNumber *)article_id andPhone:(NSString *)phone andContent:(NSString *)content completion:(void(^)(id objects, BOOL isSuccess))callback {
    NSDictionary *parameter;
    DLog(@"article_id = %@", article_id);
    if (article_id) {
        parameter = @{@"session_id": [SetUtil getSessionId], @"subject_id": subject_id, @"question_id" : question_id, @"article_id": article_id, @"phone": phone, @"content": content};
    }
    else {
        parameter = @{@"session_id": [SetUtil getSessionId], @"subject_id": subject_id, @"question_id" : question_id, @"phone": phone, @"content": content};
    }
    NSString *urlString = [NSString stringWithFormat:@"%@%@",BASE_API_URL,rqFeedback];
    [self sendPostMethod:urlString andParameters:parameter completion:callback];
}





#pragma mark - POST方法
- (void)sendPostMethod:(NSString *)urlString andParameters:(NSDictionary *)parameters completion:(void(^)(id objects, BOOL isSuccess))callback {
    DLog(@"打印Http请求地址 = %@", [NSString stringWithFormat:@"%@?%@", urlString, [self changeDictionaryToString:parameters]]);
    [self.manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"responseObject...%@", responseObject);
        if ([responseObject[@"response_status"] isEqualToString:@"error"]) {
            DLog(@"error_message = %@", responseObject[@"response_error_message"]);
            if ([responseObject[@"response_error_code"] integerValue] == 10033) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:responseObject[@"response_error_message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                [alert show];
                [SetUtil removeUserInfo];
                return;
            }
            else {
                responseObject = [self parseJsonResponse:responseObject];
                callback(responseObject, NO);
            }
        }
        else {
            if (responseObject) {
                responseObject = [self parseJsonResponse:responseObject];
                if([responseObject isKindOfClass:[NSError class]]) {
                    callback(responseObject, NO);
                }
                else {
                    callback(responseObject, YES);
                }
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"error...%@", error.localizedDescription);
        callback(error, NO);
    }];
}


#pragma mark - GET方法
- (void)sendGetMethod:(NSString *)urlString andParameters:(NSDictionary *)parameters completion:(void(^)(id objects, BOOL isSuccess))callback {
    DLog(@"打印Http请求地址 = %@", [NSString stringWithFormat:@"%@?%@", urlString, [self changeDictionaryToString:parameters]]);
    [self.manager GET:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"responseObject...%@", responseObject);
        if ([responseObject[@"response_status"] isEqualToString:@"error"]) {
            DLog(@"error_message = %@", responseObject[@"response_error_message"]);
            if ([responseObject[@"response_error_code"] integerValue] == 10033) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:responseObject[@"response_error_message"] delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
                [alert show];
                [SetUtil removeUserInfo];
                return;
            }
            else {
                responseObject = [self parseJsonResponse:responseObject];
                callback(responseObject, NO);
            }
        }
        else {
            if (responseObject) {
                responseObject = [self parseJsonResponse:responseObject];
                if([responseObject isKindOfClass:[NSError class]]) {
                    callback(responseObject, NO);
                }
                else {
                    callback(responseObject, YES);
                }
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"error...%@", error.localizedDescription);
        callback(error, NO);
    }];
}


/**
 * 解析返回的data, 只有handleResponseData函数调用.
 */
- (id)parseJsonResponse:(id)data
{
    if (![data isKindOfClass:[NSDictionary class]] && ![data isKindOfClass:[NSArray class]])
    {
        return [NSError errorWithDomain:@"无效数据" code:0 userInfo:nil];
    }
    
    if ([data isKindOfClass:[NSDictionary class]])
    {
        if ([[data allKeys] count] == 0)
        {
            return [NSError errorWithDomain:@"无效数据" code:0 userInfo:nil];
        }
        if ([data objectForKey:@"response_error_code"])
        {
            if ([data objectForKey:@"response_error_message"])
            {
                return [NSError errorWithDomain:[data objectForKey:@"response_error_message"]  code:[[data objectForKey:@"response_error_code"]intValue] userInfo:nil];
            }
            return [NSError errorWithDomain:@"服务器异常" code:-1 userInfo:nil];
        }
        if ([data objectForKey:@"response_data"])
        {
            data = [data objectForKey:@"response_data"];
        }
    }
    return data;
}


#pragma mark - 错误信息反馈
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    [SetUtil removeUserInfo];
    [[NSNotificationCenter defaultCenter] postNotificationName:LOGIN_OR_LOGOUT object:nil];
}

- (void)showProgressHUDWith:(NSError *)error {
    NSString *shortError = nil;
    switch (error.code) {
        case NSURLErrorBadServerResponse :
            shortError = @"服务器响应异常，服务器地址配置可能有误，请检查";
            break;
        case NSURLErrorCannotConnectToHost:
            shortError = @"不能连接到服务器，请检查你的网络设置";
            break;
        case NSURLErrorCannotFindHost:
            shortError = @"找不到指定服务器，请检查服务器地址配置";
            break;
        case NSURLErrorNotConnectedToInternet:
            shortError = @"没有连接到网络，请检查你的网络设置";
            break;
        case NSURLErrorTimedOut:
            shortError = @"请求超时，可能网络不畅或服务器无响应";
            break;
        default:
            shortError = [error domain];
            break;
    }
    if ([shortError isEqualToString:@"NSURLErrorDomain"]) 
        return;
    [SVProgressHUD showErrorWithStatus:shortError];
}


#pragma mark - 推荐
- (void)appTuijianCompletion:(void(^)(id objects, BOOL isSuccess))callback {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    NSDictionary *parameter = @{@"app_id": @"tlkyjl"};
    NSString *urlString = @"http://txwt.app.91waijiao.com/recommend_app/list.do?";
    [manager GET:urlString parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
        DLog(@"responseObject...%@", responseObject);
        if (responseObject) {
            callback(responseObject[@"response_data"], YES);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        DLog(@"error...%@", error.localizedDescription);
        callback(error, NO);
    }];
}


//NSDictionary转NSString
- (NSMutableString *)changeDictionaryToString:(NSDictionary *)parameter {
    NSMutableString *mutableStr = [NSMutableString string];
    for (NSString *key in parameter) {
        NSString *str = [NSString stringWithFormat:@"%@=%@&",key, parameter[key]];
        [mutableStr appendString:str];
    }
    [mutableStr deleteCharactersInRange:NSMakeRange(mutableStr.length - 1, 1)];
    
//    NSEnumerator *enumerator = [parameter keyEnumerator];
//    id object;
//    NSMutableString *mutableStr = [NSMutableString string];
//    while (object = [enumerator nextObject]) {
//        id objectValue = parameter[object];
//        if (objectValue != nil) {
//            NSString *str = [NSString stringWithFormat:@"%@=%@&",object, objectValue];
//            [mutableStr appendString:str];
//        }
//    }
//    [mutableStr deleteCharactersInRange:NSMakeRange(mutableStr.length - 1, 1)];
    
    DLog(@"mutableStr = %@", mutableStr);
    return mutableStr;
}

@end
