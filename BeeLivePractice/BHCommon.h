//
//  BHCommon.h
//  BeeLivePractice
//
//  Created by oucaizi on 2017/6/29.
//  Copyright © 2017年 oucaizi. All rights reserved.
//

#ifndef BHCommon_h
#define BHCommon_h

// Debug Logging
#ifdef DEBUG
#define BHLog(x, ...) NSLog(x, ## __VA_ARGS__);
#else
#define BHLog(x, ...)
#endif


#endif /* BHCommon_h */
