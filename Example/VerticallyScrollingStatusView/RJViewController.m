//
//  RJViewController.m
//  VerticallyScrollingStatusView
//
//  Created by Rahul Jiresal on 06/04/2015.
//  Copyright (c) 2014 Rahul Jiresal. All rights reserved.
//

#import "RJViewController.h"

#import <PureLayout/PureLayout.h>
#import <VerticallyScrollingStatusView/VerticallyScrollingStatusView.h>

@interface RJViewController ()

@property (strong, nonatomic) VerticallyScrollingStatusView* statusView;
@property (strong, nonatomic) NSArray* statuses;
@property int index;

@end

@implementation RJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.statusView = [VerticallyScrollingStatusView newAutoLayoutView];
//    self.statusView = [[VerticallyScrollingStatusView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height / 2, self.view.frame.size.width, 100.0f)];
    [self.view addSubview:self.statusView];
    
    [self.statusView autoCenterInSuperview];
    [self.statusView autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:self.view withOffset:-30.0f];
    [self.statusView autoSetDimension:ALDimensionHeight toSize:100.0f];

    [self.statusView setAnimationDuration:0.5f];
    [self.statusView setFont:[UIFont systemFontOfSize:18.0]];
    [self.statusView setTextColor:[UIColor blackColor]];
    [self.statusView setNumberOfLines:2];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0f target:self selector:@selector(timerTick:) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    self.statuses = [NSArray arrayWithObjects: @"Lorem ipsum dolor sit amet,",
                     @"reque verterem ex eum.",
                     @"Luptatum nominati intellegam",
                     @"mei id, quis minim mei ex.",
                     @"Cu vis officiis salutandi,",
                     @"vis eu saepe inimicus expetenda,",
                     @"cum veritus lucilius facilisi at.",
                     @"Bonorum feugait fuisset qui te.",
                     @"Option volumus mea te,",
                     @"nec ut harum maiorum argumentum,",
                     @"et sonet commune mel.",
                     @"Nec no quem quando iracundia,",
                     @"ea qui iriure admodum propriae,",
                     @"solum honestatis nec id.",
                     @"Eu sed dicunt habemus platonem,",
                     @"illum theophrastus necessitatibus his ut.",
                     @"Ea mel homero timeam inciderint.",
                     @"Ex per nonumy pertinax,",
                     @"nulla evertitur cotidieque eam ut.",
                     @"Ea duo vidit nusquam,",
                     @"suscipit accusata euripidis eam ei.",
                     @"Ex enim liber mnesarchum mea,",
                     @"suscipit eloquentiam ei mei,",
                     @"vel cu volumus offendit eleifend.", nil];
    
}

- (void)timerTick:(id)sender {
    [self.statusView setStatus:[self.statuses objectAtIndex:self.index]];
    self.index = (self.index + 1) % self.statuses.count;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
