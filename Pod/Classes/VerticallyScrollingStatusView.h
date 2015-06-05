//
//  PingStatusLabelView.h
//  Knock
//
//  Created by Rahul Jiresal on 2015-05-31.
//  Copyright (c) 2015 Nightbound Technologies Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticallyScrollingStatusView : UIView

/**
 *  Set the duration for animation. 
 *  Smaller duration means faster scrolling animation.
 */
@property CGFloat animationDuration;

/**
 *  Set the status string for the view.
 *
 *  @param text Text to be shown as status
 */
- (void)setStatus:(NSString*)text;

/**
 *  Clears the current status (with scrolling animation).
 */
- (void)clearStatus;

/**
 *  Sets the number of lines of the status. 
 *  Default is 2.
 *
 *  @param lines Number of lines
 */
- (void)setNumberOfLines:(NSInteger)lines;

/**
 *  Sets the text color.
 *  Default is Black.
 *
 *  @param color Text Color
 */
- (void)setTextColor:(UIColor*)color;

/**
 *  Sets the text font.
 *  Default is system font.
 *
 *  @param font Font to be set
 */
- (void)setFont:(UIFont*)font;

@end
