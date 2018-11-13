//
//  AccountModel.h
//  AppBaseWork
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountModel : NSObject
@property(nonatomic,assign)double number;
@property(nonatomic,assign)double price;
@property(nonatomic,strong)NSString * name;
@end

NS_ASSUME_NONNULL_END
