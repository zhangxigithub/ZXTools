//
//  ZXLocationManager.h
//  YiQiWan
//
//  Created by 张 玺 on 12-2-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

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

-(void)locate:(void (^)(CLLocation *))locationInfo mark:(void (^)(MKPlacemark *))mark;


-(void)locationInfoWithPlacemark:(BOOL)placemark;

-(void)getLocationInfoAt:(CLLocationCoordinate2D)coordinate;


@end
