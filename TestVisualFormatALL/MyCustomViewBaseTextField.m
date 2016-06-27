//
//  MyCustomViewBaseTextField.m
//  TestVisualFormatALL
//
//  Created by Bevis Chen on 6/27/16.
//  Copyright © 2016 Bevis Chen. All rights reserved.
//

#import "MyCustomViewBaseTextField.h"

@implementation MyCustomViewBaseTextField

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        self.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return self;
}

#pragma mark - PUBLIC Methods
-(void)setImageName:(NSString*)imageName andPlaceHolder:(NSString*)placeHolder {
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    _imageView = [[UIImageView alloc] initWithImage:image];
    
    _textField = [UITextField new];
    
    [self setBaseUI];
    [self initAndSetImagePositionWithName:imageName];
    [self initAndSetTestFieldPositionWithPlaceHolder:placeHolder];
    [self layoutIfNeeded];
}

#pragma mark - PRIVATE Methods
-(void)setBaseUI {
    
    self.layer.cornerRadius = 10.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = RGB(217, 217, 217).CGColor;
}

-(void)initAndSetImagePositionWithName:(NSString*)imageName {
    
    // Prepare UI
    [self addSubview:_imageView];
    
    // Prepare Data
    _imageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Add Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-12-[_imageView(==24)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[_imageView(==24)]-12-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_imageView)]];
}

-(void)initAndSetTestFieldPositionWithPlaceHolder:(NSString*)placeHolder {
    
    // Prepare UI
    [self addSubview:_textField];
    _textField.placeholder = placeHolder;
    
    // Prepare Data
    _textField.translatesAutoresizingMaskIntoConstraints = NO;
    
    // Add Contraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_imageView]-12-[_textField]-12-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_imageView,_textField)]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-6-[_textField]-6-|" options:0 metrics:0 views:NSDictionaryOfVariableBindings(_textField)]];
    
}

@end
