//
//  NSString+MD5.m
//  Atresplayer
//
//  Created by Alejandro on 17/06/13.
//  Copyright (c) 2013 I3Television. All rights reserved.
//

#import "NSString+Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Util)

+ (NSString *)timeFormatter:(float)playbackTime {
  return [NSString timeFormatter:playbackTime
                       withHours:YES
                     withMinutes:YES
                     withSeconds:YES];
}

- (NSString *)encodeToASCII {
  NSCharacterSet *set = [NSCharacterSet URLHostAllowedCharacterSet];
  NSString *res = [self stringByAddingPercentEncodingWithAllowedCharacters:set];
  res = [res
      stringByReplacingOccurrencesOfString:@"="
                                withString:@"%3d"]; // bug: = no lo codifica
  return res;
}

+ (NSString *)timeFormatter:(float)playbackTime
                  withHours:(BOOL)wH
                withMinutes:(BOOL)wM
                withSeconds:(BOOL)wS {
  NSTimeInterval interval = playbackTime;
  NSUInteger seconds = ABS((int)interval);
  NSUInteger minutes = seconds / 60;
  NSUInteger hours = minutes / 60;
  NSString *result = @"";
  if (wH) {
    result = [result stringByAppendingFormat:@"%02lu:", (unsigned long)hours];
  }
  if (wM) {
    result =
        [result stringByAppendingFormat:@"%02lu:", (unsigned long)minutes % 60];
  }
  if (wS) {
    result =
        [result stringByAppendingFormat:@"%02lu:", (unsigned long)seconds % 60];
  }

  if (![result isEqualToString:@""]) {
    result = [result substringToIndex:result.length - 1];
  }
  return result;
}

//- (NSString *)MD5String {
//    const char *cstr = [self UTF8String];
//    unsigned char result[16];
//    CC_MD5(cstr, strlen(cstr), result);
//
//    return [NSString stringWithFormat:
//            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
//            result[0], result[1], result[2], result[3],
//            result[4], result[5], result[6], result[7],
//            result[8], result[9], result[10], result[11],
//            result[12], result[13], result[14], result[15]
//            ];
//}

/*
 -(NSString*)sha256HashFor
 {
 const char* str = [self UTF8String];
 unsigned char result[CC_SHA256_DIGEST_LENGTH];
 CC_SHA256(str, strlen(str), result);

 NSMutableString *ret = [NSMutableString
 stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
 for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
 {
 [ret appendFormat:@"%02x",result[i]];
 }
 return ret;
 }


 */

- (NSComparisonResult)AZOrder:(NSString *)otherString {
  NSPredicate *testNum =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[0-9]"];
  NSPredicate *testText =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z]"];

  NSString *myFirstLetter = @"";
  BOOL soyNum = NO;
  BOOL soyText = YES;
  NSString *yourFirstLetter = @"";
  BOOL tuNum = NO;
  BOOL tuText = YES;

  for (int i = 0; i < self.length; i++) {
    myFirstLetter = [self substringWithRange:NSMakeRange(i, 1)];
    soyNum = [testNum evaluateWithObject:myFirstLetter];
    soyText = [testText evaluateWithObject:myFirstLetter];
    if (soyText || soyNum) {
      break;
    }
  }

  for (int i = 0; i < otherString.length; i++) {
    yourFirstLetter = [otherString substringWithRange:NSMakeRange(i, 1)];
    tuNum = [testNum evaluateWithObject:yourFirstLetter];
    tuText = [testText evaluateWithObject:yourFirstLetter];
    if (tuText || tuNum) {
      break;
    }
  }

  BOOL yoSimbolo = !soyNum && !soyText;
  BOOL tuSimbolo = !tuNum && !tuText;

  if (yoSimbolo && !tuSimbolo) {
    return NSOrderedDescending;
  } else if (!yoSimbolo && tuSimbolo) {
    return NSOrderedAscending;
  } else if (soyNum && tuText) {
    return NSOrderedDescending;
  } else if (soyText && tuNum) {
    return NSOrderedAscending;
  } else {
    return [myFirstLetter localizedCaseInsensitiveCompare:yourFirstLetter];
  }
}

- (BOOL)startsWithNumber {
  if (self.length > 0) {
    NSString *cap = [self substringWithRange:NSMakeRange(0, 1)];
    NSPredicate *testText =
        [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[A-Za-z]"];
    return [testText evaluateWithObject:cap];
  }
  return NO;
}

- (BOOL)startsWithText {
  if (self.length > 0) {
    NSString *cap = [self substringWithRange:NSMakeRange(0, 1)];
    NSPredicate *testNum =
        [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"[0-9]"];
    return [testNum evaluateWithObject:cap];
  }
  return NO;
}

- (NSString *)sinTildes {
  NSData *stringData =
      [self dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
  NSString *cleanString =
      [[NSString alloc] initWithData:stringData encoding:NSASCIIStringEncoding];
  return cleanString;
}

- (BOOL)isEmailValid {
  NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
  NSPredicate *emailTest =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];

  return [emailTest evaluateWithObject:self];
}

- (BOOL)isPhoneLengthValid {
  return (self.length == 9);
}

- (BOOL)phoneStartsWithSix {
  NSString *telfRegex = @"[6-7].[0-9]+";
  NSPredicate *telfTest =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telfRegex];
  return [telfTest evaluateWithObject:self];
}

- (BOOL)isPhoneFormatValid {
  NSString *telfRegex = @"[0-9]+";
  NSPredicate *telfTest =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telfRegex];
  return [telfTest evaluateWithObject:self];
}

- (BOOL)isZipCodeLengthValid {
  return (self.length == 5);
}

- (BOOL)isZipCodeValid {
  int zip = [self intValue];
  return (zip >= 01001) && (zip <= 52006);
}

- (BOOL)isZipCodeANumber {
  NSString *zipRegex = @"[0-9]+";
  NSPredicate *zipTest =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", zipRegex];
  return [zipTest evaluateWithObject:self];
}

- (NSString *)trimAndRemoveNewLines {
  NSString *urlStr =
      [self stringByReplacingOccurrencesOfString:@" " withString:@""];
  urlStr = [urlStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];
  urlStr = [urlStr stringByReplacingOccurrencesOfString:@"\r" withString:@""];

  NSCharacterSet *set = [NSCharacterSet URLHostAllowedCharacterSet];
  return [[NSString stringWithFormat:@"%@", urlStr]
      stringByAddingPercentEncodingWithAllowedCharacters:set];
}

@end