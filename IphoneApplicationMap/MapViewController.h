//
//  MapViewController.h
//  IphoneApplicationMap
//
//  Created by Vadim's Mac on 8/25/16.
//  Copyright © 2016 Vadim's Mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import  <CoreLocation/CoreLocation.h>
@interface MapViewController : UIViewController

@property (strong,nonatomic) IBOutlet UIView *subView;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property(nonatomic, retain) CLLocationManager *locationManager;
@property (strong,nonatomic) UITextView *annotationTextField ;
@property (assign,nonatomic)  CGPoint touchPoint;
@end
