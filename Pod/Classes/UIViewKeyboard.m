//
//  UIViewKeyboard.m
//  Sample
//
//  Created by Renato Matos on 16/12/15.
//  Copyright © 2015 Studio WO. All rights reserved.
//

#import "UIViewKeyboard.h"

@implementation UIViewKeyboard

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
    }
    
    return self;
}

#pragma mark - TextField Delegate

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillShowNotification object:nil];
    
    return YES;
}


- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[NSNotificationCenter defaultCenter] postNotificationName:UIKeyboardWillHideNotification object:nil];
    
    
    [self endEditing:YES];
    return YES;
}

- (void)keyboardDidShow:(NSNotification *)notification {
    UITextField *textField = [self findActiveTextField];
    
    if (textField) {
        CGRect keyboardBounds;
        [[notification.userInfo valueForKey:UIKeyboardFrameBeginUserInfoKey] getValue:&keyboardBounds];
        
        CGFloat textHeight = (textField.frame.origin.y+textField.frame.size.height + 20);
        CGFloat visibleHeight = self.frame.size.height - keyboardBounds.size.height;
        
        if (visibleHeight < textHeight) {
            CGFloat posY = textHeight - visibleHeight;
            
            [UIView animateWithDuration:0.5 animations:^{
                CGRect f = self.bounds;
                f.origin.y = posY;
                self.bounds = f;
            }];
        }
    }
}

- (void)keyboardDidHide:(NSNotification *)notification {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect f = self.bounds;
        f.origin.y = 0.0f;
        self.bounds = f;
    }];
}

- (UITextField *)findActiveTextField {
    for (UITextField *childView in self.subviews ) {
        if ([childView respondsToSelector:@selector(isFirstResponder)] && [childView isFirstResponder]) return childView;
    }
    
    return nil;
}

@end
