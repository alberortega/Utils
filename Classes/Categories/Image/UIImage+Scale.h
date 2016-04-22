//
//  UIImage+Scale.h
//  Radios
//
//  Created by Ricardo Naharro on 30/4/15.
//  Copyright (c) 2015 Atresmedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

- (UIImage *)scaleToSize:(CGSize)size;
- (UIImage *)scaleProportionalToSize:(CGSize)size;
- (UIImage *)scaleProportionalToHeightSize:(CGSize)size1;

- (UIImage *)drawBottomLeftInNewImageWithSize:(CGSize)size;
- (UIImage *)drawCenterInNewImageWithSize:(CGSize)size;

- (instancetype)darkened:(CGFloat)alpha andBlurredImage:(CGFloat)radius blendModeFilterName:(NSString *)blendModeFilterName;
- (instancetype)darkened:(CGFloat)alpha andBlurredImage:(CGFloat)radius;
- (instancetype)darkenedAndBlurredImage;

@end
