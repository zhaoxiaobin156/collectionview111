//
//  ViewController.m
//  collectionview--demo
//
//  Created by mac on 16/9/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ZXBLayout.h"

@interface ViewController ()<UICollectionViewDataSource>

@end
static NSString *identifier = @"item";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    创建布局
    ZXBLayout *layout = [[ZXBLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 240);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    layout.minimumInteritemSpacing =100;
    layout.minimumLineSpacing = 20;
//    创建frame
    CGFloat collectionW = self.view.bounds.size.width;
    CGFloat collectionH = 300;
    CGRect frame = CGRectMake(0, 100, collectionW, collectionH);
    
//    用 布局 和  frame 创建collectionview
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionview.dataSource = self;
    [self.view addSubview:collectionview];
    
//    注册item
    [collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
  
}

#pragma mark---   UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    UIImageView *imgV =[[UIImageView alloc]initWithFrame:cell.bounds];
    imgV.image = [UIImage imageNamed:@"1"];
    [cell.contentView addSubview:imgV];
    return  cell;
    
}




@end
