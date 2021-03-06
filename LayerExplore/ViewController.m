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
                                 @"title":@"layer-添加",
                                 @"page":@"DYSDemo01ViewController"
                                 },
                             @{
                                 @"title":@"layer-自定义-代理",
                                 @"page":@"DYSDemo02ViewController"
                                 },
                             @{
                                 @"title":@"layer-自定义-子类复写",
                                 @"page":@"DYSDemo03ViewController"
                                 },
                             @{
                                 @"title":@"CAShapeLayer和UIBezierPath",
                                 @"page":@"DYSDemo04ViewController"
                                 },
                             @{
                                 @"title":@"layer-contents-寄宿图",
                                 @"page":@"DYSDemo05ViewController"
                                 },
                             @{
                                 @"title":@"Frame和Bounds",
                                 @"page":@"DYSDemo06ViewController"
                                 },
                             @{
                                 @"title":@"anchorPoint和center/position",
                                 @"page":@"DYSDemo07ViewController"
                                 },
                             @{
                                 @"title":@"CGAffineTransform-仿射变换",
                                 @"page":@"DYSDemo08ViewController"
                                 },
                             @{
                                 @"title":@"CATransform3D-3D变换",
                                 @"page":@"DYSDemo09ViewController"
                                 },
                             @{
                                 @"title":@"CATransform3D-sublayerTransform",
                                 @"page":@"DYSDemo10ViewController"
                                 },
                             @{
                                 @"title":@"CATransform3D-扁平化图层",
                                 @"page":@"DYSDemo11ViewController"
                                 },
                             @{
                                 @"title":@"CATransform3D-固体对象",
                                 @"page":@"DYSDemo12ViewController"
                                 },
                             @{
                                 @"title":@"图形几何学-钟表",
                                 @"page":@"DYSDemo13ViewController"
                                 },
                             @{
                                 @"title":@"图形几何学-zposition",
                                 @"page":@"DYSDemo14ViewController"
                                 },
                             @{
                                 @"title":@"图形几何学-containsPoint/hitTest",
                                 @"page":@"DYSDemo15ViewController"
                                 },
                             @{
                                 @"title":@"视觉效果-圆角/阴影",
                                 @"page":@"DYSDemo16ViewController"
                                 },
                             @{
                                 @"title":@"视觉效果-shadowPath属性",
                                 @"page":@"DYSDemo17ViewController"
                                 },
                             @{
                                 @"title":@"视觉效果-mask?",
                                 @"page":@"DYSDemo18ViewController"
                                 },
                             @{
                                 @"title":@"视觉效果-拉伸过滤",
                                 @"page":@"DYSDemo19ViewController"
                                 },
                             @{
                                 @"title":@"视觉效果-组透明",
                                 @"page":@"DYSDemo20ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAShapeLayer",
                                 @"page":@"DYSDemo21ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CATextLayer",
                                 @"page":@"DYSDemo22ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CATransformLayer",
                                 @"page":@"DYSDemo23ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAGradientLayer",
                                 @"page":@"DYSDemo24ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAReplicatorLayer",
                                 @"page":@"DYSDemo25ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAScrollLayer",
                                 @"page":@"DYSDemo26ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CATiledLayer",
                                 @"page":@"DYSDemo27ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAEmitterLayer",
                                 @"page":@"DYSDemo28ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-CAEAGLLayer",
                                 @"page":@"DYSDemo29ViewController"
                                 },
                             @{
                                 @"title":@"专用图层-AVPlayerLayer",
                                 @"page":@"DYSDemo30ViewController"
                                 },
                             @{
                                 @"title":@"隐式动画-事物/完成块",
                                 @"page":@"DYSDemo31ViewController"
                                 },
                             @{
                                 @"title":@"隐式动画-图层行为",
                                 @"page":@"DYSDemo32ViewController"
                                 },
                             @{
                                 @"title":@"隐式动画-呈现和模型",
                                 @"page":@"DYSDemo33ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-属性动画/关键帧动画",
                                 @"page":@"DYSDemo34ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-属性动画/钟表",
                                 @"page":@"DYSDemo35ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-关键帧动画/飞船",
                                 @"page":@"DYSDemo36ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-虚拟属性(关键路径)",
                                 @"page":@"DYSDemo37ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-动画组",
                                 @"page":@"DYSDemo38ViewController"
                                 },
                             @{
                                 @"title":@"显式动画-过渡",
                                 @"page":@"DYSDemo39ViewController"
                                 },
                            ];
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
    
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:(self.dataSourceArray.count - indexPath.row - 1)];
    cell.textLabel.text = [dict objectForKey:@"title"];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dict = [self.dataSourceArray objectAtIndex:(self.dataSourceArray.count - indexPath.row - 1)];
    NSString *classString = [dict objectForKey:@"page"];
    UIViewController *vc = [NSClassFromString(classString) new];
//    NSLog(@"2018-001");
//    vc.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"2018-002");
    [self.navigationController pushViewController:vc animated:YES];
//    NSLog(@"2018-003");
}

/**
 
 2018-11-16 10:51:49.769812+0800 LayerExplore[1166:45569] 2018-001
 2018-11-16 10:51:53.569039+0800 LayerExplore[1166:45569] 2018-004
 2018-11-16 10:51:57.189441+0800 LayerExplore[1166:45569] [framework] CUIThemeStore: No theme registered with id=0
 2018-11-16 10:51:57.259693+0800 LayerExplore[1166:45569] 2018-002
 2018-11-16 10:52:11.512712+0800 LayerExplore[1166:45569] 2018-003

 self.view.backgroundColor = [UIColor redColor];
 demo05里面不生效，注意研究执行顺序的问题。
 
 */

@end
