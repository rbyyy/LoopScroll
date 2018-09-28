//
//  RBBannerView.h
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RBPageControlDirection) {
	RBPageControlDirectionMiddle,//中
	RBPageControlDirectionLeft,  //左
	RBPageControlDirectionRight  //右
};

@class RBPageControlData;

@interface RBBannerView : UIView

@property (nonatomic, assign) BOOL autoScroll;//是否可自动滚动
@property (nonatomic, assign) RBPageControlDirection pageControlDirection;//pageControl的位置
@property (nonatomic, strong) RBPageControlData *pageControlData;
@property (nonatomic, assign) CGRect controlFrame;//pageControl的frame
@property (nonatomic, copy) void (^currentClick)(NSInteger currentClick);

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time;

@end
