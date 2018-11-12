//
//  JCLHttps.m
//  Jincelue_iOS
//
//  Created by 邢昭俊 on 24/10/2016.
//  Copyright © 2016 ruixue. All rights reserved.
//

#import "JCLHttps.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
@implementation JCLHttps
static AFHTTPSessionManager *session;
+ (AFHTTPSessionManager *)session{
    if (!session) {
        session = [AFHTTPSessionManager manager];
        session.requestSerializer = [AFHTTPRequestSerializer serializer];
        session.requestSerializer.timeoutInterval = 10;
        session.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return session;
}

+ (void)getString:(id)url success:(successBlock)success{
    [[self session] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id obj = [[[NSString alloc] initWithData:[self utf8:responseObject] encoding:NSUTF8StringEncoding] componentsSeparatedByString:@"\r\n"];
        !success ? : success(obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestFailed:error];
    }];
}

+ (void)getString:(id)url success:(successBlock)success failure:(failureBlock)failure{
    [[self session] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id obj = [[[NSString alloc] initWithData:[self utf8:responseObject] encoding:NSUTF8StringEncoding] componentsSeparatedByString:@"\r\n"];
        !success ? : success(obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failure ? : failure(error);
    }];
}

+ (void)getJson:(id)url success:(successBlock)success{
    [[self session] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id obj = [NSJSONSerialization JSONObjectWithData:[self utf8:responseObject]
                                                 options:NSJSONReadingAllowFragments
                                                   error:nil];
        !success ? : success(obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestFailed:error];
    }];
}

+ (void)getJson:(id)url success:(successBlock)success failure:(failureBlock)failure{
    [[self session] GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id obj = [NSJSONSerialization JSONObjectWithData:[self utf8:responseObject]
                                                 options:NSJSONReadingAllowFragments
                                                   error:nil];
        !success ? : success(obj);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        !failure ? : failure(error);
    }];
}

+ (void)postJson:(id)url parame:(id)parame success:(successBlock)success{
    [[self session] POST:url parameters:parame progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id obj = [NSJSONSerialization JSONObjectWithData:[self utf8:responseObject]
                                                 options:NSJSONReadingAllowFragments
                                                   error:nil];
        !success ? : success(obj);
     
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self requestFailed:error];
    }];
}

+(NSMutableArray *)splitArrayM:(NSArray *)array begin:(NSInteger)begin end:(NSInteger)end{
    NSMutableArray *arrayM =[[NSMutableArray alloc] init];
    NSArray *split = array;
    split = [split objectsAtIndexes:[[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(begin, end)]];
    for (NSInteger i = 0; i < split.count; i++) {
        NSArray *group = [split[i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
        [arrayM addObject:group];
    }
    return arrayM;
}

+ (NSData *)utf8:(NSData *)data{
    char aa[] = {'A','A','A','A','A','A'};
    NSMutableData *md = [NSMutableData dataWithData:data];
    int loc = 0;
    while(loc < [md length]){
        char buffer;
        [md getBytes:&buffer range:NSMakeRange(loc, 1)];
        if((buffer & 0x80) == 0){
            loc++;
            continue;
        }else if((buffer & 0xE0) == 0xC0) {
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80){
                loc++;
                continue;
            } loc--;
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }else if((buffer & 0xF0) == 0xE0){
            loc++;
            [md getBytes:&buffer range:NSMakeRange(loc, 1)];
            if((buffer & 0xC0) == 0x80){
                loc++;
                [md getBytes:&buffer range:NSMakeRange(loc, 1)];
                if((buffer & 0xC0) == 0x80){
                    loc++;
                    continue;
                } loc--;
            } loc--;
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }else{
            [md replaceBytesInRange:NSMakeRange(loc, 1) withBytes:aa length:1];
            loc++;
            continue;
        }
    }
    return md;
}

+ (void)requestFailed:(NSError *)error{
    switch (error.code) {
        case NSURLErrorNotConnectedToInternet :
            NSLog(@"网络链接失败，请检查网络。");
               // [JCLSVProgressHUD showErrorHud:@"网络链接失败,请检查网络!"];
            break;
        case NSURLErrorTimedOut:
            NSLog(@"访问服务器超时，请检查网络。");
            //[JCLSVProgressHUD showErrorHud:@"访问服务器超时，请检查网络!"];

            break;
            
        case NSURLErrorBadServerResponse :
            //[JCLSVProgressHUD showErrorHud:@"服务器报错了，请稍后再访问!"];
            NSLog(@"服务器报错了，请稍后再访问。");
            break;
        case NSURLErrorCannotConnectToHost:
        {
//            [GCDQueue executeInMainQueue:^{
//                [JCLSVProgressHUD showErrorHud:@"请求超时!"];
//            } afterDelaySecs:1.0f];
        }
            break;
        default:
            break;
    }
    NSLog(@"--------------\n%ld %@",(long)error.code, error.debugDescription);
}

+(void)listenNetworkStatus{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络状态");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                //[JCLObject setupAlert:@"无网络！"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"蜂窝数据网");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"WiFi网络");
                break;
            default:
                break;
        }
    }] ;
}
@end
