//
//  ViewController.m
//  TeccentSonicDemo
//
//  Created by BillBo on 2017/8/9.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"

#import "WebViewController.h"

static NSString *testUrlString = @"http://mc.vip.qq.com/demo/indexv3?offline=1";

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sonic" style:UIBarButtonItemStylePlain target:self action:@selector(webVC)];
    
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    
}

- (void)webVC {
    
    WebViewController *webVC = [[WebViewController alloc] initWithUrl:testUrlString];
    
    webVC.title = @"测试加载网页";
    
    [self.navigationController pushViewController:webVC animated:YES];
    
}


@end
