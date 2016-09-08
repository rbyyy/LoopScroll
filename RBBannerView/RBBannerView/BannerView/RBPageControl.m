//
//  RBPageControl.m
//  RBBannerView
//
//  Created by ren on 9/6/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "RBPageControl.h"

@implementation RBPageControl

- (void)updateDots
{
    for (int i = 0; i < [self.subviews count]; i++) {
        UIView* dot = [self.subviews objectAtIndex:i];
        [dot setFrame:CGRectMake(dot.frame.origin.x, dot.frame.origin.y,_size.width,_size.height)];
        if (i == self.currentPage) {
            dot.backgroundColor = _currentSelectColor;
            dot.layer.cornerRadius = dot.frame.size.height / 2;
        } else {
            dot.backgroundColor = [UIColor whiteColor];
            dot.layer.cornerRadius = dot.frame.size.height / 2;
            if (_isHasBorder) {
                dot.layer.borderColor = _borderColor.CGColor;
                dot.layer.borderWidth = 1;
            } else {
                dot.layer.borderWidth = 0;
            }
        }
    }
}

- (void) setCurrentPage:(NSInteger)page
{
    [super setCurrentPage:page];
    [self updateDots];
}

@end
