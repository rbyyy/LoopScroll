//
//  RBBannerScrollView.h
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBannerScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic, assign) BOOL autoScroll;
@property (nonatomic, copy) void (^currentPage)(NSInteger currentPage);

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time;

@end
