//
//  AppDelegate.m
//  CWZPageViewController
//
//  Created by cwz on 16/11/27.
//  Copyright © 2016年 cwz. All rights reserved.
//

#import "AppDelegate.h"
#import "CWZPageViewController.h"
#import "ViewController.h"
@interface AppDelegate ()
//commit 1
//commit 2
@end
////commit 3
////commit 4
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //master分支修改
    //test分支修改
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
     ViewController *VC1 = [[ViewController alloc] init];
    VC1.titleStr = @"vc1";
    VC1.color = [UIColor greenColor];
    
    ViewController *VC2 = [[ViewController alloc] init];
    VC2.titleStr = @"vc2";
    VC2.color = [UIColor blueColor];
    
    ViewController *VC3 = [[ViewController alloc] init];
    VC3.titleStr = @"vc3";
    VC3.color = [UIColor brownColor];
    
    ViewController *VC4 = [[ViewController alloc] init];
    VC4.titleStr = @"vc4";
    VC4.color = [UIColor whiteColor];
    
    ViewController *VC5 = [[ViewController alloc] init];
    VC5.titleStr = @"vc5";
    VC5.color = [UIColor darkGrayColor];
    
    ViewController *VC6 = [[ViewController alloc] init];
    VC6.titleStr = @"vc6";
    VC6.color = [UIColor blackColor];
    
    ViewController *VC7 = [[ViewController alloc] init];
    VC7.titleStr = @"vc7";
    VC7.color = [UIColor purpleColor];
    
    ViewController *VC8 = [[ViewController alloc] init];
    VC8.titleStr = @"vc8";
    VC8.color = [UIColor blackColor];
    
    ViewController *VC9 = [[ViewController alloc] init];
    VC9.titleStr = @"vc9";
    VC9.color = [UIColor darkGrayColor];
    
    ViewController *VC10 = [[ViewController alloc] init];
    VC10.titleStr = @"vc10";
    VC10.color = [UIColor purpleColor];
    
    CWZPageViewController *pageVc =  [CWZPageViewController instanceControllers:@[VC1,VC2,VC3,VC4,VC5,VC6,VC7,VC8,VC9,VC10] andTitles:@[@"title1111111",@"title22",@"title333333",@"title44",@"title5555",@"title66",@"title777777",@"title888",@"title999",@"title10010101001"]];
    [self.window setRootViewController:pageVc];
    
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

///222222


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//master-2

@end
