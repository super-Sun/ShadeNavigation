//
//  LWNavController.m
//  渐变导航栏
//
//  Created by sunluwei on 16/6/23.
//  Copyright © 2016年 hador. All rights reserved.
//

#import "LWNavController.h"

@interface LWNavController ()

@end


@implementation LWNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    self.navigationBar.tintColor = [UIColor whiteColor];
    
}


@end
