//
//  ViewController.m
//  LayerExplore
//
//  Created by 丁玉松 on 2018/11/14.
//  Copyright © 2018 丁玉松. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSourceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LayerExplore";
    self.dataSourceArray = @[
                             @{
                                 @"title":@"添加一个layer",
                                 @"page":@"DYSDemo01ViewController"
                                 },
                             @{
                                 @"title":@"图层绘制-代理",
                                 @"page":@"DYSDemo02ViewController"
                                 },
                             @{
                                 @"title":@"图层绘制-自定义图层",
                                 @"page":@"DYSDemo03ViewController"
                                 },
                             @{
                                 @"title":@"CAShapeLayer和UIBezierPath",
                                 @"page":@"DYSDemo04ViewController"
                                 },];
    self.tableView.rowHeight = 50;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CellID"];
    }
    
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:indexPath.row];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
