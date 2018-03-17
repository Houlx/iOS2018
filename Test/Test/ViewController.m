//
//  ViewController.m
//  Test
//
//  Created by 侯凌霄 on 2018/3/7.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize iOSDeviceScreenSize = [UIScreen mainScreen].bounds.size;
//    NSLog(@"%f * %f", iOSDeviceScreenSize.width, iOSDeviceScreenSize.height);
    float screenWidth = (float) iOSDeviceScreenSize.width;
    float screenHeight = (float) iOSDeviceScreenSize.height;
    NSLog(@"%f * %f", screenWidth, screenHeight);

    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [scrollView setContentSize:CGSizeMake(screenWidth * 3, screenHeight)];
    [scrollView setDelegate:self];
    scrollView.pagingEnabled = YES;

    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight)];
    [imageView1 setImage:[UIImage imageNamed:@"001.jpg"]];
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth, screenHeight)];
    [imageView2 setImage:[UIImage imageNamed:@"002.jpg"]];
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(screenWidth * 2, 0, screenWidth, screenHeight)];
    [imageView3 setImage:[UIImage imageNamed:@"003.jpg"]];

    [scrollView addSubview:imageView1];
    [scrollView addSubview:imageView2];
    [scrollView addSubview:imageView3];

    [self.view addSubview:scrollView];

    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, screenHeight - 50, screenWidth, 30)];
    pageControl.numberOfPages = 3;
    pageControl.currentPage = 0;
    [pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    [pageControl setCurrentPage:offset.x / bounds.size.width];
    NSLog(@"%ld", pageControl.currentPage);
}

- (void)pageChanged:(id)sender {
    CGSize viewSize = scrollView.frame.size;
    CGRect rectBounds = CGRectMake(pageControl.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [scrollView scrollRectToVisible:rectBounds animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end