//
//  RBBannerView.h
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBBannerView : UIView

@property (nonatomic, assign) BOOL autoScroll;
@property (nonatomic, copy) void (^currentClick)(NSInteger currentClick);

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time;

@end
