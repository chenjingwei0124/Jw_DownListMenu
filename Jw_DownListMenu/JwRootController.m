//
//  JwRootController.m
//  Jw_DownListMenu
//
//  Created by chenJw on 16/8/17.
//  Copyright © 2016年 chenJw. All rights reserved.
//

#import "JwRootController.h"
#import "YZPullDownMenu.h"
#import "YZMenuButton.h"
#import "UIView+Extension.h"
#import "JwDetailController.h"

@interface JwRootController ()<YZPullDownMenuDataSource>

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) YZPullDownMenu *downMenu;
@end

@implementation JwRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor brownColor];
    
    [self setupView];
    [self setupData];
}

- (void)setupData{
    
    self.titles = @[@"小学", @"排序", @"更多"];
}

- (void)setupView{
    
    self.downMenu = [[YZPullDownMenu alloc] init];
    self.downMenu.frame = CGRectMake(0, 20, self.view.jw_width, 44);
    [self.view addSubview:self.downMenu];
    
    self.downMenu.dataSource = self;
}

- (void)setupSubVC{
    
}

/**
 *  下拉菜单有多少列
 */
- (NSInteger)numberOfColsInMenu:(YZPullDownMenu *)pullDownMenu{
    return self.titles.count;
}

/**
 *  下拉菜单每列按钮外观
 */
- (UIButton *)pullDownMenu:(YZPullDownMenu *)pullDownMenu buttonForColAtIndex:(NSInteger)index{
    
    YZMenuButton *button = [YZMenuButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:_titles[index] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:25 /255.0 green:143/255.0 blue:238/255.0 alpha:1] forState:UIControlStateSelected];
    [button setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateSelected];
    return button;
}

/**
 *  下拉菜单每列对应的控制器
 */
- (UIViewController *)pullDownMenu:(YZPullDownMenu *)pullDownMenu viewControllerForColAtIndex:(NSInteger)index{
    
    JwDetailController *detailVC = [[JwDetailController alloc] init];
    return detailVC;
}

/**
 *  下拉菜单每列对应的高度
 */
- (CGFloat)pullDownMenu:(YZPullDownMenu *)pullDownMenu heightForColAtIndex:(NSInteger)index{
    return 400;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
