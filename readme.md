# Tangerine
## An unofficial iOS library for the Lyft API.

To get started with Tangerine head over and sign up for the [Lyft Developer Program](https://lyft.com/developers). You will then be granted a `Client Token` and `Client Secret`. Tangerine uses the [Mantle](https://github.com/Mantle/Mantle) framework for JSON serialization in conjunction with [AFNetworking](https://github.com/AFNetworking/AFNetworking).

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

## License

MIT