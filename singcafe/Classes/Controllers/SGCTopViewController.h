#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "SGCBaseViewController.h"

@interface SGCTopViewController : SGCBaseViewController

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *currentLocationButton;

- (IBAction)pushedCurrentLocationButton:(id)sender;

@end
