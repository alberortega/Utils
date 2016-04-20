//
//  UIAlertView+Blocks.h
//  Carrefour
//
//  Created by Ricardo Naharro on 09/10/13.
//  Copyright (c) 2013 Mobile One2One. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef void (^completionBlock)(BOOL cancelled, NSInteger buttonIndex);

@interface UIAlertView (Blocks)<UIAlertViewDelegate>

@property (copy, nonatomic) completionBlock completion;

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message completion:(completionBlock)completion cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end

@interface UIAlertView (Simple)

+ (void)alertAcceptWithMessage:(NSString *)message;
+ (void)alertAcceptWithMessage:(NSString *)message andDelegate:(id)delegate;
+ (void)alertAcceptCancelWithMessage:(NSString *)message andDelegate:(id)delegate;

@end
