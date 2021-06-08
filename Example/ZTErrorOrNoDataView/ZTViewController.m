//
//  ZTViewController.m
//  ZTErrorOrNoDataView
//
//  Created by fyzhangtong on 06/08/2021.
//  Copyright (c) 2021 fyzhangtong. All rights reserved.
//

#import "ZTViewController.h"
#import <ZTErrorOrNoDataView/ZTErrorOrNoDataView-umbrella.h>

@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    ZTButtonConfig *config = [ZTButtonConfig configWithTitle:@"刷新一下" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:13] backColor:[UIColor blueColor] cornerRadius:4 size:CGSizeMake(90, 28) action:^{
        NSLog(@"8888888");
    }];
    [self.view showErrorOrNoDataViewWithImage:@"network_error" buttonConfig:config];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
