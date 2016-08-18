//
//  JwDetailController.m
//  Jw_DownListMenu
//
//  Created by chenJw on 16/8/18.
//  Copyright © 2016年 chenJw. All rights reserved.
//

#import "JwDetailController.h"
#import "UIView+Extension.h"

extern NSString * const YZUpdateMenuTitleNote;

@interface JwDetailController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *detailTableView;

@property (nonatomic, strong) NSString *supStr;

@end

@implementation JwDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}


- (void)setupView{
    
    self.tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, self.view.jw_width/2, self.view.jw_height)) style:(UITableViewStylePlain)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.detailTableView = [[UITableView alloc] initWithFrame:(CGRectMake(self.tableView.jw_right, 0, self.view.jw_width/2, self.view.jw_height)) style:(UITableViewStylePlain)];
    self.detailTableView.dataSource = self;
    self.detailTableView.delegate = self;
    [self.view addSubview:self.detailTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:(UITableViewScrollPositionNone)];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView == self.tableView) {
        return 5;
    }else{
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.tableView) {
        static NSString *identifier = @"tableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"年级%ld", indexPath.row];
        return cell;
    }else{
        static NSString *identifier = @"detailTableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        }
        cell.textLabel.text = [NSString stringWithFormat:@"%@ : 班%ld", self.supStr, indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView == self.tableView) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.supStr = cell.textLabel.text;
        [self.detailTableView reloadData];
        return;
    }else{
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        // 更新菜单标题
        [[NSNotificationCenter defaultCenter] postNotificationName:YZUpdateMenuTitleNote object:self userInfo:@{@"title":cell.textLabel.text}];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
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
