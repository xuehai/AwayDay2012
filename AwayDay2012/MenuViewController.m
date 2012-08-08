//
//  MenuViewController.m
//  AwayDay2012
//
//  Created by xuehai zeng on 12-8-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MenuViewController.h"
#import "AppDelegate.h"

@interface MenuViewController ()

@end

@implementation MenuViewController
@synthesize tapImageView=_tapImageView;
@synthesize chooseFlagImageView=_chooseFlagImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [self.tapImageView addGestureRecognizer:tap];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [tap release];
    
    [self.chooseFlagImageView setFrame:CGRectMake(0, 29, 4, 43)];
}

#pragma mark - UIAction method
-(IBAction)agendaButtonPressed:(id)sender{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate.navigationController setViewControllers:[NSArray arrayWithObject:appDelegate.agendaViewController] animated:NO];
    
    [self.chooseFlagImageView setFrame:CGRectMake(0, 29, 4, 43)];
}
-(IBAction)reminderListButtonPressed:(id)sender{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate.navigationController setViewControllers:[NSArray arrayWithObject:appDelegate.shareListViewController] animated:NO];
    [self.chooseFlagImageView setFrame:CGRectMake(0, 74, 4, 43)];
}
-(IBAction)settingButtonPressed:(id)sender{
    AppDelegate *appDelegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate.navigationController setViewControllers:[NSArray arrayWithObject:appDelegate.settingViewController] animated:NO];
    [self.chooseFlagImageView setFrame:CGRectMake(0, 119, 4, 43)];
}
-(IBAction)handleTapGesture:(UITapGestureRecognizer *)sender{
    [UIView beginAnimations:@"Move" context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.1f];
    if(self.view.frame.origin.y>400){
        [self.view setFrame:CGRectMake(0, 321,self.view.frame.size.width, self.view.frame.size.height)];
    }else{
        [self.view setFrame:CGRectMake(0, 450, self.view.frame.size.width, self.view.frame.size.height)];
    }
    [UIView commitAnimations];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_tapImageView release];
    [_chooseFlagImageView release];
}

@end
