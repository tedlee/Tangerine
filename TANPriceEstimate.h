//
//  TANPriceEstimate.h
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import <Mantle/Mantle.h>

@interface TANPriceEstimate : MTLModel <MTLJSONSerializing>

/// The type of ride Eg) Lyft Line, Lyft Plus...etc.
@property (nonatomic, copy, readonly) NSString *rideType;

/// Expected activity duration (in seconds).
@property (nonatomic, assign, readonly) NSNumber *pickupETA;

/// Formatted string of estimate of the start location.
@property (nonatomic, copy, readonly) NSString *cost;

/// Lower bound of the estimated price.
@property (nonatomic, assign, readonly) NSUInteger costMinimum;

/// Upper bound of the estimated price.
@property (nonatomic, assign, readonly) NSUInteger costMaximum;

/// Expected activity duration (in seconds).
@property (nonatomic, assign, readonly) NSUInteger duration;

/// Expected activity distance (in miles).
@property (nonatomic, assign, readonly) double distance;

/// Expected activity duration (in seconds).
@property (nonatomic, assign, readonly) NSNumber *dropoffETA;

@end
