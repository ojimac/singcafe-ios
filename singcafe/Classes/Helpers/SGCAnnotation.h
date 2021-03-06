#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface SGCAnnotation : NSObject <MKAnnotation>

@property (readwrite, nonatomic) CLLocationCoordinate2D coordinate; // required
@property (nonatomic, copy) NSString *title;
//@property (readwrite, nonatomic, strong) NSString* title; // optional
//@property (readwrite, nonatomic, strong) NSString* subtitle; // ditto
//@property (readwrite, nonatomic, strong) NSString* sample; // for example

@end
