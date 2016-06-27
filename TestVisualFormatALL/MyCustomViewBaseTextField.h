//
//  MyCustomViewBaseTextField.h
//  TestVisualFormatALL
//
//  Created by Bevis Chen on 6/27/16.
//  Copyright © 2016 Bevis Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface MyCustomViewBaseTextField : UIView

@property(strong,nonatomic) UIImageView *imageView;
@property(strong,nonatomic) UITextField *textField;

-(void)setImageName:(NSString*)imageName andPlaceHolder:(NSString*)placeHolder;

@end
