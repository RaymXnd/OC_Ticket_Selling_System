//
//  Ticket.h
//  OC6-购票系统
//
//  Created by Raymond on 2/9/17.
//  Copyright © 2017 Raymond. All rights reserved.
//

#import "Common.h"

@interface Ticket : Common
//排数
@property int rowNum;
//座位号
@property int colNum;
//地点
@property NSString *place;
//开始时间
@property NSString *startTime;
//打印票的信息
-(void)printTicket;
@end
