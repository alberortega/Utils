//
//  UIViewController+Topmost.h
//  floox
//
//  Created by Alberto Ortega Mayoral on 4/3/16.
//  Copyright © 2016 I+3 Televisión. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Topmost)

+ (UIViewController *)topViewController;
+ (UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController;

@end
