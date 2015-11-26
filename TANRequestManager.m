//
//  TANRequestManager.m
//
//  Created by Ted Lee on 01/05/2015.
//
//

#import "TANRequestManager.h"

#import "TANProduct.h"
#import "TANPriceEstimate.h"
#import "TANTimeEstimate.h"

NSString *kLyftURL = @"https://partner-api.lyft.com";
NSString *kLyftAPIVersion = @"v1";

@implementation TANRequestManager

+ (instancetype)sharedInstance {
    static TANRequestManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        NSString *serverToken = infoDictionary[kTANRequestManagerServerTokenKey];
        NSAssert([serverToken isKindOfClass:[NSString class]] && [serverToken length] > 0, @"Server token must be a string with length > 0");
        sharedInstance = [[self alloc] initWithServerToken:serverToken];
    });    
    return sharedInstance;
}

- (instancetype)initWithServerToken:(NSString *)serverToken {
    NSParameterAssert(serverToken);
    NSURL *url = [NSURL URLWithString:kLyftURL];
    self = [super initWithBaseURL:url];
    if (self) {
        [super setResponseSerializer:[AFJSONResponseSerializer serializer]];
        [super setRequestSerializer:[AFJSONRequestSerializer serializer]];
        NSString *formattedServerToken = [NSString stringWithFormat:@"token %@", serverToken];
        [super.requestSerializer setValue:formattedServerToken forHTTPHeaderField:@"Authorization"];
    }
    return self;
}

- (void)getProductsForLocation:(CLLocationCoordinate2D)location
                       success:(TANRequestManagerSuccess)success
                       failure:(TANRequestManagerFailure)failure {

    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kLyftURL stringByAppendingPathComponent:kLyftAPIVersion] stringByAppendingPathComponent:@"ridetypes"];
    NSDictionary *params = @{ @"lat"  : @(location.latitude),
                              @"lng" : @(location.longitude) };
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *productsJSON = responseObject[@"ride_types"];
        
        NSMutableArray *products __block = [[NSMutableArray alloc] init];
        [productsJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            TANProduct *product = [MTLJSONAdapter modelOfClass:TANProduct.class fromJSONDictionary:obj error:&error];
            if (!error && product) {
                [products addObject:product];
            }
        }];
        NSArray *result = [products copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getPriceEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                              endLocation:(CLLocationCoordinate2D)endLocation
                                  success:(TANRequestManagerSuccess)success
                                  failure:(TANRequestManagerFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kLyftURL stringByAppendingPathComponent:kLyftAPIVersion]
                            stringByAppendingPathComponent:@"cost"];
    
    NSDictionary *params = @{ @"start_lat"  : @(startLocation.latitude),
                              @"start_lng" : @(startLocation.longitude),
                              @"end_lat"    : @(endLocation.latitude),
                              @"end_lng"   : @(endLocation.longitude) };
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *priceEstimatesJSON = responseObject[@"cost_estimates"];
        
        NSMutableArray *priceEstimates __block = [[NSMutableArray alloc] init];
        [priceEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            TANPriceEstimate *priceEstimate = [MTLJSONAdapter modelOfClass:TANPriceEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && priceEstimate) {
                [priceEstimates addObject:priceEstimate];
            }
        }];
        NSArray *result = [priceEstimates copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getTimeEstimatesForStartLocation:(CLLocationCoordinate2D)startLocation
                               productID:(NSString *)productID
                            customerUUID:(NSString *)customerUUID
                                 success:(TANRequestManagerSuccess)success
                                 failure:(TANRequestManagerFailure)failure {
    
    NSParameterAssert(success);
    NSParameterAssert(failure);
    
    NSString *URL = [[kLyftURL stringByAppendingPathComponent:kLyftAPIVersion]
                     stringByAppendingPathComponent:@"eta"];
    
    NSMutableDictionary *params = @{ @"lat"  : @(startLocation.latitude),
                                     @"lng" : @(startLocation.longitude) }.mutableCopy;
    
    [self GET:URL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray *timeEstimatesJSON = responseObject[@"eta_estimates"];
        
        NSMutableArray *timeEstimates __block = [[NSMutableArray alloc] init];
        [timeEstimatesJSON enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSError *error = nil;
            TANTimeEstimate *timeEstimate = [MTLJSONAdapter modelOfClass:TANTimeEstimate.class fromJSONDictionary:obj error:&error];
            if (!error && timeEstimate) {
                [timeEstimates addObject:timeEstimate];
            }
        }];
        NSArray *result = [timeEstimates copy];
        success(result);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
