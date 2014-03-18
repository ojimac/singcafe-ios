//
//  SGCSlidePanelController.m
//  singcafe
//
//  Created by ojimac on 23/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import "SGCSlidePanelController.h"

@interface SGCSlidePanelController ()

@end

@implementation SGCSlidePanelController

-(void) awakeFromNib
{
    self.leftGapPercentage = .3f;

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

@end
