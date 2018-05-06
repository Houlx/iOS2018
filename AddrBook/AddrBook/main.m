//
//  main.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <BmobSDK/Bmob.h>

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NSString *appKey = @"381f45436aabb971eadd32ec2470cf3a";
        [Bmob registerWithAppKey:appKey];
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
