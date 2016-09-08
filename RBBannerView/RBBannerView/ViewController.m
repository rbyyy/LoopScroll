//
//  ViewController.m
//  RBBannerView
//
//  Created by ren on 8/31/16.
//  Copyright © 2016 ren. All rights reserved.
//

#import "ViewController.h"
#import "RBBannerView.h"
#import "RBCommonDefine.h"


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
    [self.bannerView setItems:[self setItemViewsData] time:4.0];
    [self.view addSubview:self.bannerView];
}

#pragma mark - gen itemviews

- (NSMutableArray *)setItemViewsData
{
    self.items = [NSMutableArray array];
    for (int i = 0; i < 7; i++) {
        [self.items addObject:[self getColor:i]];
    }
    return self.items;
}

- (UIColor *)getColor:(NSInteger)number
{
    UIColor *color = [UIColor whiteColor];
    if (number%4 == 0) {
        color = [self genColor:255.0 green:0 blue:0];
    } else if (number%4 == 1) {
        color = [self genColor:0 green:255.0 blue:0];
    } else if (number%4 == 2) {
        color = [self genColor:0 green:0 blue:255.0];
    } else if(number%4 == 3) {
        color = [self genColor:255.0 green:255.0 blue:0];
    } else {
        color = [self genColor:125.0 green:255.0 blue:0];
    }
    return color;
}

- (UIColor *)genColor:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue
{
    UIColor *color = [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
    return color;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
