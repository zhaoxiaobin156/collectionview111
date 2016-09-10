//
//  ViewController.m
//  collectionview--demo
//
//  Created by mac on 16/9/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "ZXBLayout.h"
#import "XMGPhoneCell.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
/**/


@end
static NSString *phoneid = @"phoneid";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    创建布局
    ZXBLayout *layout = [[ZXBLayout alloc]init];
    layout.itemSize = CGSizeMake(200, 240);
   
//    layout.minimumInteritemSpacing =100;
    layout.minimumLineSpacing = 20;
//    创建frame
    CGFloat collectionW = self.view.bounds.size.width;
    CGFloat collectionH = 300;
    CGRect frame = CGRectMake(0, 100, collectionW, collectionH);
    
//    用 布局 和  frame 创建collectionview
    UICollectionView *collectionview = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    collectionview.dataSource = self;
    collectionview.delegate = self;
    [self.view addSubview:collectionview];
    
//    注册item
//    [collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:identifier];
  
    [collectionview registerNib:[UINib nibWithNibName:NSStringFromClass([XMGPhoneCell class]) bundle:nil] forCellWithReuseIdentifier:phoneid];
    
    
}

#pragma mark---   UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    XMGPhoneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:phoneid forIndexPath:indexPath];
    
    cell.imageName =[NSString stringWithFormat:@"%zd",indexPath.item];
    
    return  cell;
    
}
#pragma  mark--UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"doubi----%zd",indexPath.item);
}




@end
