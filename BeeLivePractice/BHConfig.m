//
//  BHConfig.m
//  BeeLivePractice
//
//  Created by oucaizi on 2017/6/29.
//  Copyright © 2017年 oucaizi. All rights reserved.
//

#import "BHConfig.h"
#import "BHCommon.h"

@interface BHConfig()

@property(nonatomic,strong) NSMutableDictionary * config;

@end

@implementation BHConfig

+(instancetype)shareInstance
{
    static BHConfig *config = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[self alloc] init];
    });
    return config;
}

+(id)get:(NSString*)key
{
    if (![BHConfig shareInstance].config)
    {
        NSException * exception = [NSException exceptionWithName:@"ConfigNotInitialize" reason:@"Config Not Initialize" userInfo:nil];
        @throw exception;
        return nil;
    }
    else
    {
        id v = [[BHConfig shareInstance].config objectForKey:key];
        if (!v)
        {
            BHLog(@"InvaildKeyValue %@ is nil", key);
        }
        return v;
    }
}

+ (BOOL)has:(NSString *)key
{
    if (![BHConfig shareInstance].config)
    {
        return NO;
    }
    else
    {
        if (![[BHConfig shareInstance].config objectForKey:key]) {
            return NO;
        }
        else
            return YES;
    }
}

+ (void)add:(NSDictionary *)parameters
{
    if (![BHConfig shareInstance].config)
    {
        [BHConfig shareInstance].config = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    [[BHConfig shareInstance].config addEntriesFromDictionary:parameters];
}

+ (NSDictionary *) getAll
{
    return [BHConfig shareInstance].config;
}

+ (NSString *)stringValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return nil;
    }
     return (NSString *)[[BHConfig shareInstance].config objectForKey:key];
}

+ (NSDictionary *)dictionaryValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return nil;
    }
    
    if (![[[BHConfig shareInstance].config objectForKey:key] isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    return (NSDictionary *)[[BHConfig shareInstance].config objectForKey:key];
}

+ (NSArray *)arrayValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return nil;
    }
    
    if (![[[BHConfig shareInstance].config objectForKey:key] isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    return (NSArray *)[[BHConfig shareInstance].config objectForKey:key];
}

+ (NSInteger)integerValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return 0;
    }
    
    return [[[BHConfig shareInstance].config objectForKey:key] integerValue];
}

+ (float)floatValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return 0.0;
    }
    
    return [(NSNumber *)[[BHConfig shareInstance].config objectForKey:key] floatValue];
}

+ (BOOL)boolValue:(NSString *)key
{
    if (![BHConfig shareInstance].config) {
        return NO;
    }
    
    return [(NSNumber *)[[BHConfig shareInstance].config objectForKey:key] boolValue];
}

+ (void)set:(NSString *)key value:(id)value
{
    if (![BHConfig shareInstance].config) {
        [BHConfig shareInstance].config = [[NSMutableDictionary alloc] initWithCapacity:10];
    }
    
    [[BHConfig shareInstance].config setObject:value forKey:key];
}


+ (void)set:(NSString *)key boolValue:(BOOL)value
{
    [self set:key value:[NSNumber numberWithBool:value]];
}

+ (void)set:(NSString *)key integerValue:(NSInteger)value
{
    [self set:key value:[NSNumber numberWithInteger:value]];
}


+ (void)set:(NSString *)key floatValue:(CGFloat)value
{
    [self set:key value:[NSNumber numberWithFloat:value]];
}

+ (void)clear
{
    if ([BHConfig shareInstance].config) {
        [[BHConfig shareInstance].config removeAllObjects];
    }
}

@end
