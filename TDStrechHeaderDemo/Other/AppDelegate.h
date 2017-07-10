//
//  AppDelegate.h
//  TDStrechHeaderDemo
//
//  Created by 唐都 on 2017/7/10.
//  Copyright © 2017年 com.tagdu.bigtang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

