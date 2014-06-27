//
// NSString+Levenshtein.h
//
// Modified by Ëlex Lla— on 06/27/14.
//
// Created by Ëlex Lla— on Fri Jul 27 2014.
// alexllao@me.com
// Based on the implementation of the algorithms proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

#import "NSString+Levenshtein.h"
#import "CRL2DArray.h"

@implementation NSString (Levenshtein)
- (int)LevenshteinDistance:(NSString*)s2 percentage:(double)percentage {
		// percentage = 0.0;
		
        NSString * s1 = self;
		int cost = 0;
		int m = (int)[s1 length];
		int n = (int)[s2 length];
        CRL2DArray * d = [[CRL2DArray alloc] initWithRows:m+1 columns:n+1];
        
        if (n == 0) return m;
        if (m == 0) return n;
    
        for (int i = 0; i<=m; i++) {
            [d insertObject:[NSNumber numberWithInt:i] atRow:i column:0];
        }
    
        for (int j = 0; j<=n; j++) {
            [d insertObject:[NSNumber numberWithInt:j] atRow:0 column:j];
        }
    
        // for (int i = 0; i <= m; [d insertObject:[NSNumber numberWithInt:i++] atRow:i column:0]);
        // for (int j = 0; j <= n; [d insertObject:[NSNumber numberWithInt:j++] atRow:0 column:j]) ;
        
        for (int i = 1; i<=m; i++) {
            for (int j = 1; j<=n; j++) {
                cost = ([s1 characterAtIndex:i - 1] == [s2 characterAtIndex:j - 1]) ? 0 : 1;
                [d insertObject:[NSNumber numberWithInt: MIN(MIN([[d objectAtRow: i - 1 column:j] intValue] + 1, [[d objectAtRow:i column: j - 1] intValue] + 1), cost + [[d objectAtRow:i - 1 column:j - 1] intValue])] atRow:i column:j];
            }
        }

        /*if (m>n) percentage = [[d objectAtRow:m column:n] doubleValue] / (double)m;
        else percentage = [[d objectAtRow:m column:n] doubleValue] / (double)n;*/
		return [[d objectAtRow:m column:n] intValue];
	}
@end