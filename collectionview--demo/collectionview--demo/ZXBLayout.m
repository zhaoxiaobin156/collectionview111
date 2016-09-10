//
//  ZXBLayout.m
//  collectionview--demo
//
//  Created by mac on 16/9/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ZXBLayout.h"

@implementation ZXBLayout
-(id)init{
    self =[super init];
    if (self) {
        
    }
    return self;
}
/*
 当collectionview的显示范围发生改变的时候，是否需要重新刷新布局
 一旦刷新布局，就会重新调用layoutAttributesForElementsInRect方法
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}
/*
 这个方法返回的数组，（数组里面存放着所有元素的布局属性）
 这个方法的返回值决定了rect范围内所有元素的排布（frame）
 */
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
//    获取super已经计算好的所有元素的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
//    计算collectionview最中心点的值
    CGFloat centerX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width *0.5;
    
    
    
    
//    修改cell 的属性
//    一个cell 对应一个UICollectionViewLayoutAttributes对象；UICollectionViewLayoutAttributes对象决定了cell 的 frame
    for (UICollectionViewLayoutAttributes *atts in array) {

//        cell中心点和collectionview最中心点的x 值的间距
        CGFloat delta = ABS(atts.center.x - centerX);
        CGFloat scale = 1 - delta/self.collectionView.frame.size.width;
        
        
        
        
        atts.transform = CGAffineTransformMakeScale(scale, scale);
    }
    
    return array;
    
}
//这个方法决定了，collectionview停止滚动时 的偏移量
-(CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity{
    
    CGRect rect;
    rect.origin.x = proposedContentOffset.x;
    rect.origin.y = 0;
    rect.size= self.collectionView.frame.size;
//    获取super 已经计算好的布局属性
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    
//    计算collectionview最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width*0.5;
    
    CGFloat mindelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in array) {
       CGFloat delta =  ABS( attrs.center.x-centerX);
        if (mindelta>delta) {
            mindelta = delta;
        }
    }
    
//    修改原有的偏移量
    proposedContentOffset.x += mindelta;
    
    
    
    return proposedContentOffset;
}
//用来做布局的初始化操作
-(void)prepareLayout{
    [super prepareLayout];
//    设置内边距
    CGFloat inset =(self.collectionView.frame.size.width -self.itemSize.width)*0.5;
     self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.sectionInset = UIEdgeInsetsMake(0, inset, 0, inset);

}

@end
