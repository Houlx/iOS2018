//
//  AppDelegate.h
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <BmobSDK/BmobQuery.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property(nonatomic, strong) UIWindow *window;
@property(readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

