//
//  mtsMutableArray.m
//  MultiThreadSafe
//
//  Created by lining03 on 2017/12/18.
//  Copyright © 2017年 biubiu. All rights reserved.
//

#import "mtsMutableArray.h"

@implementation mtsMutableArray
- (id)init
{
    self = [super init];
    if (self)
    {
        self.mtsContainer = [NSMutableArray array];
    }
    return self;
}
@end
