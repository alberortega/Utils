//
//  NSURLConnection+helpers.h
//  Atresplayer
//
//  Created by Alejandro on 23/07/14.
//  Copyright (c) 2014 I3Television. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLConnection (helpers)

+(NSString*)getUserAgent;
+(NSMutableURLRequest*)getRequest:(NSString *)str_url;
+(NSMutableURLRequest*)postRequest:(NSString *)str_url;
+(NSMutableURLRequest*)putRequest:(NSString *)str_url;
+(BOOL)hayInternet;

@end
