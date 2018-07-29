//
//  EZRNodeValueTraceCell.h
//  EasyReact_Example
//
//  Created by zangcw on 2018/7/29.
//  Copyright © 2018年 EasyReact. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EasyReact/EasyReact.h>

@interface EZRNodeValueTraceCell : UITableViewCell

@property (nonatomic, readonly) EZRMutableNode<NSValue *> *offset;
@property (nonatomic, readonly) EZRMutableNode<NSString *> *nodeValue;
@property (nonatomic, readonly) EZRMutableNode<NSDate *> *startDateNode;
@property (nonatomic, readonly) EZRMutableNode<NSNumber *> *ratioNode;
@property (nonatomic, strong) UIColor *tracerColor;
@property (nonatomic, strong) UIColor *nodeValueColor;

@end
