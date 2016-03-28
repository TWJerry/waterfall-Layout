//
//  TWLayout.m
//  UICollectionView瀑布流布局
//
//  Created by mac on 15/9/6.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import "TWLayout.h"

@interface TWLayout ()
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableArray *attrsArray;
@end

@implementation TWLayout

-(NSMutableArray *)attrsArray
{
    if (!_attrsArray) {
        self.attrsArray = [[NSMutableArray alloc] init];
    }
    return _attrsArray;
}

- (void)prepareLayout
{
    
    [self.array removeAllObjects];
    for (int i = 0; i < 3; i++) {
        [self.array addObject:@10.0];
    }
    
    [self.attrsArray removeAllObjects];
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i< count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [self.attrsArray addObject:attrs];
    }
}
- (CGSize)collectionViewContentSize
{
    CGFloat longMaY = [self.array[0] doubleValue];
    
    NSLog(@"---------");
    for (int i = 1; i<3; i++) {
        CGFloat maxY = [self.array[0] doubleValue];
        if (maxY > longMaY) {
            longMaY = maxY;
        }
    }
    longMaY += 10;
    return CGSizeMake(0, longMaY);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return NO;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    static int i = 0;
    i++;
    NSLog(@"********%d",i);
    return self.attrsArray;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static int i = 0;
    i++;
    NSLog(@"-------%d",i);
    CGFloat width = self.collectionView.bounds.size.width;
    
    NSInteger lineSpace = 10.0;
    NSInteger columSpace = 10.0;
    
    NSInteger  minColums = 0 ;
    CGFloat minMaxY = [self.array[0] doubleValue];
    
    for (int i = 1; i<3; i++) {
        CGFloat maxY = [self.array[i] doubleValue];
        if (maxY < minMaxY) {
            minMaxY = maxY;
            minColums = i;
        }
    }
    CGFloat itemWidth = (width - lineSpace * 2)/3;
    CGFloat itemHeight = 100 + arc4random_uniform(100);
    
    CGFloat itemX = minColums * (itemWidth + lineSpace);
    CGFloat itemY = minMaxY + columSpace;
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(itemX, itemY, itemWidth, itemHeight);
    self.array[minColums] = @(CGRectGetMaxY(attrs.frame));
    
    return attrs;
}

- (NSMutableArray *)array
{
    if (!_array) {
        self.array = [[NSMutableArray alloc] init];
    }
    return _array;
}


@end
