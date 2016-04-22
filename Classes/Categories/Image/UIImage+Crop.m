//
//  UIImage+Crop.m
//  floox
//
//  Created by Alberto Ortega Mayoral on 14/12/15.
//  Copyright © 2015 I+3 Televisión. All rights reserved.
//

#import "UIImage+Crop.h"

@implementation UIImage (Crop)

- (UIImage *)cropWithframe:(CGRect)frame
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], frame);
    UIImage *newImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return newImage;
}

@end
