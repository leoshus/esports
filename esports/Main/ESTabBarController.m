//
//  ESTabBarController.m
//  esports
//
//  Created by 尚银东 on 2017/11/12.
//  Copyright © 2017年 shangyd. All rights reserved.
//

#import "ESTabBarController.h"

@interface ESTabBarController ()

@end

@implementation ESTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configControllers];
    }
    return self;
}

- (void)configControllers{
    UIStoryboard *mimeSB = [UIStoryboard storyboardWithName:@"mime" bundle:[NSBundle mainBundle]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (instancetype)sharedInstance{
    static ESTabBarController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        instance = [[ESTabBarController alloc]init];
    });
    return instance;
}
@end
