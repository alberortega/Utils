//
//  UIColor+HexString.h
//  Radios
//
//  Created by Ricardo Naharro on 7/4/15.
//  Copyright (c) 2015 Atresmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor(HexString)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (CGFloat)colorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length;

@end
