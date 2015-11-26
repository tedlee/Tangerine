# Tangerine
## An unofficial iOS library for the Lyft API.

Note: Lyft currently does not have a public API (hopefully soon!) but if you're interested in building Lyft into your app check out their [partnerships](https://www.lyft.com/partnerships) page. This SDK is for developers who have been granted API access from Lyft. Tangerine uses the [Mantle](https://github.com/Mantle/Mantle) framework for JSON serialization in conjunction with [AFNetworking](https://github.com/AFNetworking/AFNetworking).

## Installation

Simply drag the *Tangerine* folder into your project

## Usage

You can create your own instances of `TANRequestManager` and set the server token directly for each manager
```objc

TANRequestManager *manager = [[TANRequestManager alloc] initWithServerToken:@"YOUR_SERVER_TOKEN"];

CLLocationCoordinate2D location = CLLocationCoordinate2DMake(37.3924, -122.0798);
[manager getProductsForLocation:location success:^(NSArray *result) {
NSLog(@"%@", result);
} failure:^(NSError *error) {
NSLog(@"%@", error);
}];
```

## Authors

Ted Lee, [@tedlee](https://www.twitter.com/tedlee)  
This library is heavily influenced by [Tom Jowett's](https://github.com/tomj) work on Aubergine, a library for the Uber API.
