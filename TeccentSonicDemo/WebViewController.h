//
//  WebViewController.h
//  TeccentSonicDemo
//
//  Created by BillBo on 2017/8/10.
//  Copyright © 2017年 BillBo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Sonic/Sonic.h>

@interface WebViewController : UIViewController<SonicSessionDelegate,UIWebViewDelegate>

- (instancetype)initWithUrl:(NSString *)aUrl;


@end
