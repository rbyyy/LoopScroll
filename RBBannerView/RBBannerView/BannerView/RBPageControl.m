//
//  RBPageControl.m
//  RBBannerView
//
//  Created by ren on 9/6/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "RBPageControl.h"
#import "RBPageControlData.h"

@implementation RBPageControl

- (void)updateDots
{
    for (int i = 0; i < [self.subviews count]; i++) {
        UIView* dot = [self.subviews objectAtIndex:i];
		CGFloat dotX = dot.frame.origin.x;
		CGFloat dotY = dot.frame.origin.y;
        if (i == self.currentPage) {
			[self selectedDotStyle:dot dotX:dotX dotY:dotY];
        } else {
			[self unselectedDotStyle:dot dotX:dotX dotY:dotY];
        }
    }
}
//选中dot样式
- (void)selectedDotStyle:(UIView *)dot dotX:(CGFloat)dotX dotY:(CGFloat)dotY
{
	[dot setFrame:[self dotFrame:RBDotUnselectedStyleCircle dotX:dotX dotY:dotY]];
	dot.backgroundColor = _pageControlData.currentSelectColor;
	dot.layer.cornerRadius = dot.frame.size.height / 2;
	if (_pageControlData.isHasBorder) {
		dot.layer.borderWidth = _pageControlData.selectedBorderWidth;
		dot.layer.borderColor = _pageControlData.borderColor.CGColor;
	} else {
		dot.layer.borderWidth = _pageControlData.unselectedBorderWidth;
		dot.layer.borderColor = _pageControlData.currentSelectColor.CGColor;
	}
}
//未选中dot样式
- (void)unselectedDotStyle:(UIView *)dot dotX:(CGFloat)dotX dotY:(CGFloat)dotY
{
	[dot setFrame:[self dotFrame:_pageControlData.dotUnselectedStyle dotX:dotX dotY:dotY]];
	dot.backgroundColor = _pageControlData.currentUnSelectColor;
	dot.layer.cornerRadius = dot.frame.size.height / 2.0;
	dot.layer.borderWidth = _pageControlData.unselectedBorderWidth;
}
//
- (CGRect)dotFrame:(RBDotUnselectedStyle)style dotX:(CGFloat)dotX dotY:(CGFloat)dotY
{
	switch (style) {
		case RBDotUnselectedStyleCircle:
			return CGRectMake(dotX, dotY, _pageControlData.size.width, _pageControlData.size.height);
			break;
		case RBDotUnselectedStyleFlat:
			return CGRectMake(dotX, dotY + 1.5, _pageControlData.size.width + 1, _pageControlData.size.height / 2.0);
			break;
		default:
			break;
	}
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	[self updateDots];
}

- (void) setCurrentPage:(NSInteger)page
{
	[super setCurrentPage:page];
	[self setNeedsLayout];
	[self layoutIfNeeded];
}

@end
