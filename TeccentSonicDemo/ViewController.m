//
//  ViewController.m
//  TeccentSonicDemo
//
//  Created by BillBo on 2017/8/9.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import <Sonic/Sonic.h>


@interface ViewController ()

@property (nonatomic, strong) WKWebView *wkWebV;

@property (nonatomic,strong) NSString *url;

@end

@implementation ViewController

- (instancetype)initWithUrl:(NSString *)aUrl{
    
    if (self = [super init]) {
        
        self.url = aUrl;
        //在初始化ViewController的时候发起sonic的请求
        //使用sonic链接创建一个会话
        [[SonicClient sharedClient] createSessionWithUrl:self.url withWebDelegate:self];
    }
    
    return self;
    
}

- (void)loadView{
    
    [super loadView];
   
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    
    configuration.allowsInlineMediaPlayback = NO;
    
    self.wkWebV = [[WKWebView alloc] initWithFrame:self.view.bounds configuration:configuration];
    
    [self.view addSubview:self.wkWebV];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
    
    /*
     * 查询当前ViewController是否成功创建sonic会话，如果已经创建，那么包装request成sonic请求，以便在NSURLProtocol层拦截
     * 否则走正常模式加载请求，不会在NSURLProtocol层拦截
     */
    if ([[SonicClient sharedClient] sessionWithWebDelegate:self]) {
        [self.wkWebV loadRequest:sonicWebRequest(urlRequest)];
    }else{
        [self.wkWebV loadRequest:urlRequest];
    }
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

#pragma mark - SonicSessionDelegate

/**
 * @brief Sonic session call the delegate to reload request
 sonic要求webView重新load指定request

 */
- (void)session:(SonicSession *)session requireWebViewReload:(NSURLRequest *)request {
 
    [self.wkWebV loadRequest:request];

}

/**
 * @brief Sonic request will be sent, you can do some custom actions, e.g. add custom header fields, set cookie etc.
 sonic请求发起前回调
 
 */
- (void)sessionWillRequest:(SonicSession *)session {
    
    //可以在请求发起前同步Cookie等信息
    NSLog(@"请求发起前!");
    
}

- (void)dealloc{
    
    [[SonicClient sharedClient] removeSessionWithWebDelegate:self];
    
}

@end
