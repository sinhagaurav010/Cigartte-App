//
//  MapViewController.h
//  CigratteApp
//
//

#import <UIKit/UIKit.h>
#import "CustomMapView.h"
#import "Constant.h"

//#define LINKMAPURL @"http://maps.google.com/maps?saddr=%@,%@&daddr=%@"
#define LINKMAPURL @"http://maps.google.com/maps?saddr=%@&daddr=%@"
@interface MapViewController : UIViewController<customMapvViewDelegate>
{
    CLGeocoder *reverseGeo;
    CustomMapView   *customMap;
    NSMutableArray *arrayLatLong;

}
@property(retain)    CLGeocoder *reverseGeo;
@property(retain)NSString *stringDes;

@end
