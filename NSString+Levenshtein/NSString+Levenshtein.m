//
// NSString+Levenshtein.h
//
// Modified by Ëlex Lla— on 06/27/14.
//
// Created by Ëlex Lla— on Fri Jul 27 2014.
// alexllao (at) me.com
// Based on the implementation of the algorithms 
// proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

#import "NSString+Levenshtein.h"
#import "CRL2DArray.h"

@implementation NSString (Levenshtein)
- (int)LevenshteinDistance:(NSString*)s2 {
    // d is a table with m+1 rows and n+1 columns
    NSString * s1 = self;
    int cost = 0;
    int m = (int)[s1 length];
    int n = (int)[s2 length];
    CRL2DArray * d = [[CRL2DArray alloc] initWithRows:m+1 columns:n+1];

    // Check that there is something to compare
    if (n == 0) return m;
    if (m == 0) return n;

    // Filling first column and first row
    for (int i = 0; i<=m; i++) { [d insertObject:[NSNumber numberWithInt:i] atRow:i column:0]; }
    for (int j = 0; j<=n; j++) { [d insertObject:[NSNumber numberWithInt:j] atRow:0 column:j]; }

    // Filling each row/column with weights
    for (int i = 1; i<=m; i++) {
        for (int j = 1; j<=n; j++) {
            cost = ([s1 characterAtIndex:i - 1] == [s2 characterAtIndex:j - 1]) ? 0 : 1;
            [d insertObject:[NSNumber numberWithInt: MIN(MIN([[d objectAtRow: i - 1 column:j] intValue] + 1, 
				[[d objectAtRow:i column: j - 1] intValue] + 1), cost + 
				[[d objectAtRow:i - 1 column:j - 1] intValue])] atRow:i column:j];
        }
    }

    // Return LevenshteinDistance
    return [[d objectAtRow:m column:n] intValue];
}

/*- (int)DamerauLevenshteinDistance:(NSString*)s2 threshold:(int)threshold {
    if ([self isEqualToString:s2]) return 0;
    if ([self isEmpty]) return (int)[s2 length];
    if ([s2 isEmpty]) return  0;
    
    if ([s2 rangeOfString:self options:NSCaseInsensitiveSearch].location == NSNotFound) { return (int)s2.length - (int)self.length; }
    if ([self rangeOfString:s2 options:NSCaseInsensitiveSearch].location == NSNotFound) { return 0; }
    
    int length1 = (int)self.length;
    int length2 = (int)s2.length;
    
    CRL2DArray * d = [[CRL2DArray alloc] initWithRows:2 columns:length2 + 1];
    for (int i = 0; i <= length1 - 1; i++) { [d insertObject:[NSNumber numberWithInt:0] atRow:i column:0]; }
    for (int j = 0; j <= length2; j++) { [d insertObject:[NSNumber numberWithInt:j] atRow:0 column:j]; }
    
    for (int i = 1; i<= length1 - 1; i++) {
        int im1 = i - 1;
        int im2 = i - 2;
        int minDistance = threshold;
        
        for (int j = 1; j<=length2; j++) {
            int jm1 = j - 1;
            int jm2 = j - 2;
            int cost = ([self characterAtIndex:im1] == [s2 characterAtIndex:jm1] ? 0 : 1);
            
            int del = [[d objectAtRow:im1 column:j] integerValue] + 1;
            int ins = [[d objectAtRow:i column:jm1] integerValue] + 1;
            int sub = [[d objectAtRow:im1 column:jm1] integerValue] + cost;
            
            /*
             d[i, j] = del <= ins && del <= sub ? del : ins <= sub ? ins : sub;
             
             if (i > 1 && j > 1 && string1[im1] == string2[jm2] && string1[im2] == string2[jm1])
             d[i, j] = Math.Min(d[i, j], d[im2, jm2] + cost);
             
             if (d[i, j] < minDistance)
             minDistance = d[i, j];
             */
        }
        
        if (minDistance > threshold) return MAX_INPUT;
    }
    
    return 0;
    // return [[d insertObject:0 atRow:2 column:length2 + 1] intValue] > threshold ? MAX_INPUT : [[d objectAtRow:2 column: length2] integerValue];
}*/
/*- (BOOL)isEmpty {
    return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]length] == 0);
}*/
@end