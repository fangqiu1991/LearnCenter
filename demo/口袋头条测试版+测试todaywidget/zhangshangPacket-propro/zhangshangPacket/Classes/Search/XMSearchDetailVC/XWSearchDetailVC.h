//
//  XWSearchDetailVC.h
//  zhangshangPacket
//
//  Created by apple on 2017/5/27.
//  Copyright © 2017年 apple-fangqiu. All rights reserved.
//

#import "XWBaseVC.h"
#import <WebKit/WebKit.h>

@interface XWSearchDetailVC : XWBaseVC



@property(nonatomic, copy)NSString *url;

@property (nonatomic, assign) int docid;

@property (nonatomic, assign) int artid;

@property (nonatomic, assign) int articid;

@property (nonatomic, strong) NSString *titleStr;

@property (nonatomic, strong) NSString *urlStr;

@property (nonatomic, assign) NSInteger isAd;

@property (nonatomic, strong) NSString *imageStr;




@end
