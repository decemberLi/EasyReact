//
//  EZRMapReplaceViewController.m
//  EasyReact_Example
//
//  Created by nero on 2018/7/30.
//  Copyright © 2018年 EasyReact. All rights reserved.
//

#import "EZRMapReplaceViewController.h"
#import "EZRTimeLineView.h"
#import "EZRControlPanelView.h"
#import "EZRValueSnapshotView.h"

@interface EZRMapReplaceViewController ()

@property (weak, nonatomic) IBOutlet EZRTimeLineView *nodeATimeLineView;
@property (weak, nonatomic) IBOutlet EZRTimeLineView *nodeBTimeLineView;
@property (weak, nonatomic) IBOutlet EZRControlPanelView *controlPanel;
@property (weak, nonatomic) IBOutlet EZRValueSnapshotView *nodeASnapShotView;
@property (weak, nonatomic) IBOutlet EZRValueSnapshotView *nodeBSnapShotView;
@end

@implementation EZRMapReplaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nodeATimeLineView.name = @"nodeA:";
    self.nodeBTimeLineView.name = @"nodeB:";
    self.controlPanel.name = @"A's value :";
    @ezr_weakify(self)
    [[self.controlPanel.userInputNode listenedBy:self] withBlock:^(NSString * _Nullable next) {
        @ezr_strongify(self)
        [self.nodeASnapShotView addNewValue:next];
        [self.nodeBSnapShotView addNewValue:@"5"];
    }];
}

@end
