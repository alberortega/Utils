//
//  NSString+MD5.h
//  Atresplayer
//
//  Created by Alejandro on 17/06/13.
//  Copyright (c) 2013 I3Television. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

//- (NSString *)MD5String;
/*  -(NSString*)sha256HashFor;
 */

-(NSString*) trimAndRemoveNewLines;

- (NSString *)encodeToASCII;

+(NSString *) timeFormatter:(float)playbackTime;
+(NSString *) timeFormatter:(float)playbackTime withHours:(BOOL)wH withMinutes:(BOOL)wM withSeconds:(BOOL)wS;

-(NSString *)sinTildes;

- (BOOL) isEmailValid;

- (BOOL) isPhoneLengthValid;
- (BOOL) phoneStartsWithSix;
- (BOOL) isPhoneFormatValid;

- (BOOL) isZipCodeLengthValid;
- (BOOL) isZipCodeValid;
- (BOOL) isZipCodeANumber;

- (NSComparisonResult) AZOrder:(NSString *)otherString;
-(BOOL)startsWithNumber;
-(BOOL)startsWithText;

@end