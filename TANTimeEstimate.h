//
//  TANTimeEstimate.h
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import <Mantle/Mantle.h>

@interface TANTimeEstimate : MTLModel <MTLJSONSerializing>

/// The type of ride Eg) Lyft Line, Lyft Plus...etc.
@property (nonatomic, copy, readonly) NSString *rideType;

/// ETA for the product (in seconds). Always show estimate in minutes.
@property (nonatomic, assign, readonly) NSUInteger estimate;


///
/// Convenience
///

/// Estimate rounded up to whole minute with 'minute[s]' appended, "6 minutes" e.g.
@property (nonatomic, copy, readonly) NSString *estimateString;

@end
