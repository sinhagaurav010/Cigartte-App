//
//  UserLocationFinder.h
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocationManagerDelegate.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MKTypes.h>
#import <MapKit/MKFoundation.h>

@interface UserLocationFinder : NSObject<CLLocationManagerDelegate>
{
    BOOL _stopUp;
    CLLocationManager *locmanager;
    
}
-(void)findCurrentLocation;
@property(retain)    CLGeocoder *reverseGeo;
@property(retain) NSString *strUserAdd;
@property(retain)NSString *strUserLat;
@property(retain)NSString *strUserLong;
@end
