//
//  ESLaunchLogoViewController.m
//  esports
//
//  Created by 尚银东 on 2017/11/12.
//  Copyright © 2017年 shangyd. All rights reserved.
//

#import "ESLaunchLogoViewController.h"
#import "AppDelegate.h"
#import "ESTabBarController.h"


@interface ESLaunchLogoViewController ()

@end

@implementation ESLaunchLogoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(goToNextController) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) goToNextController{
    AppDelegate *delegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    delegate.window.rootViewController = [ESTabBarController sharedInstance];
    [ESTabBarController sharedInstance].selectedIndex = 0;
}
@end
