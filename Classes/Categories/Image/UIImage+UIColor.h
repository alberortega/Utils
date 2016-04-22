//
//  UIImage+UIColor.h
//  Radios
//
//  Created by Ricardo Naharro on 31/3/15.
//  Copyright (c) 2015 Atresmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIColor)
+ (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)changeImageWithColor:(UIColor *)color;
- (UIColor *)getUIColor;
@end

@interface UIImage (UIViewRendering)
+ (UIImage *)imageWithView:(UIView *)view;
@end
