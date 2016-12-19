//
//  AppDelegate.h
//  YhooFantasyFootballAPIExample
//
//  Created by Matthew Noakes on 12/15/16.
//  Copyright © 2016 Matthew Noakes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YOSSocial.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) YOSSession *session;
@property (nonatomic, readwrite, strong) NSMutableDictionary *oauthResponse;
@property BOOL launchDefault;


- (void)createYahooSession;
- (void)handlePostLaunch;


@end

