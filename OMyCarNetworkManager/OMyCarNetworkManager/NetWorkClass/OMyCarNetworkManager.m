//
//  XHNetWorkingClass.m
//  OMyCar
//
//  Created by 黎迅华 on 15/12/5.
//  Copyright © 2015年 黎迅华. All rights reserved.

#import "OMyCarNetworkManager.h"

//路况信息列表请求URL

@implementation OMyCarNetworkManager

+(NSString *)netWorkAppendHostUrl:(NSString *)urlStr domainName:(NSString *)domain{
    if ([urlStr hasPrefix:@"http://"] || [urlStr hasPrefix:@"https://"]) {
        return urlStr;
    }
    if (domain) {
        return [NSString stringWithFormat:@"%@/%@", domain, urlStr];
    }
    return urlStr;
}
#pragma mark- url特殊字符处理
+(NSString *)netWorkFormatParameterUrl:(NSString *)urlStr domainName:(NSString *)domain{
    if ([urlStr hasPrefix:@"http://"] || [urlStr hasPrefix:@"https://"]) {
        [urlStr stringByAddingPercentEncodingWithAllowedCharacters:
         [NSCharacterSet URLQueryAllowedCharacterSet]];
        return urlStr;
    }
    if (domain) {
        urlStr = [NSString stringWithFormat:@"%@/%@", domain, urlStr];
    }
    [urlStr stringByAddingPercentEncodingWithAllowedCharacters:
     [NSCharacterSet URLQueryAllowedCharacterSet]];
    
    return urlStr;
}

#pragma mark - ==============================Get请求====================================

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    //AF - GET网络请求调用
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        #if DEBUG
            NSLog(@"获取Progress:%.f",downloadProgress.fractionCompleted);
        #endif
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
            NSLog(@"数据获取成功");
        #endif
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            successBlock(dictData);//调用代码块
        }else{
            successBlock(responseObject);//调用代码块
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
            NSLog(@"%@",error);
        #endif
        NSRange errorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"401"];
        NSRange serverErrorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"500"];
        if (errorRange.length > 0) { //登录过期,重新登录

        }else if (serverErrorRange.length > 0){

        }else{

        }
    }];
}

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息(含有进度)*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    //AF - GET网络请求调用
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        #if DEBUG
            NSLog(@"获取Progress:%.f",downloadProgress.fractionCompleted);
            progress(downloadProgress.fractionCompleted);
        #endif
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
            NSLog(@"数据获取成功");
        #endif
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            successBlock(dictData);//调用代码块
        }else{
            successBlock(responseObject);//调用代码块
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
            NSLog(@"%@",error);
        #endif
        NSRange errorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"401"];
        NSRange serverErrorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"500"];
        if (errorRange.length > 0) { //登录过期,重新登录
            
        }else if (serverErrorRange.length > 0){
            
        }else{
            
        }
    }];
}

/**GET传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息(自定义contentType)*/
+(void)netWorkGetUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock appendContentType:(NSArray *)contentTypeArray{
    //AF - GET网络请求调用
    NSMutableSet * contentTypeSet = [NSMutableSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    if (contentTypeArray.count) {
        [contentTypeSet unionSet:[NSSet setWithArray:contentTypeArray]];
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = contentTypeSet;
    [manager GET:url parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        #if DEBUG
            NSLog(@"获取Progress:%.f",downloadProgress.fractionCompleted);
            progress(downloadProgress.fractionCompleted);
        #endif
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
            NSLog(@"数据获取成功");
        #endif
        if ([responseObject isKindOfClass:[NSData class]]) {
            NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            successBlock(dictData);//调用代码块
        }else{
            successBlock(responseObject);//调用代码块
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
            NSLog(@"%@",error);
        #endif
        NSRange errorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"401"];
        NSRange serverErrorRange = [error.userInfo[@"NSLocalizedDescription"] rangeOfString:@"500"];
        if (errorRange.length > 0) { //登录过期,重新登录
            
        }else if (serverErrorRange.length > 0){
            
        }else{
            
        }
    }];

}


#pragma mark - ==============================POST请求====================================

+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 12;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        #if DEBUG
                NSLog(@"uploadProgress:%.f",uploadProgress.fractionCompleted);
        #endif
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
                NSLog(@"success");
        #endif
        //json转字典类型
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];

}


/**POST传入一个URL路径，进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 12;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        #if DEBUG
                NSLog(@"uploadProgress:%.f",uploadProgress.fractionCompleted);
        #endif
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
                NSLog(@"success");
        #endif
        //json转字典类型
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];

}

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager                     = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    manager.requestSerializer.timeoutInterval         = 12;// 设置超时时间
    manager.responseSerializer                        = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (data.length != 0) {
            /*
             1. 要上传的[二进制数据]
             2. 后台[字段]
             3. 要保存在服务器上的[文件名]
             4. 上传文件的[mimeType]
             */
            //表单内容填充,待会上传表单
            [formData appendPartWithFileData:data name:pramaName fileName:[NSString stringWithFormat:@"%@.%@",pramaName,fileType] mimeType:fileType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //假如要刷新UI控件什么的,可以利用GCD进行刷新进度条控件什么的
        #if DEBUG
                NSLog(@"uploadProgress:%.f",uploadProgress.fractionCompleted);
        #endif
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //json转字典类型
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];
   
}

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 12;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        #if DEBUG
                NSLog(@"uploadProgress:%.f",uploadProgress.fractionCompleted);
        #endif
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
                NSLog(@"success");
        #endif
        //json转字典类型
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];
}

