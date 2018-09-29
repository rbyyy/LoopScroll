//
//  RBBannerScrollView.m
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "RBBannerScrollView.h"
#import <SDWebImage/UIImageView+WebCache.h>

#define SHOWIMGCOUNT    3

@interface RBBannerScrollView ()

/**
 图片切换时间
 */
@property (nonatomic, assign, readonly) CGFloat         time;
@property (nonatomic, strong) NSTimer                   *timer;
@property (nonatomic, strong, readonly) NSMutableArray  *items;

@end

@implementation RBBannerScrollView {
    NSInteger       _totalPage;
    NSInteger       _curPage;
    NSTimer         *_timer;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.delegate = self;
    }
    return self;
}

#pragma mark set data

- (void)setItems:(NSMutableArray *)items time:(CGFloat)time
{
    if (![_items isEqual:items] || _time != time) {
        _time = time;
        _curPage = 0;
        _items = items;
		[self loadData];
        if (_autoScroll) {
            [self startTimer];
		} else {
			[self stopTimer];
		}
    }
}

#pragma mark reload view

- (void)removeAllItemViews
{
    NSArray *subViews = [self subviews];
    if ([subViews count] != 0) {
        [subViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
}

- (BOOL)singlePage
{
    if (_items != nil && [_items count] > 0) {
        if ([_items count] == 1) {
            return YES;
        }
    }
    return NO;
}

- (void)loadData
{
    [self removeAllItemViews];
    if (_items != nil && [_items count] > 0) {
        _totalPage = [_items count];
		if (_totalPage > 1) {
			NSMutableArray *array = [self replaceItemViews];
			self.contentSize = CGSizeMake(self.frame.size.width * [array count], self.frame.size.height);
			for (int si = 0; si < SHOWIMGCOUNT; si++) {
				[self addItemView:array index:si];
			}
			self.scrollEnabled = YES;
			[self setContentOffset:CGPointMake(self.frame.size.width, 0)];
		} else {
			[self addItemView:_items index:0];
			self.scrollEnabled = NO;
		}
    }
}

- (void)addItemView:(NSMutableArray *)array index:(NSInteger)index
{
    UIImageView *itemView = [UIImageView new];
    itemView.frame = CGRectOffset(self.frame, self.frame.size.width * index, 0);
    [itemView sd_setImageWithURL:[NSURL URLWithString:[array objectAtIndex:index]]];
    [itemView setUserInteractionEnabled:YES];
    [self addSubview:itemView];
}

#pragma mark - create new show ItemViews

- (NSMutableArray *)replaceItemViews
{
    NSMutableArray *itemViewArray = [NSMutableArray array];
    [itemViewArray addObjectsFromArray:_items];
    return [self resetItemViews:_curPage itemViews:itemViewArray];
}

- (NSMutableArray *)resetItemViews:(NSInteger)currentPage itemViews:(NSMutableArray *)items
{
    NSInteger page1 = [self currentShow:currentPage - 1];
    NSInteger page2 = [self currentShow:currentPage];
    NSInteger page3 = [self currentShow:currentPage + 1];
    
    NSMutableArray *itemArray = [NSMutableArray array];
    [itemArray addObject:[items objectAtIndex:page1]];
    [itemArray addObject:[items objectAtIndex:page2]];
    [itemArray addObject:[items objectAtIndex:page3]];
    return itemArray;
}

- (NSInteger)currentShow:(NSInteger)number
{
    if (number == -1)           return _totalPage - 1;
    if (number == _totalPage)   return 0;
    if (number == _totalPage+1) return 1;
    if (number == _totalPage+2) return 2;
    return number;
}

#pragma mark - scrollview delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
	[self calcCurPage:scrollView];
}

- (void)calcCurPage:(UIScrollView *)scrollView
{
	CGFloat xOffset = scrollView.contentOffset.x;
	if (xOffset >= 2*(self.frame.size.width)) {
		_curPage = [self currentShow:_curPage + 1];
		[self loadData];
		if (self.currentPage) {
			self.currentPage(_curPage);
		}
	}
	if (xOffset <= 0) {
		_curPage = [self currentShow:_curPage - 1];
		[self loadData];
		if (self.currentPage) {
			self.currentPage(_curPage);
		}
	}
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
	if (self.timer) {
		[self stopTimer];
	}
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
	if (_autoScroll && ![self singlePage]) {
		if (self.timer) {
			[self stopTimer];
		}
		[self startTimer];
	}
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
	if (![self singlePage]) {
		[self calcCurPage:scrollView];
	}
}

#pragma mark - timer

- (void)startTimer
{
	if (!_timer) {
		_timer = [NSTimer timerWithTimeInterval:self.time target:self selector:@selector(scrollViewGoScroll) userInfo:nil repeats:YES];
		[[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
	}
}

- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)scrollViewGoScroll
{
    [self setContentOffset:CGPointMake(self.frame.size.width * 2, 0) animated:YES];
}

@end
