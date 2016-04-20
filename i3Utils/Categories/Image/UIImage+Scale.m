//
//  UIImage+Scale.m
//  Radios
//
//  Created by Ricardo Naharro on 30/4/15.
//  Copyright (c) 2015 Atresmedia. All rights reserved.
//

#import "UIImage+Scale.h"
#import <UIKit/UIKit.h>

@implementation UIImage (Scale)

- (UIImage *)drawBottomLeftInNewImageWithSize:(CGSize)size
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake(5, size.height - self.size.height, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)drawCenterInNewImageWithSize:(CGSize)size
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake((size.width - self.size.width) / 2, (size.height - self.size.height) / 2, self.size.width, self.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaleToSize:(CGSize)size
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIGraphicsBeginImageContextWithOptions(size, NO, scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)scaleProportionalToSize:(CGSize)size1
{
    if (self.size.width > self.size.height)
    {
        NSLog(@"LandScape");
        size1 = CGSizeMake(ceil(self.size.width / self.size.height) * size1.height, size1.height);
    }
    else
    {
        NSLog(@"Potrait");
        size1 = CGSizeMake(size1.width, ceil(self.size.height / self.size.width) * size1.width);
    }

    return [self scaleToSize:size1];
}

- (UIImage *)scaleProportionalToHeightSize:(CGSize)size1
{
    size1 = CGSizeMake(ceil(self.size.width / self.size.height) * size1.height, size1.height);

    return [self scaleToSize:size1];
}

- (instancetype)darkened:(CGFloat)alpha andBlurredImage:(CGFloat)radius blendModeFilterName:(NSString *)blendModeFilterName
{

    CIImage *inputImage = [[CIImage alloc] initWithImage:self];

    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer : @YES}];

    //First, we'll use CIAffineClamp to prevent black edges on our blurred image
    //CIAffineClamp extends the edges off to infinity (check the docs, yo)
    CGAffineTransform transform = CGAffineTransformIdentity;
    CIFilter *clampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    [clampFilter setValue:inputImage forKeyPath:kCIInputImageKey];
    [clampFilter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKeyPath:@"inputTransform"];
    CIImage *clampedImage = [clampFilter outputImage];

    //Next, create some darkness
    CIFilter *blackGenerator = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    CIColor *black = [CIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:alpha];
    [blackGenerator setValue:black forKey:@"inputColor"];
    CIImage *blackImage = [blackGenerator valueForKey:@"outputImage"];

    //Apply that black
    CIFilter *compositeFilter = [CIFilter filterWithName:blendModeFilterName];
    [compositeFilter setValue:blackImage forKey:@"inputImage"];
    [compositeFilter setValue:clampedImage forKey:@"inputBackgroundImage"];
    CIImage *darkenedImage = [compositeFilter outputImage];

    //Third, blur the image
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [blurFilter setDefaults];
    [blurFilter setValue:@(radius) forKey:@"inputRadius"];
    [blurFilter setValue:darkenedImage forKey:kCIInputImageKey];
    CIImage *blurredImage = [blurFilter outputImage];

    CGImageRef cgimg = [context createCGImage:blurredImage fromRect:inputImage.extent];
    UIImage *blurredAndDarkenedImage = [UIImage imageWithCGImage:cgimg];
    CGImageRelease(cgimg);

    return blurredAndDarkenedImage;
}

- (instancetype)darkened:(CGFloat)alpha andBlurredImage:(CGFloat)radius
{
    return [self darkened:alpha andBlurredImage:radius blendModeFilterName:@"CIMultiplyBlendMode"];
}

- (instancetype)darkenedAndBlurredImage
{
    return [self darkened:0.5f andBlurredImage:12.0f];
}

@end
