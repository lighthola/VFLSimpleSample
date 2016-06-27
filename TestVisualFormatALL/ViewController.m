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
    
    [myCustomTextField setImageName:@"img_password" andPlaceHolder:@"密碼"];
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
