//
//  TANTimeEstimate.m
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import "TANTimeEstimate.h"

@implementation TANTimeEstimate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rideType":    @"product_id",
             @"estimate":     @"estimate"
             };
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"estimate"]) {
        _estimate = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

- (NSString *)estimateString {
    
    unsigned long estimate = (self.estimate/60) + 1;
    
    NSString *str = nil;
    if (estimate == 1) {
       str = [NSString stringWithFormat:@"%lu minute", estimate];
    } else {
        str = [NSString stringWithFormat:@"%lu minutes", estimate];
    }
    
    return str;
}


@end
