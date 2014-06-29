//
// NSString+Levenshtein.h
//
// Modified by Ëlex Lla— on 06/27/14.
//
// Created by Ëlex Lla— on Fri Jul 27 2014.
// alexllao (at) me.com
// Based on the implementation of the algorithms proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

#import <Foundation/Foundation.h>

@interface NSString (Levenshtein)
- (int)LevenshteinDistance:(NSString*)s2;
/*- (int)DamerauLevenshteinDistance:(NSString*)s2;*/
@end