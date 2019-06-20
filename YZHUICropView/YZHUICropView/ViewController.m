//
//  ViewController.m
//  YZHUICropView
//
//  Created by yuan on 2018/5/16.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHUICropView.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *testView;
@property (nonatomic, strong) YZHUICropView *cropView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _test];
}

-(void)_test
{
    CGFloat w = SCREEN_WIDTH * 0.8;
    CGFloat h = SCREEN_HEIGHT * 0.8;
    CGFloat x = (SCREEN_WIDTH - w)/2;
    CGFloat y = (SCREEN_HEIGHT - h)/2;
    self.testView = [[UIImageView alloc] initWithFrame:CGRectMake(x, y, w, h)];
    self.testView.image = [UIImage imageNamed:@"上课bg"];
    self.testView.userInteractionEnabled = YES;
    self.testView.backgroundColor = MainColor;
    [self.view addSubview:self.testView];
    
    self.cropView = [[YZHUICropView alloc] initWithCropOverView:self.testView];
    
    CGPoint pt = CGPointMake(100, 100);
    [self.cropView updatePoint:NSPointViewTagA centerPoint:pt];
//    [self.cropView updatePoint:NSPointViewTagA hidden:YES];
//    [self.cropView updateLine:NSLineViewTagB hiddent:YES];
//    [self.cropView updateLine:NSLineViewTagD hiddent:YES];
    
    w = 60;
    h = 40;
    CGFloat s = (SCREEN_WIDTH - 3 * w)/4;
    y = CGRectGetMaxY(self.testView.frame) + 20;//(SCREEN_HEIGHT - y - h)/2;
    UIButton *inBtn = [self _createBtnWithTitle:@"IN" tag:1 frame:CGRectMake(s, y, w, h)];
    [self.view addSubview:inBtn];
    
    x = CGRectGetMaxX(inBtn.frame) + s;
    UIButton *midBtn = [self _createBtnWithTitle:@"MID" tag:2 frame:CGRectMake(x, y, w, h)];
    [self.view addSubview:midBtn];
    
    x = CGRectGetMaxX(midBtn.frame) + s;
    UIButton *outBtn = [self _createBtnWithTitle:@"OUT" tag:3 frame:CGRectMake(x, y, w, h)];
    [self.view addSubview:outBtn];
}

-(UIButton*)_createBtnWithTitle:(NSString*)title tag:(NSInteger)tag frame:(CGRect)frame
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = PURPLE_COLOR;
    btn.tag = tag;
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(_action:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

-(void)_action:(UIButton*)sender
{
    CGRect rect = [self.cropView cropRectForType:sender.tag - 1];
    NSLog(@"bounds=%@",NSStringFromCGRect(self.cropView.bounds));
    NSLog(@"rect=%@",NSStringFromCGRect(rect));
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
