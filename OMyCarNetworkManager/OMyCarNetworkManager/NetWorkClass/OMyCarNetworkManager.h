//
//  XHNetWorkingClass.h
//  OMyCar
//
//  Created by 黎迅华 on 15/12/5.
//  Copyright © 2015年 黎迅华. All rights reserved.
//

/**
 *本类功能是：实现网络数据请求
 *1、需要导入AFNetworking第三方框架
 *传入对应的请求网络URL路径
 *成功后返回一个data
 *失败后返回对应的错误信息
 */


#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^NetworkSuccessBlock) (id data);/*定义成功返回的代码块变量类型*/
typedef void(^NetworkFailBlock) (NSString *errorMessage); /*定义失败返回的代码块变量类型*/
typedef void(^NetworkProgressBlock) (double progress);//定义进度条返回的代码块变量类型
typedef void(^NetWorkStatusBlock) (BOOL statusType);//网络链接是否成功
typedef void(^NetWorkStatusTypeBlock) (NSString *status);//网络状态类型

@interface OMyCarNetworkManager : NSObject

#pragma mark - ++++++++++++++++++++++++++ URL处理 ++++++++++++++++++++++++++

#pragma mark- 处理url 拼接host
+(NSString *)netWorkAppendHostUrl:(NSString *)urlStr domainName:(NSString *)domain;
#pragma mark- url特殊字符处理
+(NSString *)netWorkFormatParameterUrl:(NSString *)urlStr domainName:(NSString *)domain;

#pragma mark - ++++++++++++++++++++++++++ GET ++++++++++++++++++++++++++

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息(含有进度)*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息(进度)(自定义contentType)*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock appendContentType:(NSArray *)contentTypeArray;

#pragma mark - ++++++++++++++++++++++++++ POST ++++++++++++++++++++++++++

/**POST传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/**POST传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息（进度）*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息（进度）*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息（进度，contentType追加）*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock  appendContentType:(NSArray *)contentTypeArray;


#pragma mark - ++++++++++++++++++++++++++ PUT ++++++++++++++++++++++++++

/**@brief PUT方式进行提交*/
+(void)netWorkPutUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/** @brief delete 方式提交*/
+(void)netWorkDeleteUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock;

/** @brief 检测网络状态,返回一个BOOL值,检测网络类型,返回字符串:NONE,WAN,WIFI*/
+(void)netWorkReachAbilitystatus:(NetWorkStatusBlock)statusBlock type:(NetWorkStatusTypeBlock)typeBlock;


/** @brief 检测网络类型,返回字符串:NONE,WAN,WIFI*/
+(void)createUploadTask:(NSString *)filePath andToUrlString:(NSString *)urlString;
+(void)createDataTask:(NSString *)urlString andSuccess:(NetworkSuccessBlock)successBlock andFail:(NetworkFailBlock)failBlock;
+(void)createUploadTaskForMultiRequest:(NSString *)filePath andToUrlString:(NSString *)urlString andSuccess:(NetworkSuccessBlock)successBlock andFail:(NetworkFailBlock)failBlock andProgressBlock:(NetworkProgressBlock)progressBlock;

@end
