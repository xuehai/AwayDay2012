//
//  AppDelegate.m
//  AwayDay2012
//
//  Created by xuehai zeng on 7/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.

//  the Agenda View

#import "AppDelegate.h"
#import "AppConstant.h"

#define away_day_user_state_key @"away_day_2012_user_state"

@implementation AppDelegate

@synthesize window = _window;
@synthesize agendaViewController=_agendaViewController;
@synthesize userState=_userState;
@synthesize navigationController=_navigationController;
@synthesize shareListViewController=_shareListViewController;
@synthesize menuViewController=_menuViewController;
@synthesize settingViewController=_settingViewController;
@synthesize userActivityViewController=_userActivityViewController;

- (void)dealloc
{
    [_window release];
    [_agendaViewController release];
    [_userState release];
    [_navigationController release];
    [_shareListViewController release];
    [_menuViewController release];
    [_settingViewController release];
    [_userActivityViewController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    
    //restore user state
    NSMutableDictionary *tmpDic=[[NSUserDefaults standardUserDefaults] objectForKey:away_day_user_state_key];
	if(tmpDic!=nil){
		self.userState=tmpDic;
	}
    if(self.userState==nil){
        //1st launch
        NSMutableDictionary *dic=[[NSMutableDictionary alloc]init];
        self.userState=dic;
        [dic release];
        
        NSMutableArray *reminders=[[NSMutableArray alloc]init];
        [self.userState setObject:reminders forKey:kUserReminderKey];
        [reminders release];
    }
    
    if(self.agendaViewController==nil){
        AgendaViewController *rvc=[[AgendaViewController alloc]initWithNibName:@"RootViewController" bundle:nil];
        self.agendaViewController=rvc;
        [rvc release];
    }
    if(self.shareListViewController==nil){
        ShareListViewController *slvc=[[ShareListViewController alloc]initWithNibName:@"ShareListViewController" bundle:nil];
        self.shareListViewController=slvc;
        [slvc release];
    }
    if(self.settingViewController==nil){
        SettingViewController *svc=[[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
        self.settingViewController=svc;
        [svc release];
    }
    if(self.userActivityViewController==nil){
        UserActivityViewController *uavc=[[UserActivityViewController alloc]initWithNibName:@"UserActivityViewController" bundle:nil];
        self.userActivityViewController=uavc;
        [uavc release];
    }
    
    if(self.navigationController==nil){
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:self.agendaViewController];
        self.navigationController=nav;
        [nav release];
    }
    
    [self.window addSubview:self.navigationController.view];
    
    if(self.menuViewController==nil){
        MenuViewController *mvc=[[MenuViewController alloc]initWithNibName:@"MenuViewController" bundle:nil];
        self.menuViewController=mvc;
        [mvc release];
    }
    [self.menuViewController.view setFrame:CGRectMake(0, 450, 320, 199)];
    [self.window addSubview:self.menuViewController.view];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits
    
    //save user state
    [self saveUserState];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - util method
/**
 save user's state to the NSUserDefault
 */
-(void)saveUserState{
    [[NSUserDefaults standardUserDefaults] setObject:self.userState forKey:away_day_user_state_key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/*
 hide the bottom menu view
 */
-(void)hideMenuView{
    [self.menuViewController.view setFrame:CGRectMake(0, 480, self.menuViewController.view.frame.size.width, self.menuViewController.view.frame.size.height)];
}
/**
 show the bottom menu view
 */
-(void)showMenuView{
    [self.menuViewController.view setFrame:CGRectMake(0, 450, self.menuViewController.view.frame.size.width, self.menuViewController.view.frame.size.height)];
}

@end
