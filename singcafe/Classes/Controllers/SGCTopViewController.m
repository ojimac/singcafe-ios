#import "SGCTopViewController.h"

#import "SGCAnnotation.h"
#import "SGCMarker.h"

// Vendor
#import "SVWebViewController.h"

@interface SGCTopViewController () <GMSMapViewDelegate>

@end

@implementation SGCTopViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setTranslucent:YES];

    CLLocationCoordinate2D co;
//    co.latitude  = 1.28668;    // 経度
//    co.longitude = 103.853607; // 緯度
    co.latitude  = 1.285;    // 経度
    co.longitude = 103.848; // 緯度

    GMSCameraPosition *camera = [GMSCameraPosition cameraWithTarget:co zoom:14];

    self.mapView.camera = camera;
    self.mapView.myLocationEnabled = YES;
    self.mapView.delegate = self;

    __weak GMSMapView *weakMapView = self.mapView;
    PFQuery *query = [PFQuery queryWithClassName:@"shops"];
    [query whereKey:@"name" notEqualTo:@""];
    [query whereKey:@"activeFlag" equalTo:@YES];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            LOG(@"Successfully retrieved %@ scores.", @(objects.count));
            for (PFObject *object in objects) {
                LOG(@"name = %@", object[@"name"]);
                if (object[@"location"] != [NSNull null]) {
                    PFGeoPoint *geo = object[@"location"];

                    GMSMarker *marker = [[GMSMarker alloc] init];
                    marker.position   = CLLocationCoordinate2DMake(geo.latitude, geo.longitude);
                    marker.userData   = object;
                    marker.map        = weakMapView;
                }
            }
        } else {
            LOG(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - GMSMapViewDelegate

- (BOOL)mapView:(GMSMapView *)mapView didTapMarker:(GMSMarker *)marker
{
    return NO;
}

- (UIView *)mapView:(GMSMapView *)mapView markerInfoWindow:(GMSMarker *)marker {
    NSString *nibName = @"SGCMarker";
    if (IS_IPAD) {
        nibName = @"SGCMarker-iPad";
    }

    PFObject *object = (PFObject *)marker.userData;

    SGCMarker *view = [[[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil] objectAtIndex:0];
    view.shopName.text    = object[@"name"];
    view.shopDetail.text  = object[@"memo"];
    view.shopAddress.text = object[@"address"];

    return view;
}

- (void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker
{
    LOG(@"userData = %@", marker.userData);

    NSURL *url = [NSURL URLWithString:marker.userData[@"url"]];
    LOG(@"url = %@", url);

    SVModalWebViewController *vc = [[SVModalWebViewController alloc] initWithURL:url];
    vc.preferredContentSize = CGSizeMake(kMarkerModalSize, kMarkerModalSize);
    vc.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - IBAction

- (IBAction)pushedCurrentLocationButton:(id)sender
{
    LOG(@"get current location");
}

@end
