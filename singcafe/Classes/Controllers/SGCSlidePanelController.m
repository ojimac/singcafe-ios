#import "SGCSlidePanelController.h"

@interface SGCSlidePanelController ()

@end

@implementation SGCSlidePanelController

-(void) awakeFromNib
{
    if (IS_IPAD) {
        self.leftGapPercentage = .4f;
    } else {
        self.leftGapPercentage = .8f;
    }

    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"SGCMenuViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"SGCTopNavi"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -

+ (UIImage *)defaultImage
{
    return [UIImage imageNamed:@"List"];
}

- (void)stylePanel:(UIView *)panel {
    panel.layer.cornerRadius = 0.0f;
    panel.clipsToBounds = NO;
}

@end
