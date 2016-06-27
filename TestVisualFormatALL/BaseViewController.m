//
//  BaseViewController.m
//  MyCardApp
//
//  Created by Bevis Chen on 6/20/16.
//  Copyright © 2016 softworld. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setBasePostNotification];
    
}

-(void)dealloc {
    
}

#pragma mark - Post Notification
-(void)setBasePostNotification {
    
    // Keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark Keyboard
-(void)keyboardWillShow:(NSNotification*)notification {
    
    NSDictionary *userInfo = [notification userInfo];
    // NSValue > CGRect > CGSize
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    NSLog(@"Keyboard Height: %f, Width: %f",keyboardSize.height, keyboardSize.width);
    
    // Specify the Keyboard Height to reset the scroll-view's contentInset and scrollIndicatorInset.
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0);
    _baseScrollView.contentInset = contentInsets;
    _baseScrollView.scrollIndicatorInsets = contentInsets;
}

-(void)keyboardWillHide:(NSNotification*)notification {
    
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _baseScrollView.contentInset = contentInsets;
    _baseScrollView.scrollIndicatorInsets = contentInsets;
}

#pragma mark - UITextField Delegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    BOOL isok = YES;
    //    int tag = (int)textField.tag;
    //    int action = tag / 1000;
    //
    //    if(action == 1 && isok){
    //        if ([string rangeOfCharacterFromSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]].location != NSNotFound)
    //        {
    //            isok = NO;
    //        }
    //    }
    return isok;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    [self.view endEditing:YES];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    
}

#pragma mark - Others
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
