//
//  TANPriceEstimate.m
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import "TANPriceEstimate.h"

@implementation TANPriceEstimate

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rideType":    @"ride_type",
             @"pickupETA": @"estimated_pickup_eta_seconds",
             @"cost":     @"estimated_cost",
             @"costMinimum":  @"estimated_cost_min",
             @"costMaximum": @"estimated_cost_max",
             @"duration":     @"estimated_duration_seconds",
             @"distance":     @"estimated_distance_miles",
             @"dropoffETA":     @"estimated_dropoff_eta_seconds",
             };
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"costMinimum"]) {
        _costMinimum = 0;
    } else if ([key isEqualToString:@"costMaximum"]) {
        _costMaximum = 0;
    } else if ([key isEqualToString:@"distance"]) {
        _distance = 0.0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
