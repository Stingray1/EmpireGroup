//
//  MapViewController.m
//  IphoneApplicationMap
//
//  Created by Vadim's Mac on 8/25/16.
//  Copyright © 2016 Vadim's Mac. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<MKMapViewDelegate>
{
  UILongPressGestureRecognizer *lpgr;
}

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    self.locationManager = [[CLLocationManager alloc] init ];
    self.locationManager.delegate=self;
    [self.locationManager requestWhenInUseAuthorization];
    
    
    [self.locationManager startUpdatingLocation];
    _mapView.showsUserLocation = YES;
    _mapView.mapType = MKMapTypeStandard;
 
    
    lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handleLongPress:)];
    lpgr.minimumPressDuration = 1.0; //user needs to press for 2 seconds
    [self.mapView addGestureRecognizer:lpgr];
    
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    CLLocationCoordinate2D location;
    location.latitude = userLocation.coordinate.latitude;
    location.longitude = userLocation.coordinate.longitude;
    region.span = span;
    region.center = location;
    [mapView setRegion:region animated:YES];
    
    
    
}
- (void)handleLongPress:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
     _touchPoint = [gestureRecognizer locationInView:self.mapView];
    NSLog(@"%f, %f",_touchPoint.x,_touchPoint.y);
   
    self.subView = [[UIView alloc] initWithFrame:CGRectMake(_touchPoint.x,_touchPoint.y,100,50)];
    self.subView.backgroundColor = [UIColor redColor];
    [self.view addSubview: self.subView];
        //set the position of the button
     _annotationTextField = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
     _annotationTextField.backgroundColor=[UIColor whiteColor];
    [_subView addSubview:_annotationTextField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 28, 100, 30);
    [button setTitle:@"Save!" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(addAnnotation:) forControlEvents:UIControlEventTouchUpInside];
    //add the button to the view
    [_subView addSubview:button];
    [_mapView removeGestureRecognizer:lpgr];
    

}
-(IBAction)addAnnotation:(id)sender {

    CLLocationCoordinate2D touchMapCoordinate =[self.mapView convertPoint:self.touchPoint toCoordinateFromView:self.mapView];
    NSLog(@"%f, %f",_subView.bounds.origin.x,_touchPoint.y);
    MKPointAnnotation *annot = [[MKPointAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    annot.title =self.annotationTextField.text;
    annot.subtitle = self.annotationTextField.text;
    [self.mapView addAnnotation:annot];
    lpgr.cancelsTouchesInView=YES;
    [self.subView removeFromSuperview];
     [self.mapView addGestureRecognizer:lpgr];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
