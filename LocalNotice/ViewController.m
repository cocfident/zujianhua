//
//  ViewController.m
//  LocalNotice
//
//  Created by Chongzi on 2017/6/7.
//  Copyright © 2017年 Chongzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    NSString *dateStr = @"2017-06-07 15:00:00";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate * date = [formatter dateFromString:dateStr];
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.repeatInterval = NSCalendarUnitDay;
    NSDictionary *dic = @{@"activityId":@"123"};
    notification.userInfo = dic;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localNotic) name:@"localNotice" object:nil];
    
    
}

- (void)localNotic{
    self.view.backgroundColor = [UIColor redColor];
}

- (void)addLocalNoticeWithDate:(NSString *)dateStr type:(NSString *)type{
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate * date = [formatter dateFromString:dateStr];
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = date;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.soundName = UILocalNotificationDefaultSoundName;
    notification.repeatInterval = NSCalendarUnitDay;
    NSDictionary *dic = @{@"type":type};
    notification.userInfo = dic;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

@end
