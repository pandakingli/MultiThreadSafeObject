//
//  mtsMutableArray.h
//  MultiThreadSafe
//
//  Created by lining03 on 2017/12/18.
//  Copyright © 2017年 biubiu. All rights reserved.
//

#import "MultiThreadSafeObject.h"

@protocol mtsMutableArrayProtocol

@optional
- (id)lastObject;
- (id)objectAtIndex:(NSUInteger)index;
- (NSUInteger)count;

- (void)addObject:(id)anObject;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeLastObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject;

@end

@interface mtsMutableArray : MultiThreadSafeObject<mtsMutableArrayProtocol>

@end