/** @brief POST传入一个URL路径，上传图片文件等,进行数据请求，成功后返回一个data，失败后返回失败信息*/
+(void)netWorkPostUrl:(NSString *)url parameters:(NSDictionary *)parameters data:(NSData *)data dataFieldName:(NSString *)pramaName fileType:(NSString *)fileType progress:(NetworkProgressBlock)progress success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock  appendContentType:(NSArray *)contentTypeArray{
    
    //AF - GET网络请求调用
    NSMutableSet * contentTypeSet = [NSMutableSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
    if (contentTypeArray.count) {
        [contentTypeSet unionSet:[NSSet setWithArray:contentTypeArray]];
    }
    
    AFHTTPSessionManager *manager  = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = contentTypeSet;
    // 设置超时时间
    manager.requestSerializer.timeoutInterval = 12;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        #if DEBUG
                NSLog(@"uploadProgress:%.f",uploadProgress.fractionCompleted);
        #endif
        progress(uploadProgress.fractionCompleted);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        #if DEBUG
                NSLog(@"success");
        #endif
        //json转字典类型
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];
}





#pragma mark - ==============================PUT请求=======================================

/**@brief PUT方式进行提交*/
+(void)netWorkPutUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval         = 12;// 设置超时时间
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager PUT:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];

}

/** @brief delete 方式提交*/
+(void)netWorkDeleteUrl:(NSString *)url parameters:(NSDictionary *)parameters success:(NetworkSuccessBlock)successBlock fail:(NetworkFailBlock)failBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes =  [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
    // 设置超时时间
    manager.requestSerializer.timeoutInterval         = 12;// 设置超时时间
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager DELETE:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock(dictData);//调用代码块
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        #ifdef DEBUG
                NSLog(@"%@",error);
        #endif
    }];
}



#pragma mark - ==============================检测网络状态====================================

//检测网络状态
+(void)netWorkReachAbilitystatus:(NetWorkStatusBlock)statusBlock type:(NetWorkStatusTypeBlock)typeBlock{
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                statusBlock(NO);
                typeBlock(@"NONE");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                statusBlock(YES);
                typeBlock(@"WAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                statusBlock(YES);
                typeBlock(@"WIFI");
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}



#pragma mark - ==============================其他网络任务请求================================

#pragma mark - 下载
// Creating a Download Task
-(void)createDownLoadTask:(NSString *)urlString{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDownloadTask *downloadTask  = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
    NSURL *documentsDirectoryURL  =
        [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
                                               inDomain:NSUserDomainMask appropriateForURL:nil
                                                 create:NO
                                                  error:nil];
        NSURL *returnURL = [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
        return returnURL;
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"File downloaded to: %@", filePath);
    }];
    [downloadTask resume];
}

#pragma mark - 上传
//    Creating an Upload Task
+(void)createUploadTask:(NSString *)filePath andToUrlString:(NSString *)urlString{

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager             = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL                               = [NSURL URLWithString:urlString];
    NSURLRequest *request                    = [NSURLRequest requestWithURL:URL];

    NSURL *filePathURL                       = [NSURL fileURLWithPath:filePath];
    NSURLSessionUploadTask *uploadTask       = [manager uploadTaskWithRequest:request fromFile:filePathURL progress:nil completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"Success: %@ %@", response, responseObject);
        }
    }];
    [uploadTask resume];
}


//    Creating an Upload Task for a Multi-Part Request, with Progress
+(void)createUploadTaskForMultiRequest:(NSString *)filePath andToUrlString:(NSString *)urlString andSuccess:(NetworkSuccessBlock)successBlock andFail:(NetworkFailBlock)failBlock andProgressBlock:(NetworkProgressBlock)progressBlock{

        NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileURL:[NSURL fileURLWithPath:filePath] name:@"file" fileName:@"filename.jpg" mimeType:@"image/jpeg" error:nil];
        } error:nil];

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];

    NSURLSessionUploadTask *uploadTask;
    uploadTask = [manager
                  uploadTaskWithStreamedRequest:request
                  progress:^(NSProgress * _Nonnull uploadProgress) {
                      // This is not called back on the main queue.
                      // You are responsible for dispatching to the main queue for UI updates
                      dispatch_async(dispatch_get_main_queue(), ^{
                          //Update the progress view
                          progressBlock(uploadProgress.fractionCompleted);
                      });
                  }
                  completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                      if (error) {
                          NSLog(@"Error: %@", error);
                      } else {
                          NSLog(@"%@ %@", response, responseObject);
                      }
                  }];
    
    [uploadTask resume];
}

//  Creating a Data Task
+(void)createDataTask:(NSString *)urlString andSuccess:(NetworkSuccessBlock)successBlock andFail:(NetworkFailBlock)failBlock{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else{
            //json转字典类型
            NSDictionary * dictData = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            //调用代码块
            successBlock(dictData);
        }
    }];
    [dataTask resume];
}

//时间字符串做文件名
//            // 可以在上传时使用当前的系统事件作为文件名
//            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//            // 设置时间格式
//            formatter.dateFormat = @"yyyyMMddHHmmss";
//            NSString *str = [formatter stringFromDate:[NSDate date]];
//            NSString *fileName = [NSString stringWithFormat:@"%@.%@", str,photoType];


@end
