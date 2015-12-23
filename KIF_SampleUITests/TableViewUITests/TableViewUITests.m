//
//  TableViewUITests.m
//  KIF_Sample
//
//  Created by daisuke on 2015/12/10.
//  Copyright © 2015年 dse12345z. All rights reserved.
//

#import "TableViewUITests.h"

@implementation TableViewUITests

- (void)beforeEach {
}

- (void)afterEach {
}

- (void)testTableViewFetchData {
    [tester tapViewWithAccessibilityLabel:@"帳號"];
    [tester waitForTimeInterval:5.0f];
    [tester clearTextFromFirstResponder];
    [tester waitForTimeInterval:5.0f];
    [tester enterTextIntoCurrentFirstResponder:@"daisuke"];
    [tester waitForTimeInterval:5.0f];
    
    [tester tapViewWithAccessibilityLabel:@"密碼"];
    [tester waitForTimeInterval:5.0f];
    [tester clearTextFromFirstResponder];
    [tester waitForTimeInterval:5.0f];
    [tester enterTextIntoCurrentFirstResponder:@"daisuke"];
    [tester waitForTimeInterval:5.0f];
    
    if ([tester tryFindingViewWithAccessibilityLabel:@"Done" traits:UIAccessibilityTraitKeyboardKey error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"Done" traits:UIAccessibilityTraitKeyboardKey];
        [tester waitForTimeInterval:5.0f];
    }
    
    if ([tester tryFindingViewWithAccessibilityLabel:@"登入" traits:UIAccessibilityTraitButton error:nil]) {
        [tester tapViewWithAccessibilityLabel:@"登入"];
        [tester waitForTimeInterval:5.0f];
    }
    
    UITextField *accountTextField = (UITextField *)[tester waitForViewWithAccessibilityLabel:@"帳號"];
    UITextField *passwordTextField = (UITextField *)[tester waitForViewWithAccessibilityLabel:@"密碼"];
    if ([accountTextField.text isEqualToString:@"daisuke"] && [passwordTextField.text isEqualToString:@"daisuke"]) {
        // 登入成功, 取消 Alert 提醒
        [tester tapViewWithAccessibilityLabel:@"確定"];
        [tester waitForTimeInterval:5.0f];
    }
    
    UITableView *tableView = (UITableView *)[tester waitForViewWithAccessibilityLabel:@"列表"];
    do {
        [tester waitForTimeInterval:5.0f];
    }
    while ([tableView.dataSource tableView:tableView numberOfRowsInSection:0] == 0);
    [tester waitForTimeInterval:5.0f];
}

@end
