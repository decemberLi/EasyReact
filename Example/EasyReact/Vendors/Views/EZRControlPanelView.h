//
//  EZRControlPanelView.h
//  EasyReact_Example
//
//  Created by nero on 2018/7/30.
//  Copyright © 2018年 EasyReact. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EasyReact/EasyReact.h>

NS_ASSUME_NONNULL_BEGIN

@interface EZRControlPanelView : UIView

@property (nonatomic, copy) NSString *name;
@property (nonatomic, readonly, strong) EZRNode<NSString *> *userInputNode;

@end

NS_ASSUME_NONNULL_END
