//
//  MultiThreadSafeObject.m
//  MultiThreadSafe
//
//  Created by lining03 on 2017/12/18.
//  Copyright © 2017年 biubiu. All rights reserved.
//

#import "MultiThreadSafeObject.h"

@implementation MultiThreadSafeObject
- (id)init
{
    self = [super init];
    if (self)
    {
        _mtsDispatchQueue = dispatch_queue_create("COM.MTS.MultiThreadSafeObject", NULL);
    }
    return self;
}

- (void)dealloc
{
    _mtsDispatchQueue = nil;
    _mtsContainer = nil;
}

#pragma mark - method over writing
- (NSString *)description
{
    return _mtsContainer.description;
}

#pragma mark - public method
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    return [[_mtsContainer class] instanceMethodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSMethodSignature *sig = [anInvocation valueForKey:@"_signature"];
    
    const char *returnType = sig.methodReturnType;
    //NSLog(@"%@ = > %@",anInvocation.target, NSStringFromSelector(anInvocation.selector));
    //NSLog(@"%s",returnType);
    
    if (!strcmp(returnType, "v"))
    {
        //没有返回值 setter方法 异步barrier
        /** the setter method just use async dispatch
         remove the barrier to make it faster when u r sure that invacations will not affect each other
         */
        dispatch_barrier_async(_mtsDispatchQueue, ^{
            [anInvocation invokeWithTarget:_mtsContainer];
        });
    }
    else
    {
        //有返回值 getter方法 同步barrier
        /** all getter method need sync dispatch
         barrier make sure the result is correct
         getter method need barrier in most ways unless u dont except this */
        
        dispatch_barrier_sync(_mtsDispatchQueue, ^{
            [anInvocation invokeWithTarget:_mtsContainer];
        });
    }
}
@end
