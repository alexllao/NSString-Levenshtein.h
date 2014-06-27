# NSString-Levenshtein.h

The Levenshtein distance is a string metric for measuring the difference between two sequences.
Informally, the Levenshtein distance between two words is the minimum number of single-character
edits (i.e. insertions, deletions or substitutions) required to change one word into the other.

Based on the implementation of the algorithms proposed in the Wikipedia "http://en.wikipedia.org/wiki/Levenshtein_distance".

It uses CRL2DArray implementation: "https://github.com/tGilani/CRL2DArray". Thanks to tGilani.

## How to Install

### Manually:
1. Drag the `CL2DArray` folder into your project.
2. Drag the `NSString+Levenshtein` folder into your project.
3. Include `NSString+Levenshtein.h`, where you want to use it.


## How to Use

### Example 1
NSString * string1 = @"L'Ampolla";
NSString * string2 = @"Ampolla, L'";
NSString * string3 = @"L'Aldea";
NSLog("Lev 1=>2: %d, Lev 1=>3: %d", [s1 Levenshtein: string2], [s1 Levenshtein: string3]);

