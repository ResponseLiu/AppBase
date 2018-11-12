//
//  JCLHttps.h
//  Jincelue_iOS
//
//  Created by 刘虎超 on 24/10/2016.
//  Copyright © 2016 ruixue. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^successBlock) (id obj);
typedef void (^failureBlock) (NSError *error);

@interface JCLHttps : NSObject
+(void)listenNetworkStatus;
+(void)getString:(id)url success:(successBlock)success;
+(void)getString:(id)url success:(successBlock)success failure:(failureBlock)failure;
+(void)getJson:(id)url success:(successBlock)success;
+(void)getJson:(id)url success:(successBlock)success failure:(failureBlock)failure;
+(void)getXml:(id)url success:(successBlock)success;
+(void)postJson:(id)url parame:(id)parame success:(successBlock)success;
+(NSMutableArray *)splitArrayM:(NSArray *)array begin:(NSInteger)begin end:(NSInteger)end;
+ (NSData *)utf8:(NSData *)data;
@end
