//
//  UserData.m
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "UserData.h"

@implementation UserData
-(void)encodeWithCoder:(NSCoder *)coder{ [self encodeWithObject:self class:[self class] coder:coder]; }
-(id)initWithCoder:(NSCoder *)coder{
    if (self = [super init]) { [self decodeWithObject:self class:[self class] coder:coder]; } return self;
}

-(void)encodeWithObject:(NSObject *)obj class:(Class)class coder:(NSCoder *)coder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([class class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [coder encodeObject:[obj valueForKeyPath:key] forKey:key];
    }
}

-(void)decodeWithObject:(NSObject *)obj class:(Class)class coder:(NSCoder *)coder{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([class class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *key = [NSString stringWithUTF8String:name];
        [obj setValue:[coder decodeObjectForKey:key] forKey:key];
    }
}

+ (instancetype)accountWithDict:(NSDictionary *)dict{
    UserData *account = [[self alloc] init]; [account setValuesForKeysWithDictionary:dict];
    return account;
}

+(void)saveUserInfo:(UserData *)model{
    [NSKeyedArchiver archiveRootObject:model toFile:CachesFile(User)]; }
+(UserData *)getUserInfo{
    UserData *info = [NSKeyedUnarchiver unarchiveObjectWithFile:CachesFile(User)];
    return info;
}
@end
