//
//  RBPageControlData.h
//  RBBannerView
//
//  Created by ren on 2018/9/27.
//  Copyright © 2018 ren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RBDotUnselectedStyle) {
	RBDotUnselectedStyleCircle,	//圆形
	RBDotUnselectedStyleFlat	//椭圆形
};

@interface RBPageControlData : NSObject

@property (nonatomic, assign) BOOL      isHasBorder;//选中点是否有边框
@property (nonatomic, assign) CGFloat 	selectedBorderWidth;//选中时边框宽度
@property (nonatomic, assign) CGFloat 	unselectedBorderWidth;//非选中时边框宽度
@property (nonatomic, assign) CGSize    size;//选中点大小
@property (nonatomic, strong) UIColor   *currentSelectColor;//选中时点的颜色
@property (nonatomic, strong) UIColor   *currentUnSelectColor;//非选中时点的颜色
@property (nonatomic, strong) UIColor   *borderColor;//边框颜色
@property (nonatomic, assign) RBDotUnselectedStyle dotUnselectedStyle;

@end
