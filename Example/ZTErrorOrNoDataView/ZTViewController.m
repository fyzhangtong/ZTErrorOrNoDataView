//
//  ZTViewController.m
//  ZTErrorOrNoDataView
//
//  Created by fyzhangtong on 06/08/2021.
//  Copyright (c) 2021 fyzhangtong. All rights reserved.
//

#import "ZTViewController.h"
#import "UIView+AusonErrorOrNoDataView.h"

@interface ZTViewController ()

@end

@implementation ZTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self.view showNetworkErrorWithActionBlock:^{
//        NSLog(@"***");
//    }];
    [self.view showNodataView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
