//
//  UserLocationFinder.m
//

#import "UserLocationFinder.h"

@implementation UserLocationFinder
@synthesize strUserLat,strUserLong,strUserAdd,reverseGeo;
-(void)findCurrentLocation
{
    _stopUp = 1;
    locmanager = [[CLLocationManager alloc] init];
	[locmanager setDelegate:self];
	[locmanager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locmanager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if(_stopUp == 1)
    {
        if (!self.reverseGeo) {
            self.reverseGeo = [[CLGeocoder alloc] init];
        }
        _stopUp = 0;
        ////NSLog(@"%g",newLocation.coordinate.latitude);
        NSLog(@"here");
        // Log the kind of accuracy we got from this
        [locmanager stopUpdatingLocation];
        self.strUserLat = [NSString stringWithFormat:@"%g",newLocation.coordinate.latitude];
        self.strUserLong = [NSString stringWithFormat:@"%g",newLocation.coordinate.longitude];
        
        CLLocation *loc = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
        
        [self.reverseGeo reverseGeocodeLocation: loc completionHandler: 
         ^(NSArray *placemarks, NSError *error) {
             
             for (CLPlacemark *placemark in placemarks) {
                 
                 //             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                 //             [formatter setTimeStyle:NSDateFormatterNoStyle];
                 //             [formatter setDateStyle:NSDateFormatterLongStyle];
                 //             
                 //             NSString *dateString = [formatter stringFromDate: [self dateAdded]];
                 //             [self setSubtitle: [dateString stringByAppendingString: [placemark locality] ] ];
                 NSLog(@"%@",[placemark locality]);
                 self.strUserAdd = [placemark locality];
                 
             }
         }];
    }
    
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    
    [locmanager stopUpdatingLocation];
}

@end
