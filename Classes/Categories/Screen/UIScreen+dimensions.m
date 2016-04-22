//
//  UIScreen+dimensions.m
//  Atresplayer
//
//  Created by Desarrollo on 13/05/13.
//  Copyright (c) 2013 I3Television. All rights reserved.
//

#import "UIScreen+dimensions.h"

@implementation UIScreen (dimensions)

+ (CGSize)getDisplayDimensions {
    int frameWidth = [UIScreen mainScreen].bounds.size.width;
    int frameHeight = [UIScreen mainScreen].bounds.size.height;
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0) {
        if (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation)) {
            frameWidth = [UIScreen mainScreen].bounds.size.height;
            frameHeight = [UIScreen mainScreen].bounds.size.width;
        } else {
            frameWidth = [UIScreen mainScreen].bounds.size.width;
            frameHeight = [UIScreen mainScreen].bounds.size.height;
        }
    }
    return CGSizeMake(frameWidth, frameHeight);
}


+ (CGSize)getStatusBarDimensions {
    int frameWidth = [UIApplication sharedApplication].statusBarFrame.size.width;
    int frameHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    if (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0) {
        if (!UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
            frameWidth = [UIApplication sharedApplication].statusBarFrame.size.height;
            frameHeight = [UIApplication sharedApplication].statusBarFrame.size.width;
        } else {
            frameWidth = [UIApplication sharedApplication].statusBarFrame.size.width;
            frameHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
        }
    }
    return CGSizeMake(frameWidth, frameHeight);
}

@end
