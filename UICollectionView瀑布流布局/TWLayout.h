//
//  TWLayout.h
//  UICollectionView瀑布流布局
//
//  Created by mac on 15/9/6.
//  Copyright (c) 2015年 汤威. All rights reserved.
//

#import <UIKit/UIKit.h>


// 最好的方式其实是仿照TableView的设计，使用代理去询问每列宽度，每个item的高度。这样就会成一个通用的Layout
@interface TWLayout : UICollectionViewLayout

@end
