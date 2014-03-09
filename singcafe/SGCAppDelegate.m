//
//  SGCAppDelegate.m
//  singcafe
//
//  Created by ojimac on 9/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import "SGCAppDelegate.h"

// Vendor
#import <GoogleMaps/GoogleMaps.h>
#import <Parse/Parse.h>

@implementation SGCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeSound |
                                                    UIRemoteNotificationTypeAlert |
                                                    UIRemoteNotificationTypeBadge];

    // Parse
    [Parse setApplicationId:@"vtExHhLBTzibQPGmpp4y11EYgpUlX45yvqE7rcm7"
                  clientKey:@"XyjSE15GQ22ST9SdDzcvEkxemGihjHVJ5hkSoKNR"];

    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];

    // Google Maps
    [GMSServices provideAPIKey:@"AIzaSyDyteie6SK_myODykex5CesX6n9FNTcUt0"];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

# pragma mark - Push Notification

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    NSLog(@"push notification error = %@", error.localizedDescription);
}

@end
