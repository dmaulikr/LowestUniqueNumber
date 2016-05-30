//
//  main.m
//  LowestUniqueNumber


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *line = @"3 3 9 1 6 5 8 1 5 3";
        
        NSArray *numsArray = [line componentsSeparatedByString: @" "];
        NSMutableArray *mutNumsArray = [numsArray mutableCopy];
        
//        BOOL foundUnique = NO;
        BOOL foundFirstUnique = NO;
        NSString *uniqueNumString = [[NSMutableString alloc]init];
        
        while (mutNumsArray.count > 0) {
            NSString *numAtIndexString = [mutNumsArray objectAtIndex:0];
            
            NSInteger beforeRemoveCount = mutNumsArray.count;
            NSLog(@"before %ld", beforeRemoveCount);
            
            [mutNumsArray removeObject:numAtIndexString];
            
            NSInteger afterRemoveCount = mutNumsArray.count;
            NSLog(@"after %ld", afterRemoveCount);
            if (beforeRemoveCount - afterRemoveCount == 1) {
                
                if (!foundFirstUnique) {
                    foundFirstUnique = YES;
                    uniqueNumString = numAtIndexString;
                }
                else if ([uniqueNumString integerValue] > [numAtIndexString integerValue]) {
                    uniqueNumString = numAtIndexString;
                }
            }

        }
        if (foundFirstUnique) {
            NSLog(@"index: %ld", [numsArray indexOfObject:uniqueNumString] + 1);
        }
        else {
            NSLog(@"NONE 0");
        }
        
    }
    return 0;
}
