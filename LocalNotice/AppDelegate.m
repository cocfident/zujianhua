//
//  AppDelegate.m
//  LocalNotice
//
//  Created by Chongzi on 2017/6/7.
//  Copyright © 2017年 Chongzi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    
    
    
    // 只有 iOS8 and later 才需要
    if ([[UIApplication sharedApplication]     respondsToSelector:@selector(registerForRemoteNotifications)]) {
        // 这里 types 可以自定义，如果 types 为 0，那么所有的用户通知均会静默的接收，系统不会给用户任何提示(当然，App 可以自己处理并给出提示)
        UIUserNotificationType types = (UIUserNotificationType) (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert);
        // 这里 categories 可暂不深入，本文后面会详细讲解。
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        // 当应用安装后第一次调用该方法时，系统会弹窗提示用户是否允许接收通知
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    }
    
    
    
    return YES;
}
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"localNotice" object:nil];

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
