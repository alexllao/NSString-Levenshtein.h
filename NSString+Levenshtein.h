//
// NSString+Levenshtein.h
//
// Modified by Àlex Llaó on 06/27/14.
//
// Created by Àlex Llaó on Fri Jul 27 2014.
// alexllao@me.com
// Based on the implementation of the algorithms proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

#import <Foundation/Foundation.h>

@interface NSString (Levenshtein)
	-(int)LevenshteinDistance:(NSString*)s1 s2:(NSString*)s2;
@end