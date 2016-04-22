//
//  NSURLConnection+helpers.m
//  Atresplayer
//
//  Created by Alejandro on 23/07/14.
//  Copyright (c) 2014 I3Television. All rights reserved.
//

#import "NSURLConnection+helpers.h"
#import "AFNetworkReachabilityManager.h"

@implementation NSURLConnection (helpers)

+ (NSMutableURLRequest *)getRequest:(NSString *)str_url
{

    NSMutableURLRequest *req = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:str_url]];
    NSString *userAgent = [NSURLConnection getUserAgent];
    [req setHTTPMethod:@"GET"];
    [req setValue:userAgent forHTTPHeaderField:@"User-Agent"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [req setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    return req;
}

+ (NSString *)getUserAgent
{
    UIDevice *aDevice = [UIDevice currentDevice];
    NSString *iosVersion = [aDevice systemVersion];
    NSString *platform = [aDevice model];
    NSString *userAgent = [NSString stringWithFormat:@"%@ iOS %@ - %@ v %@", platform, kRadioName, iosVersion, [CONFIG getAppVersion]];
    return userAgent;
}

+ (NSMutableURLRequest *)postRequest:(NSString *)str_url
{

    NSMutableURLRequest *req = [NSURLConnection getRequest:str_url];
    [req setHTTPMethod:@"POST"];

    return req;
}

+ (NSMutableURLRequest *)putRequest:(NSString *)str_url
{

    NSMutableURLRequest *req = [NSURLConnection getRequest:str_url];
    [req setHTTPMethod:@"PUT"];

    return req;
}

+ (BOOL)hayInternet
{

    AFNetworkReachabilityStatus remoteHostStatus = [[AFNetworkReachabilityManager sharedManager] networkReachabilityStatus];

    if (remoteHostStatus == AFNetworkReachabilityStatusNotReachable)
    {

        return NO;
    }
    else
    {

        return YES;
    }

    return NO;
}

@end
