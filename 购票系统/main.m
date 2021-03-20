//
//  main.m
//  购票系统
//
//  Created by Raymond on 2/9/17.
//  Copyright © 2017 Raymond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cinema.h"
void buyMovieTicket(){
    //调用电影院类中的buyTicket方法
    Cinema *cinema = [[Cinema alloc]initWithCinemaName:@"万达影院"];
    [cinema buyTicket];
}

void buySongTicket(){
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //打印欢迎信息
        printf("*********欢迎使用购票系统***********\n");
        //提示用户去选择
        printf("您可以使用购票系统购买 1电影票    2演唱会票\n");
        int num;
        scanf("%d",&num);
        //当用户选择不同的功能，调用不同的函数
        if(num == 1){
            //在函数中创建对象，开始购票
            buyMovieTicket();
        }else if(num == 2){
            buySongTicket();
        }
      
    }
    return 0;
}
