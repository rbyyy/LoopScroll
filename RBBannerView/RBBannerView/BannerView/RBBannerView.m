//
//  RBBannerView.m
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "RBBannerView.h"
#import "RBBannerScrollView.h"
#import "RBCommonDefine.h"
#import "RBPageControl.h"

@interface RBBannerView ()

@property (nonatomic, strong) RBBannerScrollView            *bannerScrollView;

@property (nonatomic, strong) RBPageControl                 *pageControl;

@end

@implementation RBBannerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addPageControl];
        [self addScrollView];
        [self addSubview:_pageControl];
    }
    return self;
}

#pragma mark - set data

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time
{
    _items = items;
    [self.bannerScrollView setItems:self.items time:time];
    [_pageControl setNumberOfPages:[self.items count]];
}

#pragma mark - add views

- (void)addScrollView
{
    self.bannerScrollView = [[RBBannerScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    __weak typeof(self) weakSelf = self;
    self.bannerScrollView.currentPage = ^(NSInteger currentPage){
        __strong typeof(self) strongSelf = weakSelf;
        if (strongSelf.pageControl) {
            [strongSelf.pageControl setCurrentPage:currentPage];
        }
    };
    [self addSubview:self.bannerScrollView];
}
- (void)addPageControl
{
    _pageControl = [[RBPageControl alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 8)];
    [_pageControl setSize:CGSizeMake(6, 6)];
    [_pageControl setCurrentSelectColor:[UIColor grayColor]];
    [_pageControl setIsHasBorder:NO];
    [_pageControl setHidesForSinglePage:YES];
    [_pageControl setUserInteractionEnabled:NO];
    [_pageControl setCurrentPage:0];
}

@end
