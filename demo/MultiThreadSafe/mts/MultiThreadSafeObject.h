//
//  MultiThreadSafeObject.h
//  MultiThreadSafe
//
//  Created by lining03 on 2017/12/18.
//  Copyright © 2017年 biubiu. All rights reserved.
//

/** this class makes Non-thread-safe object works like thread-safe object
 a little loss of performance may cause when u using this class to operating an object
 u can inherit this class and override the rule of dispathing to improve the performance
 in some situation it will work batter than the origin class
 */

#import <Foundation/Foundation.h>

@interface MultiThreadSafeObject : NSObject
{
    dispatch_queue_t _mtsDispatchQueue;
    NSObject *_mtsContainer;
}
@property (nonatomic, strong) NSObject *mtsContainer;
@end
