//
//  AppDelegate.m
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import "AppDelegate.h"
#import "ChatsViewController.h"
#import "ContactsViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    UIColor *testColor1 = [UIColor colorWithRed:82 / 255.0 green:183 / 255.0 blue:55 / 255.0 alpha:1];
    tabBarController.tabBar.tintColor = testColor1;
    self.window.rootViewController = tabBarController;

    ChatsViewController *chatsViewController = [[ChatsViewController alloc] init];
    ContactsViewController *contactsViewController = [[ContactsViewController alloc] init];
    DiscoverViewController *discoverViewController = [[DiscoverViewController alloc] init];
    MeViewController *meViewController = [[MeViewController alloc] init];

    chatsViewController.navigationItem.title = @"WeChat";
    contactsViewController.navigationItem.title = @"Contacts";
    discoverViewController.navigationItem.title = @"Discover";
    meViewController.navigationItem.title = @"Me";

    chatsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Chats" image:[UIImage imageNamed:@"Chats.png"] tag:0];
    contactsViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Contacts" image:[UIImage imageNamed:@"Contacts.png"] tag:1];
    discoverViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Discover" image:[UIImage imageNamed:@"Discover.png"] tag:2];
    meViewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Me" image:[UIImage imageNamed:@"Me.png"] selectedImage:[UIImage imageNamed:@"Me_selected.png"]];

    UINavigationController *chatsNav = [[UINavigationController alloc] initWithRootViewController:chatsViewController];
    UINavigationController *contactsNav = [[UINavigationController alloc] initWithRootViewController:contactsViewController];
    UINavigationController *discoverNav = [[UINavigationController alloc] initWithRootViewController:discoverViewController];
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:meViewController];

    chatsViewController.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    contactsViewController.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    discoverViewController.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    meViewController.navigationController.navigationBar.barStyle = UIBarStyleBlack;

    [tabBarController addChildViewController:chatsNav];
    [tabBarController addChildViewController:contactsNav];
    [tabBarController addChildViewController:discoverNav];
    [tabBarController addChildViewController:meNav];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.

}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.

}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end