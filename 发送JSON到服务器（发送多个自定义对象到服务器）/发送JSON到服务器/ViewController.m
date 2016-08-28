//
//  ViewController.m
//  发送JSON到服务器
//
//  Created by mac on 16/8/27.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self jsonDemo];
}

//生成json数据
-(void)jsonDemo
{
    //生成字典
     NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"占当年1" forKey:@"name"];
     NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"占当年2" forKey:@"name"];
//把这两个字典放到数组中
    NSArray *dictArr = @[dict1,dict2];
    //把数组序列化为json格式的二进制
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictArr options:0 error:NULL];
    
    [self postJSONToServer:jsonData];
    
}
//：如何把多个自定义的对象，发送到服务器？？？？
//1.先转换成字典，
//2.再放到数组
//3.然后再把数组进行JSON序列化，得到二进制数据，然后把数据传递到发送json到服务器的主方法

//发送json到服务器的主方法
-(void)postJSONToServer:(NSData*)jsonData
{
    //uRL
    NSURL *url =[NSURL URLWithString:@"http://localhost/php/upload/postjson.php"];
    //requestM
    NSMutableURLRequest *requestM = [NSMutableURLRequest requestWithURL:url];
    requestM.HTTPMethod = @"POST";
    //设置请求体
    requestM.HTTPBody = jsonData;
    //session发起和启动
    [[[NSURLSession sharedSession]dataTaskWithRequest:requestM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil &&data !=nil) {
            //NSString* result = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            NSString* result =[[NSString alloc]initWithData:data
        encoding:NSUTF8StringEncoding];
            NSLog(@"%@",result);
        }else {
            NSLog(@"%@",error);
        }
    }]resume];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
