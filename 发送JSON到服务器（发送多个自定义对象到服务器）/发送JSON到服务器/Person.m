//
//  Person.m
//  发送JSON到服务器
//
//  Created by mac on 16/8/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    NSString *_age;
}
-(NSString *)description
{
    return [NSString stringWithFormat:@"%@-%@",self.name,_age];
}
@end
