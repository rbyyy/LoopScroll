//
//  ViewController.m
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "ViewController.h"
#import "RBBannerView.h"


#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT   ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (nonatomic, strong) RBBannerView      *bannerView;
@property (nonatomic, strong) NSMutableArray    *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addBannerView];
}

#pragma mark - add subviews

- (void)addBannerView
{
    self.bannerView = [[RBBannerView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
	self.bannerView.autoScroll = YES;
    [self.bannerView setItems:[self setItemViewsData] time:4.0];
    self.bannerView.currentClick = ^(NSInteger currentPage){
        NSLog(@"currentpage:%ld", (long)currentPage);
    };
    [self.view addSubview:self.bannerView];
}

#pragma mark - gen itemviews

- (NSMutableArray *)setItemViewsData
{
    self.items = [NSMutableArray array];
    [self.items addObject:@"http://newpaper.dahe.cn/hnrb/images/2012-10/30/05/hnrb20121030b005cb008.jpg"];
    [self.items addObject:@"http://desk.fd.zol-img.com.cn/g5/M00/02/08/ChMkJlbKzJeIeOo7AAaYlLIcizIAALI3gJ2JbcABpis612.jpg"];
    [self.items addObject:@"http://b.zol-img.com.cn/desk/bizhi/image/3/960x600/1380420830797.jpg"];
    [self.items addObject:@"http://desk.fd.zol-img.com.cn/g5/M00/02/08/ChMkJlbKzJeIeOo7AAaYlLIcizIAALI3gJ2JbcABpis612.jpg"];
    return self.items;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
