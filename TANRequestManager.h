//
//  TANRequestManager.h
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>

typedef void (^TANRequestManagerSuccess) (NSArray *result);
typedef void (^TANRequestManagerFailure) (NSError *error);

static NSString *const kTANRequestManagerServerTokenKey = @"TANRequestManagerServerTokenKey";

@interface TANRequestManager : AFHTTPRequestOperationManager

/**
 *  @return An TANRequestManager.  Note the the application's info.plist file must contain
 *          an object for the kTANRequestManagerServerTokenKey key, otherwise an assertion
 *          will go boom.
 */
+ (instancetype)sharedInstance;

- (instancetype)initWithServerToken:(NSString *)serverToken;

@property (nonatomic, copy, readonly) NSString *serverToken;

/// Return an array of TANProduct objects if successful
- (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(TANRequestManagerSuccess)success
                       failure:(TANRequestManagerFailure)failure;

/// Return an array of TANPriceEstimate objects if successful
- (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(TANRequestManagerSuccess)success
                                  failure:(TANRequestManagerFailure)failure;

/// Return an array of TANTimeEstimate objects if successful
- (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                               productID:(NSString *)productID
                            customerUUID:(NSString *)customerUUID
                                 success:(TANRequestManagerSuccess)success
                                 failure:(TANRequestManagerFailure)failure;


@end
