//
//  RBPageControl.h
//  RBBannerView
//
//  Created by ren on 9/6/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RBPageControl : UIPageControl

@property (nonatomic, assign) BOOL      isHasBorder;
@property (nonatomic, assign) CGSize    size;
@property (nonatomic, strong) UIColor   *currentSelectColor;
@property (nonatomic, strong) UIColor   *currentUnSelectColor;
@property (nonatomic, strong) UIColor   *borderColor;

@end
