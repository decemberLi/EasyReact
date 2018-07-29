/**
 * Beijing Sankuai Online Technology Co.,Ltd (Meituan)
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

#import "EZRForkViewController.h"
#import <EasyReact/EasyReact.h>
#import "UITextField+EZR_Extension.h"
#import "EZRNodeValueTraceCell.h"

@interface EZRForkViewController ()
@property (weak, nonatomic) IBOutlet UITextField *aTextField;
@property (weak, nonatomic) IBOutlet UITextField *bTextField;
@property (strong, nonatomic) EZRNodeValueTraceCell *aNodeValueTraceCell;
@property (strong, nonatomic) EZRNodeValueTraceCell *bNodeValueTraceCell;

@end

@implementation EZRForkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *traceCellNib = [UINib nibWithNibName:@"EZRNodeValueTraceCell" bundle:NSBundle.mainBundle];
    [self.tableView registerNib:traceCellNib forCellReuseIdentifier:@"TraceCell"];
    
    EZRNode *node = [self.aTextField.ezr_textNode fork];
    [self.bTextField.ezr_textNode linkTo:node];
    @ezr_weakify(self)
    [[EZRCombine([EZR_PATH(self, aNodeValueTraceCell) ignore:nil],
                 [EZR_PATH(self, bNodeValueTraceCell) ignore:nil]) listenedBy:self]
     withBlock:^(id  _Nullable _) {
        @ezr_strongify(self)
        [self bindTraceCells];
    }];
}

- (void)bindTraceCells {
    self.aNodeValueTraceCell.nodeValue.value = @"1111";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1 && indexPath.section == 0) {
        if (self.aNodeValueTraceCell == nil) {
            self.aNodeValueTraceCell = [tableView dequeueReusableCellWithIdentifier:@"TraceCell" forIndexPath:indexPath];
        }
        return self.aNodeValueTraceCell;
    }
    if (indexPath.row == 4 && indexPath.section == 0) {
        if (self.bNodeValueTraceCell == nil) {
            self.bNodeValueTraceCell = [tableView dequeueReusableCellWithIdentifier:@"TraceCell" forIndexPath:indexPath];
        }
        return self.bNodeValueTraceCell;
    }
    return [super tableView:tableView cellForRowAtIndexPath:indexPath];
}

@end
