//
//  MapViewController.m
//  CigratteApp
//


#import "MapViewController.h"

@implementation MapViewController
@synthesize reverseGeo,stringDes;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    customMap = [[CustomMapView alloc] initWithFrame:self.view.bounds];
    customMap.client = self;	
    customMap.mapType = MKMapTypeStandard;
    
    customMap.showsUserLocation = YES;
    [self.view insertSubview:customMap atIndex:1];
    NSArray *arrayLat = [NSArray arrayWithObjects:@"47.620553",@"47.670550",@"47.670553",@"47.679555",@"47.672553", nil]; 
    NSArray *arrayLong = [NSArray arrayWithObjects:@"9.588479",@"9.588479",@"9.588481",@"9.588458",@"9.588450", nil]; 
    
    arrayLatLong = [[NSMutableArray alloc] init];
    for(int i=0;i<5;i++)
    {
        NSMutableDictionary *dict = [[NSMutableDictionary    alloc  ] init];
        [dict setObject:[arrayLat objectAtIndex:i] forKey:@"Lat"];
        [dict setObject:[arrayLong objectAtIndex:i ] forKey:@"Long" ];
        [dict setObject:@"ABC" forKey:@"title"];
        [arrayLatLong addObject:dict];
    }
    
    [customMap customizeMap:arrayLatLong];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void)clickAtindex:(NSInteger)index
{
    
    
    if (!self.reverseGeo) {
        self.reverseGeo = [[CLGeocoder alloc] init];
    }
    
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:[[[arrayLatLong objectAtIndex:index]objectForKey:@"Lat"] floatValue] longitude:[[[arrayLatLong objectAtIndex:index]objectForKey:@"Long"] floatValue]];
    
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
             stringDes = [placemark locality];
             NSLog(@"%@",[NSString stringWithFormat:LINKMAPURL,userLocation.strUserAdd,stringDes]);
//             
//             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:LINKMAPURL,userLocation.strUserAdd,stringDes]]];
             
             // [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:LINKMAPURL,userLocation.strUserLat,userLocation.strUserLong,stringDes]]];
             
              [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:LINKMAPURL,userLocation.strUserAdd,stringDes]]];
         }
     }];
    
    
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:LINKMAPURL,userLocation.strUserLat,userLocation.strUserLong,[[arrayLatLong objectAtIndex:index]objectForKey:@"Lat"],[[arrayLatLong objectAtIndex:index ]objectForKey:@"Long"]]]];
    
    
    
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
