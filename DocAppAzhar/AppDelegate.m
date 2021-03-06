//
//  AppDelegate.m
//  DocAppAzhar
//
//  Created by MacMini1 on 4/25/16.
//  Copyright © 2016 MacMini1. All rights reserved.
//

#import "AppDelegate.h"
#import "IBDataManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[IBDataManager getInstance] getAcessToken:@"https://dev1.intbittech.com/DocAppAPI-1.0/api/oauth/token?username=admin&password=admin&grant_type=password" onSuccess:^(NSData *data) {
        
                NSString* myString;
                myString = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
                NSLog(@"data is : %@", myString);

        NSDictionary *dictionary  = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        self.accessToken = [[NSMutableString alloc] initWithFormat:@"%@ %@",[dictionary objectForKey:@"token_type"],[dictionary objectForKey:@"access_token"]];
        NSLog(@"Acesstoken is %@",self.accessToken);
    } onError:^(NSError *error) {
        NSLog(@"Error is %@",error);
    }];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
