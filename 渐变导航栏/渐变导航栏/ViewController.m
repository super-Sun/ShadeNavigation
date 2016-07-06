//
//  ViewController.m
//  渐变导航栏
//
//  Created by sunluwei on 15/6/23.
//  Copyright © 2015年 hador. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) UIImageView *navImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"标题";
    //初始化tableView
    [self createTableView];
    //设置导航栏透明
    [self navChange];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}
/**
 *  核心实现过程
 */
- (void)navChange {
    //为导航栏设计背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_back"] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
   //拿到导航栏内 ImageView（通过Debug View Hierachy查看 获得）
    self.navImg = [[self.navigationController.navigationBar subviews] firstObject];
    
    //设置ImageView透明
    self.navImg.alpha = 0;
    
    //设置导航栏内容(不是重点)
    [self setNavContent];

}
/**
 *  设置导航栏内容
 */
- (void)setNavContent {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_press"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_press"]  style:UIBarButtonItemStylePlain target:self action:@selector(pushToBackView)];
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
    self.navigationItem.titleView = [[UISearchBar alloc] init];
    
}
/**
 *  按钮点击事件
 */
- (void)pushToBackView {
    
    NSLog(@"btn clike-------");

}
/**
 *  屏幕滚动回调
 */
#pragma -根据滚动 计算透明度
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //获取Y偏移量
    CGFloat moveY = scrollView.contentOffset.y;
    
    //Y偏移量：0 --> 64   alpha： 0 --> 1.0
    CGFloat alpha = moveY > 64.0 && moveY <0 ? 1 : (moveY/64.0);
    self.navImg.alpha = alpha;
    
}
/**
 *  创建tableView
 */
- (void)createTableView {
    
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, -64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    
    UIImageView *imgeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headbg"]];
    imgeView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
    tableView.tableHeaderView = imgeView;
    [self.view addSubview:tableView];
    static NSString *cellID = @"cellID";
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:cellID];
    
}

#pragma -UITableViewDelegate-
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
#pragma -UITableViewDataSource-
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"title%lu", indexPath.row];
    
    return cell;
}

@end
