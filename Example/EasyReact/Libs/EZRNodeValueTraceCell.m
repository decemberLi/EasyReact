//
//  EZRNodeValueTraceCell.m
//  EasyReact_Example
//
//  Created by zangcw on 2018/7/29.
//  Copyright © 2018年 EasyReact. All rights reserved.
//

#import "EZRNodeValueTraceCell.h"
#import <EasyTuple/EasyTuple.h>

static const NSInteger maxValuesLength = 30;

#define EZRValueTraceTable(_) \
_(NSString *, value) \
_(NSDate *, time)

EZTNamedTupleDef(EZRValueTrace)
EZTNamedTupleImp(EZRValueTrace)

@interface EZRNodeValueTraceCell () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (readonly, nonatomic) NSMutableArray<EZRValueTrace *> *values;

@end

@implementation EZRNodeValueTraceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _offset = [EZRMutableNode new];
    _nodeValue = [EZRMutableNode new];
    _tracerColor = [UIColor redColor];
    _nodeValueColor = [UIColor whiteColor];
    
    @ezr_weakify(self)
    [[self.offset listenedBy:self] withContextBlock:^(NSValue * _Nullable next, id  _Nullable context) {
        @ezr_strongify(self)
        if (![context isEqualToString:[self uniqueContext]]) {
            [self.scrollView setContentOffset:next.CGPointValue animated:NO];
        }
    }];
    [[self.nodeValue listenedBy:self] withBlock:^(NSString * _Nullable next) {
        @ezr_strongify(self)
        [self addNodeValue:next];
    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self.offset setValue:@(scrollView.contentOffset) context:[self uniqueContext]];
}

- (NSString *)uniqueContext {
    return [NSString stringWithFormat:@"ezr_traceCell_%p", self];
}

- (void)addNodeValue:(NSString *)value {
    CGRect frame = self.frame;
    frame.size.height -= 16;
    frame.size.width = frame.size.height;
    frame.origin.y = 8;
    frame.origin.x = 8;
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.layer.cornerRadius = frame.size.height / 2;
    label.layer.backgroundColor = self.tracerColor.CGColor;
    label.textColor = self.nodeValueColor;
    label.text = value;
    label.textAlignment = NSTextAlignmentCenter;
    [self.scrollView addSubview:label];
}

@end
