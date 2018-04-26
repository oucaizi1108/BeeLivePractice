//
//  ViewController.m
//  BeeLivePractice
//
//  Created by oucaizi on 2017/6/29.
//  Copyright © 2017年 oucaizi. All rights reserved.
//

#import "ViewController.h"
#import "BHWatchDog.h"
#import <QuartzCore/QuartzCore.h>
#import <Foundation/Foundation.h>


#if __has_feature(objc_generics)

#define TM_GENERICS(class, ...)  class<__VA_ARGS__>

#else

#define TM_GENERICS(class, ...)  class

#endif

#define TMMutableArrayWith(valueType)                   TM_GENERICS(NSMutableArray, valueType)
#define TMMutableDictionaryWith(keyType,valueType)      TM_GENERICS(NSMutableDictionary,keyType,valueType)

@interface ViewController ()

@property (nonatomic, strong) TMMutableArrayWith(NSString *) *identifiers;
@property (nonatomic, strong) TMMutableDictionaryWith(NSString *, NSNumber *) *timeDataDic;
@property (nonatomic, strong)  NSMutableDictionary<NSString *,NSNumber *> *  dic;

@end

@implementation ViewController

#pragma mark -- Lazy Intializer

-(TMMutableArrayWith(NSString *) *)identifiers
{
    if (!_identifiers) {
        _identifiers = [TMMutableArrayWith(NSString*) new];
    }
    return _identifiers;
}

-(TMMutableDictionaryWith(NSString *, NSNumber *) *)timeDataDic
{
    if (!_timeDataDic)
    {
        _timeDataDic = [TMMutableDictionaryWith(NSString *, NSNumber *) new];
    }
    return _timeDataDic;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *image = [[UIImageView alloc] init];
    [self.view addSubview:image];

    NSLog(@"%f",CACurrentMediaTime());
    
    self.dic = [NSMutableDictionary dictionary];

//    [[BHWatchDog alloc] initWithThreshold:3 strictMode:YES];
    NSLog(@"==%@",[[BHWatchDog alloc] initWithThreshold:3 strictMode:NO]);
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
