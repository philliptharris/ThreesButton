//
//  ThreesButton.m
//  ThreesButtonExample
//
//  Created by Phillip Harris on 5/13/14.
//  Copyright (c) 2014 Phillip Harris. All rights reserved.
//

#import "ThreesButton.h"

@interface ThreesButton ()

@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UIView *underView;

@property (nonatomic, assign) CGFloat popHeight;

@end

@implementation ThreesButton

//===============================================
#pragma mark -
#pragma mark Initialization
//===============================================

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    
    _popHeight = 10.0;
    
    CGRect frame = self.bounds;
    frame.size.height -= _popHeight;
    frame.origin.y += _popHeight;
    
    _underView = [[UIView alloc] initWithFrame:frame];
    _underView.backgroundColor = [UIColor colorWithRed:204.0/255.0 green:81.0/255.0 blue:123.0/255.0 alpha:1.0];
    _underView.userInteractionEnabled = NO;
    _underView.layer.cornerRadius = 5.0;
    [self addSubview:_underView];
    
    frame = self.bounds;
    frame.size.height -= _popHeight;
    
    _mainLabel = [[UILabel alloc] initWithFrame:frame];
    _mainLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:102.0/255.0 blue:128.0/255.0 alpha:1.0];
    _mainLabel.textColor = [UIColor whiteColor];
    _mainLabel.text = @"MAIN  MENU";
    _mainLabel.textAlignment = NSTextAlignmentCenter;
    _mainLabel.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:28.0];
    _mainLabel.layer.cornerRadius = 5.0;
    _mainLabel.clipsToBounds = YES;
    [self addSubview:_mainLabel];
}

//===============================================
#pragma mark -
#pragma mark UIControl Touch Tracking
//===============================================

- (BOOL)beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    
    CGRect frame = self.mainLabel.frame;
    frame.origin.y = self.popHeight;
    self.mainLabel.frame = frame;
    
    return YES;
}

- (BOOL)continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event {
    [self endOrCancel];
}

- (void)cancelTrackingWithEvent:(UIEvent *)event {
    [self endOrCancel];
}

- (void)endOrCancel {
    
    CGRect frame = self.mainLabel.frame;
    frame.origin.y = 0.0;
    self.mainLabel.frame = frame;
}

//===============================================
#pragma mark -
#pragma mark Helper
//===============================================

- (UIColor *)darkerColorFromColor:(UIColor *)color {
    
    CGFloat h, s, b, a;
    if ([color getHue:&h saturation:&s brightness:&b alpha:&a]) {
        return [UIColor colorWithHue:h saturation:s brightness:b * 0.7 alpha:a];
    }
    return nil;
}

@end
