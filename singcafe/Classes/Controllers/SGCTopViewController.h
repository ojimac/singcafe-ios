//
//  SGCViewController.h
//  singcafe
//
//  Created by ojimac on 9/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "SGCBaseViewController.h"

@interface SGCTopViewController : SGCBaseViewController <GMSMapViewDelegate>

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *currentLocationButton;

- (IBAction)pushedCurrentLocationButton:(id)sender;

@end
