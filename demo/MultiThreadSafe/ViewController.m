//
//  ViewController.m
//  MultiThreadSafe
//
//  Created by lining03 on 2017/12/18.
//  Copyright © 2017年 biubiu. All rights reserved.
//

#import "ViewController.h"
#import "mtsMutableArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    mtsMutableArray *ary = [[mtsMutableArray alloc] init];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 10;
    
    for (int i = 0; i < 200; i++)
    {
        NSNumber *number = [NSNumber numberWithInt:i];
        [queue addOperationWithBlock:^{
            [ary addObject:number];
        }];
    }
    [queue waitUntilAllOperationsAreFinished];
    
    NSLog(@"%ld",(long)ary.count);
    NSLog(@"%@",ary);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
