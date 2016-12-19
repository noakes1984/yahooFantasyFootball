//
//  AppDelegate.m
//  YhooFantasyFootballAPIExample
//
//  Created by Matthew Noakes on 12/15/16.
//  Copyright © 2016 Matthew Noakes. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createYahooSession];
    return YES;
}

- (void)createYahooSession
{
    
    // create session with consumer key, secret and application id
    // set up a new app here: https://developer.yahoo.com/dashboard/createKey.html
    // because the default values here won't work
    self.session = [YOSSession sessionWithConsumerKey:@"dj0yJmk9Q0pXczRLa2hWZUhjJmQ9WVdrOVEyVTNXamN3Tm5NbWNHbzlNVFUwTlRFNE5qVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kMQ--"
                                    andConsumerSecret:@"02893ec94b1a60fae1c707e0ae35bc588bb0363c"
                                     andApplicationId:nil];
    
    
    if(self.oauthResponse) {
        NSString *verifier = [self.oauthResponse valueForKey:@"oauth_verifier"];
        [self.session setVerifier:verifier];
        
    }
    
    BOOL hasSession = [self.session resumeSession];
    
    if(!hasSession) {
        //!!!you need process that via your site only!!!
        /*
         <?php
         $query = $_SERVER['QUERY_STRING'];
         header("Location: com-yourcompany-SocialSample://oauth-response?" . $query);
         ?>
         */
        //[self.session sendUserToAuthorizationWithCallbackUrl:@"http://matthewnoakes.com"];
    } else {
        //[self getUserProfile];
        //NSLog(@"Way To Go");
    }
    
    
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSLog(@"url = %@", url);
    _launchDefault = NO;
    
    if (!url) {
        return NO;
    }
    
    NSArray *pairs = [[url query] componentsSeparatedByString:@"&"];
    NSMutableDictionary *response = [NSMutableDictionary dictionary];
    
    for (NSString *item in pairs) {
        NSArray *fields = [item componentsSeparatedByString:@"="];
        NSString *name = fields[0];
        NSString *value = [fields[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        response[name] = value;
        
        
    }
    self.oauthResponse = response;
    
    [self createYahooSession];
    
    
    
    return YES;
}


- (void)handlePostLaunch
{
    if(self.launchDefault) {
        [self createYahooSession];
    }
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
