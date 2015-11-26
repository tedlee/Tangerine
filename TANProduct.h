//
//  TANProduct.h
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import <Mantle/Mantle.h>

@class TANPriceDetails;

@interface TANProduct : MTLModel <MTLJSONSerializing>

/// The type of ride Eg) Lyft Line, Lyft Plus...etc.
@property (nonatomic, copy, readonly) NSString *rideType;

@property (nonatomic, copy, readonly) NSString *displayName;

/// Capacity of product. For example, 4 people.
@property (nonatomic, assign, readonly) NSUInteger seats;

/// Image URL representing the product.
@property (nonatomic, strong, readonly) NSURL *imageURL;

@end