//
//  TANPriceDetail.m
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import "TANPriceDetail.h"

@implementation TANPriceDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"base":             @"base",
             @"minimum":          @"minimum",
             @"costPerMinute":    @"cost_per_minute",
             @"costPerDistance":  @"cost_per_distance",
             @"distanceUnit":     @"distance_unit",
             @"cancellationFee":  @"cancellation_fee",
             @"currencyCode" :    @"currency_code",
             @"serviceFees":      @"service_fees"
             };
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"base"]) {
        _base = 0.0;
    } else if ([key isEqualToString:@"minimum"]) {
        _minimum = 0.0;
    } else if ([key isEqualToString:@"costPerMinute"]) {
        _costPerMinute = 0.0;
    } else if ([key isEqualToString:@"costPerDistance"]) {
        _costPerDistance = 0.0;
    } else if ([key isEqualToString:@"cancellationFee"]) {
        _cancellationFee = 0.0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
