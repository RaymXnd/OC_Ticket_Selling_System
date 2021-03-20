//  Cinema.m

#import "Cinema.h"
#define ROW 7
#define COL 15
//定义一个全局变量，保存编号
int selectNo;
@implementation Cinema
//开始购票
-(void)buyTicket{
    NSLog(@"开始购票");
    //显示正在上映的电影
    [self list];
}
//正在上映的电影票
/*
 思路：
 1）利用已有的tickets数组，打印数组信息
 
 2）遍历数组
 */
-(void)list{
    NSLog(@"显示正在上映的电影");
    //定义格式
    //编号 名称
    //主演 开始时间
    //导演 时长
    //上映时间
    //
    for (int i = 0; i<5; i++) {
        NSLog(@"\n\n编号：%d 名称：%@ \n主演：%@ 开始时间：%@ \n导演：%@ 时长：%d\n上映时间：%@\n\n",tickets[i].no,tickets[i].name,tickets[i].actor,tickets[i].startTime,tickets[i].director,tickets[i].longTime,tickets[i].showTime);
    }
    //提示让用户选择影片
    [self selectMovie];
}
//选择电影
-(void)selectMovie{
    NSLog(@"选择影片");
    
    /*
     思路：
     1）定义一个全局变量 保存用户选择的影片编号
     2）提示用户去选择一部电影
     3）接收用户输入的电影编号
     4）保存编号
     */
    printf("请选择要观看的编号:\n");
    int num;
    scanf("%d",&num);
    if(num<0||num>5){
        return;
    }
    selectNo = num;
    NSLog(@"您已经选择了影片：%@\n\n",tickets[selectNo-1].name);
    
    //选择排数
    [self selectRow];
}
//选择排数
-(void)selectRow{
    NSLog(@"选择排数");
    /*
     思路：
     1）把电影院的座位信息都打出来看一下
     2）提示，当前应挺有多少排，每排有多少个座位
     3）提示让用户去选择排数
     4）保存排数信息
     */
    printf("当前影厅共有%d排，每排有%d个座位\n\n",ROW,COL);
    for (int i = -1; i<ROW; i++) {
        for (int j = -1; j<COL; j++) {
            
            if(i == -1){
                printf("%02d\t",j+1);
            }else if(j == -1){
                printf("%02d\t",i+1);
            }else{
                printf("+\t");}
        }
        printf("\n");
    }
    printf("请选择排数\n");
    int num;
    scanf("%d",&num);
    if(num<0||num>7){
        return;
    }
    tickets[selectNo-1].rowNum = num;
    printf("您选择了%d排\n",tickets[selectNo-1].rowNum);
    //选择座位
    [self selectCol];
}
//选择座位号
-(void)selectCol{
    NSLog(@"选择座位");
    printf("请选择座位\n");
    int num;
    scanf("%d",&num);
    if(num<0||num>7){
        return;
    }
    tickets[selectNo-1].colNum = num;
    //把用户当前购买的信息打印出来，让用户确认
    NSLog(@"\n您选择了%@电影 开始时间%@\n第%d排 %d座\n票价是：%.2f",tickets[selectNo-1].name,tickets[selectNo-1].startTime,tickets[selectNo-1].rowNum,tickets[selectNo-1].colNum,tickets[selectNo-1].price);
    
    printf("确认请选择1，0取消选择\n");
    int flag;
    scanf("%d",&flag);
    if (flag) {
        //确认支付
        [self pay];
    }
    
}
//开始支付
-(void)pay{
    NSLog(@"开始支付...");
    NSLog(@"支付完成！");
    //开始出票
    [self print];
}
//出票（打印票）
-(void)print{
    NSLog(@"正在出票...");
    NSLog(@"\n您选择了%@电影 开始时间%@\n第%d排 %d座 %@影厅\n票价是：%.2f",tickets[selectNo-1].name,tickets[selectNo-1].startTime,tickets[selectNo-1].rowNum,tickets[selectNo-1].colNum,tickets[selectNo-1].place,tickets[selectNo-1].price);
    NSLog(@"出票完毕");
    
    //座位表重新打印一下
    for (int i = -1; i<ROW; i++) {
        for (int j = -1; j<COL; j++) {
            //判断是否在表格中显示已经被选择
            //i==rowNum-1 && colNum-1
            if (i == tickets[selectNo-1].rowNum-1 && j == tickets[selectNo-1].colNum-1) {printf("@\t");
            }else if(i == -1){
                printf("%02d\t",j+1);
            }else if(j == -1){
                printf("%02d\t",i+1);
            }else{
                printf("+\t");}
        }
        printf("\n");
    }
    
}
-(instancetype)initWithCinemaName:(NSString *)name{
    if (self = [super init]) {
        //给电影院初始化一个名称
        _cinemaName = name;
        //给电影票的数组初始化
        for (int i = 0; i<5; i++) {
            MovieTicket *mvticket = [MovieTicket new];
            //给对象赋值
            mvticket.name = [NSString stringWithFormat:@"变形金刚%02d",i+1];
            mvticket.longTime = 120;
            mvticket.actor = @"a/b/c";
            mvticket.director = @"zzz";
            mvticket.no = i+1;
            mvticket.showTime = [NSString stringWithFormat:@"200%d-11-11",i+1];
            mvticket.startTime = [NSString stringWithFormat:@"1%d:00",i+1];
            mvticket.price = 9.9;
            mvticket.place = [NSString stringWithFormat:@"影厅%02d",i+1] ;
            //把对象存到数组中
            tickets[i] = mvticket;
        }
    }
    return self;
}
@end
