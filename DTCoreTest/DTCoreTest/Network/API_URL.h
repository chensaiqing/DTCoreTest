//
//  API_URL.h
//  IOSCloudSchool
//
//  Created by sai on 14-2-26.
//  Copyright (c) 2014年 kanon. All rights reserved.
//


#define rqUserRegistered        @"/tiku/user/tiku_register"             //注册接口
#define rqUserLogin             @"/tiku/user/tiku_login"                //邮箱登陆
#define rqThirdUserLogin        @"/tiku/user/thirdLogin"                //第三方帐号登陆接口
#define rqUserNameEmail         @"/tiku/user/addUserName"               //第三方登陆添加邮箱
#define rqUserInfo              @"/tiku/user/getUserInfo"               //个人信息

#define rqAddComrade            @"/tiku/user/addComrade"                //添加战友
#define rqdeleteComrade         @"/tiku/user/deleteComrade"             //移除战友

#define rqChangePet             @"/tiku/user/changePet"                 //更换宠物
#define rqSetRegionCatalog      @"/tiku/user/setRegionCatalog"          //设置地区学科

#define rqSearchComrade         @"/tiku/user/searchComrade"             //搜索战友
#define rqRankComrade           @"/tiku/user/rankComrade"               //战友排行榜
#define rqTopstudentList        @"/tiku/user/getTopstudentList"         //获取学霸推荐列表

//*****
#define rqQuestionRange         @"/tiku/question/setQuestionRange"      //出题范围

#define rqCommitPractice        @"/tiku/user/commitPractice"            //提交练习

#define rqQuestionAnalysis      @"/tiku/question/questionAnalysis"      //获取解析

#define rqMyPractice            @"/tiku/user/getPracticeIndex"           //获取我的练习
#define rqBookList              @"/tiku/user/userBookListData"           //获取错题本和收藏夹
#define rqHistoryList           @"/tiku/user/userPracticeList"           //历史练习

#define rqMessageList           @"/tiku/user/getMessageList"            //获取消息列表
#define rqChangeMessageStatus   @"/tiku/user/changeMessageStatus"       //将消息置为被读状态, ids:消息ID列表，使用逗号分隔
#define raNewMessageCount       @"/tiku/user/newMessageCount"           //未读消息数



//*****
#define rqAppNotice             @"/jxt/app_notice"                      //版本更新


#define rqSubject               @"/tiku/subject/getSubjects"                    //获取学科分类
#define rqUserSubject           @"/tiku/subject/getUserSubjectIndex"            //获取用户学科首页
#define rqQuestionListKid       @"/tiku/question/getQuestionListByKid"          //根据知识点出题
#define rqQuestionListSubject   @"/tiku/question/getQuestionListBysubjectId"    //根据学科出题


#define rqInvite                @"/tiku/user/invite"                    //邀请好友



#define rqAnswerCard            @"/tiku/user/answerCard"            //答题卡列表
#define rqQuestionHistory       @"/tiku/question/questionHistory"   //获取历史试题(question_ids 题目Id组成的串,以","分割)


#define rqFeedback              @"/tiku/question/feedback"          //举报

