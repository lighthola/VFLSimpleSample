//
//  ViewController.m
//  TestVisualFormatALL
//
//  Created by Bevis Chen on 6/24/16.
//  Copyright © 2016 Bevis Chen. All rights reserved.
//

#import "ViewController.h"
#import "MyCustomViewBaseTextField.h"

@interface ViewController ()
{
    __weak IBOutlet UIScrollView *myScrollView;
    __weak IBOutlet MyCustomViewBaseTextField *myCustomTextField;
    __weak IBOutlet UIView *myContentView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBaseUI];
    [self setData];
}

#pragma mark - SET UI
-(void)setBaseUI {
    
    // 一個簡單Custom View的範例，可以點進去看看，為了示範VFL所以沒用xib。
    [myCustomTextField setImageName:@"img_password" andPlaceHolder:@"密碼"];
    [self testVFLUI];
}

-(void)testVFLUI {
    
    // translatesAutoresizingMaskIntoConstraints 設成NO 重要
    myContentView.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *myView1 = [UIView new];
    myView1.translatesAutoresizingMaskIntoConstraints = NO;
    myView1.backgroundColor = RGB(100, 240, 200);
    [myContentView addSubview:myView1];
    UIView *myView2 = [UIView new];
    myView2.translatesAutoresizingMaskIntoConstraints = NO;
    myView2.backgroundColor = RGB(100, 200, 240);
    [myContentView addSubview:myView2];
    UIView *myView3 = [UIView new];
    myView3.translatesAutoresizingMaskIntoConstraints = NO;
    myView3.backgroundColor = RGB(100, 150, 240);
    [myContentView addSubview:myView3];
    UIView *myView4 = [UIView new];
    myView4.translatesAutoresizingMaskIntoConstraints = NO;
    myView4.backgroundColor = RGB(100, 240, 150);
    [myContentView addSubview:myView4];
    
    // 可以用metrics來取代hardcode
    NSDictionary *metrics = @{@"hPadding":@15.0};
    
    // 將會用到的view用同樣的名字作成一個字典
    NSDictionary *views = NSDictionaryOfVariableBindings(myView1,myView2,myView3,myView4);
    
    // 設定水平方向距離兩邊15
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hPadding-[myView1]-hPadding-|" options:0 metrics:metrics views:views]];
    // 設定垂直方向，View的順序、距離、高度
    // options 設定了對其view1的水平中心
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[myView1(==50)]-[myView2(==myView1)]" options:NSLayoutFormatAlignAllCenterX metrics:nil views:views]];
    // 設定view2的寬度
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[myView2(==350)]" options:0 metrics:nil views:views]];
    // options 設定了對其view2的左邊
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[myView2]-[myView3(==30)]" options:NSLayoutFormatAlignAllLeading metrics:nil views:views]];
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[myView3(==100)]" options:0 metrics:nil views:views]];
    // options 設定了對其view2的右邊
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[myView2]-[myView4(==myView3)]" options:NSLayoutFormatAlignAllTrailing metrics:nil views:views]];
    [myContentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[myView4(==150)]" options:0 metrics:nil views:views]];

    
    [myContentView layoutIfNeeded];
}

#pragma mark - SET Data
-(void)setData {
    
    self.baseScrollView = myScrollView;
    myCustomTextField.textField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
