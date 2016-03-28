//
//  ViewController.m
//  UICollectionView瀑布流布局
//
//  Created by mac on 15/9/6.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import "ViewController.h"
#import "TWLayout.h"
#import "TWCollectionViewCell.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,weak) UICollectionView *collectionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TWLayout *layout = [[TWLayout alloc] init];
    UICollectionView *collectView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    self.collectionView = collectView;
    collectView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:collectView];
    
    UINib *nib = [UINib nibWithNibName:@"TWCollectionViewCell" bundle:nil];
    [collectView registerNib:nib forCellWithReuseIdentifier:@"TWCollectionViewCell"];
    
    collectView.dataSource = self;
    collectView.delegate = self;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TWCollectionViewCell" forIndexPath:indexPath];
    cell.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.layer.borderWidth = 5;
    cell.number.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
