//
//  HJPrinterDemoViewController.m
//  PrinterDemo
//
//  Created by doulai on 9/15/15.
//  Copyright (c) 2015 com.cmcc. All rights reserved.
//

#import "HJPrinterDemoViewController.h"
//#import "PrinterListViewController.h"
#import "PrinterSDK.h"
//#import "PrinterSDK.h"
#import "FormatSettingTableViewController.h"
#import "PrinterListViewController.h"

@interface HJPrinterDemoViewController ()

@end

@implementation HJPrinterDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //读取打印机设置内容
    //    NSDictionary *setting = [PrinterWraper getPrinterSetting];
    
    //    NSMutableDictionary *newsetting=[NSMutableDictionary dictionaryWithDictionary:setting];
    //    [newsetting setObject:@1 forKey:@"showconfigure"];//sdk自带打印机配置
    
    //    [PrinterWraper setPrinterSetting:newsetting];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
- (IBAction)print:(NSString *)jsonString{
    
#warning 请确保本身的navigationController是有效的
#warning 工程的General->Embedded Binaries  + PrinterSdk.framework
#warning 请试用真机 否则会有编译错误
    
    //设置格式 大字体 行间距28 局中
    [PrinterWraper setPrintFormat:3 LineSpace:28 alinment:1 rotation:0];// 3 大字体  ，28默认行间距,1局中对齐
    
    //打印标题
    [PrinterWraper addPrintText:@"金百万微站＊2160\n"];//打印文字
    //设置标题的格式
    [PrinterWraper setPrintFormat:1 LineSpace:28 alinment:0 rotation:0];// 1 小字体  ，28默认行间距,0左对齐
    
    //打印副标题
    [PrinterWraper addPrintText:@"U味儿  客服电话: 4006-597-597\n"];//打印文字
    
    //设置副标题的格式
    [PrinterWraper setPrintFormat:1 LineSpace:28 alinment:0 rotation:0];// 1 小字体  ，28默认行间距,0左对齐
    
    //打印副标题
    [PrinterWraper addPrintText:@"********************************\n"];//打印文字
    
    
    NSArray *headers =@[@"菜单",@"单价",@"数量"];
    NSArray *values0 =@[@"黑米糕",@"14",@"X1"];
    NSArray *values1 =@[@"新派奥尔良鸡翅",@"88",@"X5"];
    NSArray *values2 =@[@"香煎藕夹",@"18",@"X8"];
    NSArray* body =@[headers,values0,values1,values2];
    
    
    //打印商品列表，会自动排版，要求数组长度一致，空白地方用@""
    [PrinterWraper addItemLines:body];
    
    
    //设置格式 大字体 行间距28 局中
    [PrinterWraper setPrintFormat:3 LineSpace:28 alinment:1 rotation:0];// 3 大字体  ，28默认行间距,1局中对齐
    
    NSString *str = @"合计: ¥53\n";
    
    NSString *utfStr = [[NSString alloc] initWithData:[str dataUsingEncoding:NSUTF8StringEncoding] encoding:NSUTF8StringEncoding];
    
    //打印标题
    [PrinterWraper addPrintText:utfStr];//打印文字
    
    //设置副标题的格式
    [PrinterWraper setPrintFormat:1 LineSpace:28 alinment:0 rotation:0];// 1 小字体  ，28默认行间距,0左对齐
    
    //打印副标题
    [PrinterWraper addPrintText:@"********************************\n"];//打印文字
    
    NSArray *values0_1 =@[@"订单类型:",@"半成品"];
    NSArray *values1_1 =@[@"订单渠道:",@"微站"];
    NSArray *values2_1 =@[@"服务品牌:",@"金百万"];
    NSArray *values3_1 =@[@"服务门店:",@"金百万（正运通店）"];
    NSArray *values4_1 =@[@"门店电话:",@"010-60592926"];
    NSArray *values5_1 =@[@"下单时间:",@"2016-04－10 09:41:32"];
    NSArray *values6_1 =@[@"送餐时间:",@"预定[2016-04-10 12:00-12:30]"];
    NSArray *values7_1 =@[@"支付方式:",@"现金支付"];
    NSArray* body_1 =@[values0_1,values1_1,values2_1,values3_1,values4_1,values5_1,values6_1,values7_1];
    
    
    //打印商品列表，会自动排版，要求数组长度一致，空白地方用@""
    [PrinterWraper addItemLines:body_1];
    
    //设置副标题的格式
    [PrinterWraper setPrintFormat:1 LineSpace:28 alinment:0 rotation:0];// 1 小字体  ，28默认行间距,0左对齐
    
    //打印副标题
    [PrinterWraper addPrintText:@"********************************\n"];//打印文字
    
    
    
    [PrinterWraper addPrintText:@"抓饭的 先生\n18310956585\n北京市通州区正运通酒店发\n"];
    
    //打印副标题
    [PrinterWraper addPrintText:@"********************************\n"];//打印文字
    
    //打印副标题
    [PrinterWraper addPrintText:@"骑士签名:"];
    
    
    //打印二维码
    //    [PrinterWraper addPrintBarcode:@"http://www.baidu.com" isTwoDimensionalCode:1];//二维码
    ////    打印一维码
    //    [PrinterWraper addPrintBarcode:@"123456789012" isTwoDimensionalCode:0];//1维码
    //    [PrinterWraper addPrintBarcode:@"123456789013" isTwoDimensionalCode:0];//1维码
    
    
    [PrinterWraper addPrintText:@"\n\n"];//打印文字
    //    开始启动打印
    //    [PrinterWraper startPrint:self.navigationController];
    
    BOOL res=   [PrinterWraper startPrint:nil];
    
//    if (!res) {
//        PrinterListViewController *detail=[[PrinterListViewController alloc] init];
//        //        detail.taskmodel =model;
//        [self.navigationController pushViewController:detail animated:YES];
//        
//        
//    }
    
}


- (IBAction)choosePrinter:(id)sender {
    
    PrinterListViewController *detail=[[PrinterListViewController alloc] init];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}
- (IBAction)confiurePrinter:(id)sender {
    
    FormatSettingTableViewController *detail =[[FormatSettingTableViewController alloc] init];
    
    [self.navigationController pushViewController:detail animated:YES];
    
}


@end
