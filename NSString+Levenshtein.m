//
// NSString+Levenshtein.h
//
// Modified by Àlex Llaó on 06/27/14.
//
// Created by Àlex Llaó on Fri Jul 27 2014.
// alexllao@me.com
// Based on the implementation of the algorithms proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

#import "NSString+Levenshtein.h"

@implementation NSString (Levenshtein)
	-(int)LevenshteinDistance:(NSString*)s1 s2:(NSString*)s2 {
		double percentage = 0.0;
		
		int cost = 0;
		int m = [s1 length];
		int n = [s2 length];
		
		int d[m+1, n+1];
		
		if (n == 0) return m;
		if (m == 0) return n;
		
		for(int i = 0; i<=m; d[i, 0] = i++);
		for(int j = 0; i<=n; d[0, j] = j++);
		
		for(int i = 1; i <= m; i++) {
			for(int j = 1; j<=n; j++) {
				
			}
		}
		
		if (m>n) percentage = ((double)d[m, n]/(double)m);
		else percentage = ((double)d[m, n]/(double)n);
		return d[m, n];
	}
@end