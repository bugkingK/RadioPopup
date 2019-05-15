//
//  ViewController.m
//  RadioPopup
//
//  Created by moon on 15/05/2019.
//  Copyright © 2019 bugking. All rights reserved.
//

#import "ViewController.h"
#import "RadioPopupVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    RadioPopupVC *vc = [[RadioPopupVC alloc] initWithRadioDatas:@[@"항상 진동", @"진동 모드에서만", @"진동 끄기"] defaultRow:0 confirmEvent:^(NSInteger row) {
        NSLog(@"최종 row : %ld", (long)row);
    }];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
