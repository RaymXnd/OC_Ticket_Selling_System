//
//  Cinema.h
//  OC6-购票系统
//
//  Created by Raymond on 2/9/17.
//  Copyright © 2017 Raymond. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MovieTicket.h"
@interface Cinema : NSObject
{
    NSString *_cinemaName;//电影院名称
    
    //票的集合
    MovieTicket *tickets[5];//五张电影票的对象
    
}

//开始购票
-(void)buyTicket;
//正在上映的电影票
-(void)list;
//选择电影
-(void)selectMovie;
//选择排数
-(void)selectRow;
//选择座位号
-(void)selectCol;
//开始支付
-(void)pay;
//出票（打印票）
-(void)print;
-(instancetype)initWithCinemaName:(NSString *)name;

@end
