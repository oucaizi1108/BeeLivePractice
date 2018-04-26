//
//  BHWatchDog.h
//  BeeLivePractice
//
//  Created by oucaizi on 2017/6/29.
//  Copyright © 2017年 oucaizi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BHWatchDog : NSObject

- (instancetype)initWithThreshold:(double)threshold strictMode:(BOOL)strictMode;

@end
