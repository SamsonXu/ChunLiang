//
//  RootViewController.m
//  wentoubao
//
//  Created by iOS－Dev on 2017/4/11.
//  Copyright © 2017年 joinbank. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [MyControl setExtraCellLineHidden:_tableView];
    [self.view addSubview:_tableView];
}

- (void)hasleftBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title{
    
    UIButton *btn = [MyControl buttonWithFram:CGRectMake(0, 0, 40, 40) title:nil imageName:nil];
    
    if (title) {
        UILabel *label = [MyControl labelWithTitle:title color:KTextColor fontOfSize:15 numberOfLine:1];
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(btn);
        }];
    }
    
    if (imgName) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
        [btn addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.centerY.equalTo(btn);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    
    [btn addTarget:self action:@selector(leftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setLeftBarButtonItem:leftItem];
}

- (void)hasRightBarButtonItemWithImage:(NSString *)imgName title:(NSString *)title{
    
    UIButton *btn = [MyControl buttonWithFram:CGRectMake(0, 0, 40, 40) title:nil imageName:nil];
    [btn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    
    if (title) {
        btn.frame = CGRectMake(0, 0, title.length>3 ? 20+20*(title.length-1):60, 40);
        UILabel *label = [MyControl labelWithTitle:title color:KTextColor fontOfSize:15 numberOfLine:1];
        label.textAlignment = NSTextAlignmentRight;
        [btn addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(btn);
        }];
    }
    
    if (imgName) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imgName]];
        [btn addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.centerY.equalTo(btn);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)leftClick:(UIButton *)sender{
    
    sender.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    sender.enabled = YES;
}

- (void)rightClick:(UIButton *)sender{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
