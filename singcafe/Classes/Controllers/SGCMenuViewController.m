//
//  SGCMenuViewController.m
//  singcafe
//
//  Created by ojimac on 23/2/14.
//  Copyright (c) 2014 ojimac. All rights reserved.
//

#import "SGCMenuViewController.h"

// Vendor
#import "TTTAttributedLabel.h"

@interface SGCMenuViewController () <TTTAttributedLabelDelegate>

@property (weak, nonatomic) IBOutlet UIButton *menuAll;

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *menuWiFiLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *menuSocketLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *menuWorkLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *menuSoCalmLabel;

@property (weak, nonatomic) IBOutlet TTTAttributedLabel *beerLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *feedbackLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *reviewLabel;

@end

@implementation SGCMenuViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self _setupLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TTTAttributedLabelDelegate

- (void)attributedLabel:(TTTAttributedLabel *)label didSelectLinkWithURL:(NSURL *)url
{

}

#pragma mark - private

- (void)_setupLabels
{

}

@end
