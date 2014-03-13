//
//  SGCViewController.m
//  singcafe
//
//  Created by ojimac on 9/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import "SGCTopViewController.h"
#import "SGCAnnotation.h"

@interface SGCTopViewController ()

@end

@implementation SGCTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CLLocationCoordinate2D co;
    co.latitude  = 1.28668;    // 経度
    co.longitude = 103.853607; // 緯度
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:co zoom:14];

    self.mapView.camera = camera;
    self.mapView.myLocationEnabled = YES;

    __weak GMSMapView *weakMapView = self.mapView;
    PFQuery *query = [PFQuery queryWithClassName:@"shops"];
    [query whereKey:@"name" notEqualTo:@""];
    [query whereKey:@"activeFlag" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved %@ scores.", @(objects.count));
            for (PFObject *object in objects) {
                NSLog(@"name = %@", object[@"name"]);
                if (object[@"location"] != [NSNull null]) {
                    PFGeoPoint *geo = object[@"location"];
                    GMSMarker *marker = [[GMSMarker alloc] init];
                    marker.position = CLLocationCoordinate2DMake(geo.latitude, geo.longitude);
                    marker.title    = object[@"name"];
                    marker.snippet  = object[@"url"];
                    marker.map      = weakMapView;
                }
            }
        } else {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - MKMapKit Observer


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    LOG_CURRENT_METHOD
//    self.mapView.centerCoordinate = self.mapView.userLocation.location.coordinate;
    // NOTE: 一度しか現在地に移動しないなら removeObserver する
//    [self.mapView.userLocation removeObserver:self forKeyPath:@"location"];
}

#pragma mark - IBAction

- (IBAction)pushedCurrentLocationButton:(id)sender
{
    NSLog(@"get current location");
}

@end
