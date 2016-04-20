//
//  UIAlertView+Blocks.m
//  Carrefour
//
//  Created by Ricardo Naharro on 09/10/13.
//  Copyright (c) 2013 Mobile One2One. All rights reserved.
//

#import "UIAlertView+Blocks.h"
#import <objc/runtime.h>

static char kCompletionIdenfier;

@implementation UIAlertView (Blocks)

@dynamic completion;

- (instancetype)initWithTitle:(NSString *)title
            message:(NSString *)message
         completion:(completionBlock)completion
  cancelButtonTitle:(NSString *)cancelButtonTitle
  otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    UIAlertView *alert = [self initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil];
    [alert setCompletion:completion];
    
    va_list _arguments;
    va_start(_arguments, otherButtonTitles);
    
    for (NSString *key = otherButtonTitles; key != nil; key = (__bridge NSString *)(va_arg(_arguments, void *))) {
        [self addButtonWithTitle:key];
    }
    va_end(_arguments);

    return alert;
}

- (void)setCompletion:(completionBlock)completion
{
    objc_setAssociatedObject(self, &kCompletionIdenfier, completion, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (completionBlock)completion
{
    return objc_getAssociatedObject(self, &kCompletionIdenfier);
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (alertView.completion) {
        self.completion(buttonIndex==self.cancelButtonIndex, buttonIndex);
    }
}

@end

@implementation UIAlertView (Simple)

+ (void)alertAcceptWithMessage:(NSString *)message
{
	[self alertAcceptWithMessage:message andDelegate:nil];
}

+ (void)alertAcceptWithMessage:(NSString *)message andDelegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[NSBundle mainBundle] localizedInfoDictionary][@"CFBundleDisplayName"]
													message:message
												   delegate:delegate
										  cancelButtonTitle:NSLocalizedString(@"general_ok", nil)
										  otherButtonTitles:nil];
	[alert show];
}

+ (void)alertAcceptCancelWithMessage:(NSString *)message andDelegate:(id)delegate
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[[NSBundle mainBundle] localizedInfoDictionary][@"CFBundleDisplayName"]
													message:message
												   delegate:delegate
										  cancelButtonTitle:NSLocalizedString(@"general_cancel", nil)
										  otherButtonTitles:NSLocalizedString(@"general_ok", nil), nil];
	[alert show];
}


@end
