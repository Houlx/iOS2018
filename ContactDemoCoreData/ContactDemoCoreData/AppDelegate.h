//
//  AppDelegate.h
//  
//
//  Created by 侯凌霄 on 2018/4/2.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

