//
//  SGCViewController.m
//  singcafe
//
//  Created by ojimac on 9/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import "SGCTopViewController.h"

@interface SGCTopViewController ()

@end

@implementation SGCTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    CLLocationCoordinate2D co;
    co.latitude  = 1.28668;    // 経度
    co.longitude = 103.853607; // 緯度
    [self.mapView setCenterCoordinate:co animated:NO];

    MKCoordinateRegion cr = self.mapView.region;
    cr.center = co;
    cr.span.latitudeDelta  = 0.1;
    cr.span.longitudeDelta = 0.1;
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setRegion:cr animated:NO];
    [self.mapView.userLocation addObserver:self forKeyPath:@"location" options:0 context:NULL];

//    [PFAnalytics trackEvent:@"read" dimensions:dimensions];
//    PFQuery *query = [PFQuery queryWithClassName:@"shops"];
//    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
//        NSLog(@"object = %@", object);
//    }];
//    [query getObjectInBackgroundWithId:@"xWMyZ4YEGZ" block:^(PFObject *gameScore, NSError *error) {
//        // Do something with the returned PFObject in the gameScore variable.
//        NSLog(@"%@", gameScore);
//    }];
    PFQuery *query = [PFQuery queryWithClassName:@"shops"];
    [query whereKey:@"name" notEqualTo:@""];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved %d scores.", objects.count);
            for (PFObject *object in objects) {
//                NSLog(@"%@", object.objectId);
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
    self.mapView.centerCoordinate = self.mapView.userLocation.location.coordinate;
    // NOTE: 一度しか現在地に移動しないなら removeObserver する
    [self.mapView.userLocation removeObserver:self forKeyPath:@"location"];
}

#pragma mark - IBAction

- (IBAction)pushedCurrentLocationButton:(id)sender
{
    NSLog(@"get current location");
}

@end
