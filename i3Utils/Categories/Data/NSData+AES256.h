//
//  NSData+AES256.h
//  Atresplayer
//
//  Created by Alejandro on 24/07/14.
//  Copyright (c) 2014 I3Television. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (AES256)

- (NSData *)AES256EncryptWithKey:(NSString *)key;

- (NSData *)AES256DecryptWithKey:(NSString *)key;

@end
