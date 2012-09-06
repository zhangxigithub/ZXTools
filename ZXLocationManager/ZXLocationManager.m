//
//  ZXLocationManager.m
//  YiQiWan
//
//  Created by 张 玺 on 12-2-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#pragma GCC diagnostic ignored "-Wdeprecated"

#import "ZXLocationManager.h"

@implementation ZXLocationManager


-(void)locationInfoWithPlacemark:(BOOL)placemark
{
    if (nil == locationManager)
        locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    locationManager.distanceFilter = 100;
    
    [locationManager startUpdatingLocation];
}
-(void)locate:(void (^)(CLLocation *))info mark:(void (^)(MKPlacemark *))mark
{
    locationInfo = info;
    placeMark = mark;
    [self locationInfoWithPlacemark:YES];
}


- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    [manager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{

    id obj = self.delegate;
    if([obj respondsToSelector:@selector(didReceiveCoordinateInfo:)])
    {
        [obj didReceiveCoordinateInfo:newLocation];
    }
    
    CLLocationCoordinate2D loc = newLocation.coordinate;
    
    [self getLocationInfoAt:loc];
}
-(void)getLocationInfoAt:(CLLocationCoordinate2D)coordinate
{
    Class class = NSClassFromString (@"CLGeocoder");
    if (class) {
        
        
        if (!geocoder) geocoder = [[CLGeocoder alloc] init];
        CLLocation *location = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        
        [geocoder reverseGeocodeLocation:location
                       completionHandler:^(NSArray *placemarks, NSError *error) {
                           
                           
                           id obj = self.delegate;
                           if([obj respondsToSelector:@selector(didReceivePlacemark:)])
                           {
                               if(placemarks.count >0)
                               {
                                   CLPlacemark *mark = [placemarks objectAtIndex:0];
                                   [obj didReceivePlacemark:[[MKPlacemark alloc] initWithPlacemark:mark]];
                                   placeMark([[MKPlacemark alloc] initWithPlacemark:mark]);
                               }
                               
                           }
                       }];
        
    } else {
        MKReverseGeocoder *coder = (MKReverseGeocoder *)geocoder;
        if (!coder) coder = [[MKReverseGeocoder alloc]initWithCoordinate:coordinate];
        coder.delegate = self;
        [coder start];
    }
}
-(void)reverseGeocoder:(MKReverseGeocoder *)aGeocoder didFailWithError:(NSError *)error
{
    [aGeocoder start];
}
-(void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark
{
    id obj = self.delegate;
    if([obj respondsToSelector:@selector(didReceivePlacemark:)])
    {
        [obj didReceivePlacemark:placemark];
    }
}

@end
