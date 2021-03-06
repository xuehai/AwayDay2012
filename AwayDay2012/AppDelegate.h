//
//  AppDelegate.h
//  AwayDay2012
//
//  Created by xuehai zeng on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AgendaViewController.h"
#import "ShareListViewController.h"
#import "MenuViewController.h"
#import "SettingViewController.h"
#import "UserActivityViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, retain) UINavigationController *navigationController;
@property(nonatomic, retain) AgendaViewController *agendaViewController;
@property(nonatomic, retain) ShareListViewController *shareListViewController;
@property(nonatomic, retain) SettingViewController *settingViewController;
@property(nonatomic, retain) MenuViewController *menuViewController;
@property(nonatomic, retain) UserActivityViewController *userActivityViewController;
@property(nonatomic, retain) NSMutableDictionary *userState;

/**
 save user's state to the NSUserDefault
 */
-(void)saveUserState;

/*
 hide the bottom menu view
 */
-(void)hideMenuView;

/**
 show the bottom menu view
 */
-(void)showMenuView;

@end
