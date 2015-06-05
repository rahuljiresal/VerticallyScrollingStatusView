//
//  PingStatusLabelView.m
//  Knock
//
//  Created by Rahul Jiresal on 2015-05-31.
//  Copyright (c) 2015 Nightbound Technologies Inc. All rights reserved.
//

#import "VerticallyScrollingStatusView.h"

#import <PureLayout/PureLayout.h>

@interface VerticallyScrollingStatusView()

@property (strong, nonatomic) NSMutableArray* statusMessagesQueue;

@property BOOL currentlyShowingStatus;


@end

@implementation VerticallyScrollingStatusView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self allocSubviews];
        [self setDefaults];
    }
    return self;
}

- (void)setDefaults {
    self.animationDuration = 0.5f;
}

- (void)allocSubviews {
    self.statusMessagesQueue = [[NSMutableArray alloc] initWithCapacity:20];

    UILabel *currentLabel = [UILabel newAutoLayoutView];
    UILabel *incomingLabel = [UILabel newAutoLayoutView];
    
    [self addSubview:currentLabel];
    [self addSubview:incomingLabel];
    
    [currentLabel setTextAlignment:NSTextAlignmentCenter];
    [incomingLabel setTextAlignment:NSTextAlignmentCenter];
    [currentLabel setNumberOfLines:2];
    [incomingLabel setNumberOfLines:2];
    [currentLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [incomingLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [currentLabel setFont:[UIFont systemFontOfSize:18.0f]];
    [incomingLabel setFont:[UIFont systemFontOfSize:18.0f]];
    
    self.clipsToBounds = YES;
}

- (void)setNumberOfLines:(NSInteger)lines {
    NSArray* subviews = [self sortedSubviewsArray];
    UILabel* currentLabel = [subviews firstObject];
    UILabel* incomingLabel = [subviews lastObject];
    
    [currentLabel setNumberOfLines:lines];
    [incomingLabel setNumberOfLines:lines];
}

- (void)setTextColor:(UIColor*)color {
    NSArray* subviews = [self sortedSubviewsArray];
    UILabel* currentLabel = [subviews firstObject];
    UILabel* incomingLabel = [subviews lastObject];
    
    [currentLabel setTextColor:color];
    [incomingLabel setTextColor:color];
}

- (void)setFont:(UIFont*)font {
    NSArray* subviews = [self sortedSubviewsArray];
    UILabel* currentLabel = [subviews firstObject];
    UILabel* incomingLabel = [subviews lastObject];
    
    [currentLabel setFont:font];
    [incomingLabel setFont:font];
}

- (BOOL)needsUpdateConstraints {
    return [super needsUpdateConstraints];
}

- (void)updateConstraints {
    NSArray* subviews = [self sortedSubviewsArray];
    UILabel* currentLabel = [subviews firstObject];
    UILabel* incomingLabel = [subviews lastObject];
    
    [currentLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self];
    [currentLabel autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self withMultiplier:0.5];
    [currentLabel autoCenterInSuperview];
    
    [incomingLabel autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self];
    [incomingLabel autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self withMultiplier:0.5];
    [incomingLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:currentLabel];
    [incomingLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    [super updateConstraints];
}

- (void)setStatus:(NSString*)text {
    [self.statusMessagesQueue addObject:text];
    if (!self.currentlyShowingStatus) {
        self.currentlyShowingStatus = YES;
        [self animateStatus];
    }
}

- (void)animateStatus {
    NSArray* subviews = [self sortedSubviewsArray];
    UILabel* currentLabel = [subviews firstObject];
    UILabel* incomingLabel = [subviews lastObject];
    
    NSString* text = [self.statusMessagesQueue firstObject];
    [self.statusMessagesQueue removeObject:text];
    [incomingLabel setText:text];
    
    CGRect currentFrame = CGRectMake(0, self.frame.size.height / 4, self.frame.size.width, self.frame.size.height / 2);
    CGRect incomingFrame = CGRectMake(0, self.frame.size.height * 3 / 4, self.frame.size.width, self.frame.size.height / 2);
    CGRect outgoingFrame = currentLabel.frame;
    outgoingFrame.origin.y = currentLabel.frame.origin.y - currentFrame.size.height;
    [UIView animateWithDuration:self.animationDuration animations:^{
        [currentLabel setFrame:outgoingFrame];
        [incomingLabel setFrame:currentFrame];
        [currentLabel setAlpha:0.0f];
        [incomingLabel setAlpha:1.0f];
    } completion:^(BOOL finished) {
        if (finished) {
            [currentLabel setFrame:incomingFrame];
            if (self.statusMessagesQueue.count > 0) {
                [self animateStatus];
            }
            else {
                self.currentlyShowingStatus = NO;
            }
        }
    }];
}

- (void)clearStatus {
    self.currentlyShowingStatus = YES;
    [self animateStatus];
}

- (NSArray*)sortedSubviewsArray {
    UILabel *incomingLabel;
    UILabel *currentLabel;
    
    NSArray* subviews = self.subviews;
    for (UILabel *label in subviews) {
        if (currentLabel == nil || currentLabel.frame.origin.y > label.frame.origin.y) {
            incomingLabel = currentLabel;
            currentLabel = label;
        }
        else {
            incomingLabel = label;
        }
    }
    
    return [NSArray arrayWithObjects:currentLabel, incomingLabel, nil];
}


@end
