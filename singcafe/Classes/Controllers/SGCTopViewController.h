//
//  SGCViewController.h
//  singcafe
//
//  Created by ojimac on 9/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SGCBaseViewController.h"

@interface SGCTopViewController : SGCBaseViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
