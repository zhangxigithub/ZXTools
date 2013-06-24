#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@protocol ZXLocationManagerDelegate

-(void)didReceivePlacemark:(MKPlacemark *)mark;
-(void)didReceiveCoordinateInfo:(CLLocation *)info;

@end


@interface ZXLocationManager : NSObject<CLLocationManagerDelegate,MKReverseGeocoderDelegate>
{
    CLLocationManager *locationManager;
    id geocoder;
    
    void(^locationInfo)(CLLocation *);
    void(^placeMark)(MKPlacemark *);
}

@property(nonatomic,unsafe_unretained) id<ZXLocationManagerDelegate> delegate;

-(void)locate:(void (^)(CLLocation *locationInfo))info mark:(void(^)(MKPlacemark *placemark))mark;


-(void)locationInfoWithPlacemark:(BOOL)placemark;

-(void)getLocationInfoAt:(CLLocationCoordinate2D)coordinate;


@end
