//
//  EZRControlPanelView.m
//  EasyReact_Example
//
//  Created by nero on 2018/7/30.
//  Copyright © 2018年 EasyReact. All rights reserved.
//

#import "EZRControlPanelView.h"

@interface EZRControlPanelView ()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (weak, nonatomic) IBOutlet UIButton *DoneButton;

@end

@implementation EZRControlPanelView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [[NSBundle bundleForClass:EZRControlPanelView.class] loadNibNamed:@"EZRControlPanelView" owner:self options:nil];
        [self addSubview:self.contentView];
        self.contentView.frame = self.bounds;
        _userInputNode = [EZRMutableNode new];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [[NSBundle bundleForClass:EZRControlPanelView.class] loadNibNamed:@"EZRControlPanelView" owner:self options:nil];
        [self addSubview:self.contentView];
        self.contentView.frame = self.bounds;
        _userInputNode = [EZRMutableNode new];
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 60);
}

- (void)setName:(NSString *)name {
    _name = name;
    self.nameLabel.text = _name;
}

- (IBAction)didTouchConfirmButton {
    self.userInputNode.mutablify.value = self.inputTextField.text;
}

@end
