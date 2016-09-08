//
//  RBBannerScrollView.h
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBannerScrollView : UIScrollView<UIScrollViewDelegate>

/**
 图片切换时间
 */
@property (nonatomic, assign, readonly) CGFloat         time;
@property (nonatomic, strong, readonly) NSMutableArray  *items;
@property (nonatomic, copy) void (^currentPage)(NSInteger currentPage);

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time;

@end
