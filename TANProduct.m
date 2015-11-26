//
//  TANProduct.m
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import "TANProduct.h"
#import "TANPriceDetail.h"

@implementation TANProduct

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"rideType": @"ride_type",
             @"displayName": @"display_name",
             @"seats": @"seats",
             @"imageURL": @"image_url",
             };
}

+ (NSValueTransformer *)imageURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)priceDetailsJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:TANPriceDetail.class];
}

- (void)setNilValueForKey:(NSString *)key {
    if ([key isEqualToString:@"seats"]) {
        _seats = 0;
    } else {
        [super setNilValueForKey:key];
    }
}

@end
