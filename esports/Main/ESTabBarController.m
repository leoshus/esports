//
//  ESTabBarController.m
//  esports
//
//  Created by 尚银东 on 2017/11/12.
//  Copyright © 2017年 shangyd. All rights reserved.
//

#import "ESTabBarController.h"
#import "ESNavigationController.h"


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
    UIStoryboard *mimeSB = [UIStoryboard storyboardWithName:@"Mime" bundle:[NSBundle mainBundle]];
    ESNavigationController *mimeNav = [mimeSB instantiateInitialViewController];
    UIStoryboard *metricsSB = [UIStoryboard storyboardWithName:@"Metrics" bundle:[NSBundle mainBundle]];
    ESNavigationController *metricsNav = [metricsSB instantiateInitialViewController];
    UIStoryboard *matchSB = [UIStoryboard storyboardWithName:@"Match" bundle:[NSBundle mainBundle]];
    ESNavigationController *matchNav = [matchSB instantiateInitialViewController];
    UIStoryboard *foundSB = [UIStoryboard storyboardWithName:@"Found" bundle:[NSBundle mainBundle]];
    ESNavigationController *foundNav = [foundSB instantiateInitialViewController];
    UIStoryboard *liveSB = [UIStoryboard storyboardWithName:@"Live" bundle:[NSBundle mainBundle]];
    ESNavigationController *liveNav = [liveSB instantiateInitialViewController];
    self.viewControllers = @[matchNav,metricsNav,foundNav,liveNav,mimeNav];
    
    NSArray *titles = @[@"赛事",@"数据",@"发现",@"直播",@"我的"];
    NSArray *images = @[@"Icon_home_3_highlight",@"Icon_home_2_nor",@"Icon_home_4_nor",@"Icon_home_5_nor",@"Icon_home_1_nor"];
    NSArray *selectedImages = @[@"Icon_home_3_nor",@"Icon_home_2_highlight",@"Icon_home_4_highlight",@"Icon_home_5_highlight",@"Icon_home_1_highlight"];
    for(int i = 0;i < self.tabBar.items.count; i++){
        UITabBarItem *item = self.tabBar.items[i];
        item.title = titles[i];
        item.image = [[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:selectedImages[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        item.titlePositionAdjustment = UIOffsetMake(0, -1);
    }
    
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
