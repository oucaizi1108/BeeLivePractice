//
//  BHConfig.h
//  BeeLivePractice
//
//  Created by oucaizi on 2017/6/29.
//  Copyright © 2017年 oucaizi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BHConfig : NSObject

+(instancetype)shareInstance;

+(id)get:(NSString*)key;

+ (BOOL)has:(NSString *)key;

+ (void)add:(NSDictionary *)parameters;

+ (NSMutableDictionary *)getAll;

+ (NSString *)stringValue:(NSString *)key;

+ (NSDictionary *)dictionaryValue:(NSString *)key;

+ (NSInteger)integerValue:(NSString *)key;

+ (float)floatValue:(NSString *)key;

+ (BOOL)boolValue:(NSString *)key;

+ (NSArray *)arrayValue:(NSString *)key;

+ (void)set:(NSString *)key value:(id)value;

+ (void)set:(NSString *)key boolValue:(BOOL)value;

+ (void)set:(NSString *)key integerValue:(NSInteger)value;

+ (void)set:(NSString *)key floatValue:(CGFloat)value;

+ (void)clear;


@end
